###############################################################################
# In this file, the Elixhauser and Mortality variable will be created:
# NOTE: If you run the codes, please DO NOT execute step 5 (saving)
# 0. Install/load Packages
# 1. Set Work Directory
# 2. Load datasets (new dataset from script 01_)
# 3. Create Elixhauser
# 4. Create mortality variable
# (5. Save new subset  (please do not execute!))
###############################################################################
# 0. Install/load Packages ----
library(dplyr)
library(comorbidity)


# 1. Set Work Directory ----
setwd("/Volumes/research$/HONEST Team/Data/")


# 2. Load datasets (new dataset from script 01_) ----
## 2020 ----
New.Med.K1.Adult.2020.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2020.365.txt", 
                                               sep = ";")

## 2019 ----
New.Med.K1.Adult.2019.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2019.365.txt", 
                                               sep = ";")

## 2018 ----
New.Med.K1.Adult.2018.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2018.365.txt", 
                                               sep = ";")


# 3. Create Elixhauser ----
## Elix 2020 ----
New.Med.Elix.2020 <- New.Med.K1.Adult.2020.365[, c("X_ID", "main.diag", "X_4_2_V020", "X_4_2_V030", "X_4_2_V040", 
                                                   "X_4_2_V050", "X_4_2_V060", "X_4_2_V070", "X_4_2_V080", "X_4_2_V090",
                                                   "X_4_2_V100", "X_4_2_V110", "X_4_2_V120", "X_4_2_V130", "X_4_2_V140", 
                                                   "X_4_2_V150", "X_4_2_V160", "X_4_2_V170", "X_4_2_V180", "X_4_2_V190", 
                                                   "X_4_2_V200", "X_4_2_V210", "X_4_2_V220", "X_4_2_V230", "X_4_2_V240", 
                                                   "X_4_2_V250", "X_4_2_V260", "X_4_2_V270", "X_4_2_V280", "X_4_2_V290", 
                                                   "X_4_2_V300", "X_4_2_V310", "X_4_2_V320", "X_4_2_V330", "X_4_2_V340", 
                                                   "X_4_2_V350", "X_4_2_V360", "X_4_2_V370", "X_4_2_V380", "X_4_2_V390", 
                                                   "X_4_2_V400", "X_4_2_V410", "X_4_2_V420", "X_4_2_V430", "X_4_2_V440", 
                                                   "X_4_2_V450", "X_4_2_V460", "X_4_2_V470", "X_4_2_V480", "X_4_2_V490", 
                                                   "X_4_2_V500", "X_4_2_V510")]


### Going from  wide to long format
New.Med.Elix.2020.m <- reshape2::melt(New.Med.Elix.2020, id.vars = "X_ID")

### Create Elixhauser comordity code
new.elixhauser.2020 <- comorbidity::comorbidity(x = New.Med.Elix.2020.m, 
                                                id = "X_ID", 
                                                code = "value", 
                                                map = "elixhauser_icd10_quan", 
                                                assign0 = FALSE)

Swiss_eci.20 <- comorbidity::score(new.elixhauser.2020, weights = "swiss", assign0 = FALSE)

vW_eci.20 <- comorbidity::score(new.elixhauser.2020, weights = "vw", assign0 = FALSE)

New.E.test2020 <- cbind(New.Med.Elix.2020, Swiss_eci.20, vW_eci.20) %>%
  select(X_ID, Swiss_eci.20, vW_eci.20)

New.E.Med.K1.Adult.2020.365 <- left_join(New.Med.K1.Adult.2020.365, New.E.test2020, by = "X_ID")

## Elix 2019 ----
New.Med.Elix.2019 <- New.Med.K1.Adult.2019.365[, c("X_ID", "main.diag", "X_4_2_V020", "X_4_2_V030", "X_4_2_V040", 
                                                   "X_4_2_V050", "X_4_2_V060", "X_4_2_V070", "X_4_2_V080", "X_4_2_V090",
                                                   "X_4_2_V100", "X_4_2_V110", "X_4_2_V120", "X_4_2_V130", "X_4_2_V140", 
                                                   "X_4_2_V150", "X_4_2_V160", "X_4_2_V170", "X_4_2_V180", "X_4_2_V190", 
                                                   "X_4_2_V200", "X_4_2_V210", "X_4_2_V220", "X_4_2_V230", "X_4_2_V240", 
                                                   "X_4_2_V250", "X_4_2_V260", "X_4_2_V270", "X_4_2_V280", "X_4_2_V290", 
                                                   "X_4_2_V300", "X_4_2_V310", "X_4_2_V320", "X_4_2_V330", "X_4_2_V340", 
                                                   "X_4_2_V350", "X_4_2_V360", "X_4_2_V370", "X_4_2_V380", "X_4_2_V390", 
                                                   "X_4_2_V400", "X_4_2_V410", "X_4_2_V420", "X_4_2_V430", "X_4_2_V440", 
                                                   "X_4_2_V450", "X_4_2_V460", "X_4_2_V470", "X_4_2_V480", "X_4_2_V490", 
                                                   "X_4_2_V500", "X_4_2_V510")]


### Going from  wide to long format
New.Med.Elix.2019.m <- reshape2::melt(New.Med.Elix.2019, id.vars = "X_ID")

### Create Elixhauser comordity code
new.elixhauser.2019 <- comorbidity::comorbidity(x = New.Med.Elix.2019.m, 
                                                id = "X_ID", 
                                                code = "value", 
                                                map = "elixhauser_icd10_quan", 
                                                assign0 = FALSE)

Swiss_eci.19 <- comorbidity::score(new.elixhauser.2019, weights = "swiss", assign0 = FALSE)

vW_eci.19 <- comorbidity::score(new.elixhauser.2019, weights = "vw", assign0 = FALSE)

New.E.test2019 <- cbind(New.Med.Elix.2019, Swiss_eci.19, vW_eci.19) %>%
  select(X_ID, Swiss_eci.19, vW_eci.19)

New.E.Med.K1.Adult.2019.365 <- left_join(New.Med.K1.Adult.2019.365, New.E.test2019, by = "X_ID")

## Elix 2018 ----
New.Med.Elix.2018 <- New.Med.K1.Adult.2018.365[, c("X_ID", "main.diag", "X_4_2_V020", "X_4_2_V030", "X_4_2_V040", 
                                                   "X_4_2_V050", "X_4_2_V060", "X_4_2_V070", "X_4_2_V080", "X_4_2_V090",
                                                   "X_4_2_V100", "X_4_2_V110", "X_4_2_V120", "X_4_2_V130", "X_4_2_V140", 
                                                   "X_4_2_V150", "X_4_2_V160", "X_4_2_V170", "X_4_2_V180", "X_4_2_V190", 
                                                   "X_4_2_V200", "X_4_2_V210", "X_4_2_V220", "X_4_2_V230", "X_4_2_V240", 
                                                   "X_4_2_V250", "X_4_2_V260", "X_4_2_V270", "X_4_2_V280", "X_4_2_V290", 
                                                   "X_4_2_V300", "X_4_2_V310", "X_4_2_V320", "X_4_2_V330", "X_4_2_V340", 
                                                   "X_4_2_V350", "X_4_2_V360", "X_4_2_V370", "X_4_2_V380", "X_4_2_V390", 
                                                   "X_4_2_V400", "X_4_2_V410", "X_4_2_V420", "X_4_2_V430", "X_4_2_V440", 
                                                   "X_4_2_V450", "X_4_2_V460", "X_4_2_V470", "X_4_2_V480", "X_4_2_V490", 
                                                   "X_4_2_V500", "X_4_2_V510")]


### Going from  wide to long format
New.Med.Elix.2018.m <- reshape2::melt(New.Med.Elix.2018, id.vars = "X_ID")

### Create Elixhauser comordity code
new.elixhauser.2018 <- comorbidity::comorbidity(x = New.Med.Elix.2018.m, 
                                                id = "X_ID", 
                                                code = "value", 
                                                map = "elixhauser_icd10_quan", 
                                                assign0 = FALSE)

Swiss_eci.18 <- comorbidity::score(new.elixhauser.2018, weights = "swiss", assign0 = FALSE)

vW_eci.18 <- comorbidity::score(new.elixhauser.2018, weights = "vw", assign0 = FALSE)

New.E.test2018 <- cbind(New.Med.Elix.2018, Swiss_eci.18, vW_eci.18) %>%
  select(X_ID, Swiss_eci.18, vW_eci.18)

New.E.Med.K1.Adult.2018.365 <- left_join(New.Med.K1.Adult.2018.365, New.E.test2018, by = "X_ID")

## Remove datasets & values no more needed ----
rm(New.E.test2018, New.E.test2019, New.E.test2020, new.elixhauser.2018, new.elixhauser.2019, new.elixhauser.2020, New.Med.Elix.2018, New.Med.Elix.2019, New.Med.Elix.2020,
   New.Med.Elix.2018.m, New.Med.Elix.2019.m, New.Med.Elix.2020.m, Swiss_eci.18, Swiss_eci.19, Swiss_eci.20, vW_eci.18, vW_eci.19, vW_eci.20)  

## Create Elix Groups and attach to dataset (same as first patient data!) ----
### 2020 ----
New.E.Med.K1.Adult.2020.365 <- New.E.Med.K1.Adult.2020.365 %>% 
  mutate(Swiss_eci.20.Gr = case_when(
    Swiss_eci.20 < 0 ~ "<0",
    Swiss_eci.20 == 0 ~ "0",
    Swiss_eci.20 > 0 & Swiss_eci.20 < 5 ~ "1-5",
    Swiss_eci.20 >= 5 ~ ">=5"))

New.E.Med.K1.Adult.2020.365 <- New.E.Med.K1.Adult.2020.365 %>%
  mutate(vW_eci.20.Gr = case_when(
    vW_eci.20 < 0 ~ "<0",
    vW_eci.20 == 0 ~ "0",
    vW_eci.20 > 0 & vW_eci.20 < 5 ~ "1-5",
    vW_eci.20 >= 5 ~ ">=5"))

### 2019 ----
New.E.Med.K1.Adult.2019.365 <- New.E.Med.K1.Adult.2019.365 %>% 
  mutate(Swiss_eci.19.Gr = case_when(
    Swiss_eci.19 < 0 ~ "<0",
    Swiss_eci.19 == 0 ~ "0",
    Swiss_eci.19 > 0 & Swiss_eci.19 < 5 ~ "1-5",
    Swiss_eci.19 >= 5 ~ ">=5"))

New.E.Med.K1.Adult.2019.365 <- New.E.Med.K1.Adult.2019.365 %>%
  mutate(vW_eci.19.Gr = case_when(
    vW_eci.19 < 0 ~ "<0",
    vW_eci.19 == 0 ~ "0",
    vW_eci.19 > 0 & vW_eci.19 < 5 ~ "1-5",
    vW_eci.19 >= 5 ~ ">=5"))

### 2018 ----
New.E.Med.K1.Adult.2018.365 <- New.E.Med.K1.Adult.2018.365 %>% 
  mutate(Swiss_eci.18.Gr = case_when(
    Swiss_eci.18 < 0 ~ "<0",
    Swiss_eci.18 == 0 ~ "0",
    Swiss_eci.18 > 0 & Swiss_eci.18 < 5 ~ "1-5",
    Swiss_eci.18 >= 5 ~ ">=5"))

New.E.Med.K1.Adult.2018.365 <- New.E.Med.K1.Adult.2018.365 %>%
  mutate(vW_eci.18.Gr = case_when(
    vW_eci.18 < 0 ~ "<0",
    vW_eci.18 == 0 ~ "0",
    vW_eci.18 > 0 & vW_eci.18 < 5 ~ "1-5",
    vW_eci.18 >= 5 ~ ">=5"))


# 4. Create mortality variable ----
## 2020 ----
New.M.E.Med.K1.Adult.2020.365 <- New.E.Med.K1.Adult.2020.365 %>%
  mutate(Mortality.di = case_when(
    Decision.discharge == 5 & LoS.DRG <= 30 | TODESDATUM_30 == 1 ~ "deceased",
    TRUE ~ "alive"
  ))

table(New.M.E.Med.K1.Adult.2020.365$Mortality.di, useNA = "always")

round(prop.table(table(New.M.E.Med.K1.Adult.2020.365$Mortality.di, useNA = "always")) *100, 1)

## 2019 ----
New.M.E.Med.K1.Adult.2019.365 <- New.E.Med.K1.Adult.2019.365 %>%
  mutate(Mortality.di = case_when(
    Decision.discharge == 5 & LoS.DRG <= 30 | TODESDATUM_30 == 1 ~ "deceased",
    TRUE ~ "alive"
  ))

table(New.M.E.Med.K1.Adult.2019.365$Mortality.di, useNA = "always")

round(prop.table(table(New.M.E.Med.K1.Adult.2019.365$Mortality.di, useNA = "always")) *100, 1)

## 2018 ----
New.M.E.Med.K1.Adult.2018.365 <- New.E.Med.K1.Adult.2018.365 %>%
  mutate(Mortality.di = case_when(
    Decision.discharge == 5 & LoS.DRG <= 30 | TODESDATUM_30 == 1 ~ "deceased",
    TRUE ~ "alive"
  ))

table(New.M.E.Med.K1.Adult.2018.365$Mortality.di, useNA = "always")

round(prop.table(table(New.M.E.Med.K1.Adult.2018.365$Mortality.di, useNA = "always")) *100, 1)


# 5. Save new subset  (please do not execute!) ----
## 2020 ----
data.table::fwrite(x = New.M.E.Med.K1.Adult.2020.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2020.365.txt", 
                   sep = ";")

## 2019 ----
data.table::fwrite(x = New.M.E.Med.K1.Adult.2019.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2019.365.txt", 
                   sep = ";")

## 2018 ----
data.table::fwrite(x = New.M.E.Med.K1.Adult.2018.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2018.365.txt", 
                   sep = ";")
