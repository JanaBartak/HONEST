###############################################################################
# In this file, ICD codes will be merged into the new dataset from script 02_ 
# and new variables will be created:
# NOTE: If you run the codes, please DO NOT execute step 6 (saving)
# 0. Install/load Packages
# 1. Set Work Directory
# 2. Load datasets (new dataset from script 02_)
# 3. Load ICD-codes
# 4. Merge ICD dataset into New.M.E.Med.xxxx dataset
# 5. Create new and needed variables
# (6. Save New.Sub1 datasets (please do not execute!))
###############################################################################
# 0. Install/load Packages ----
library(dplyr)


# 1. Set Work Directory ----
setwd("/Volumes/research$/HONEST Team/Data/")


# 2. Load New.M.E. datasets ----
## 2020 ----
New.M.E.Med.K1.Adult.2020.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2020.365.txt", 
                                       sep = ";")

## 2019 ----
New.M.E.Med.K1.Adult.2019.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2019.365.txt", 
                                       sep = ";")

## 2018 ----
New.M.E.Med.K1.Adult.2018.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.M.E.Med.K1.Adult.2018.365.txt", 
                                       sep = ";")

# 3. Load ICD-codes ----
ICD_Codes <- read_csv("aim2_ICD-codes/ICD_Codes.csv")


# 4. Merge ICD dataset into New.M.E.Med.xxxx dataset ----
## 2020 ----
New.M.E.Med.K1.Adult.2020.365 <- New.M.E.Med.K1.Adult.2020.365 %>% 
  mutate(ICD = stringr::str_sub(New.M.E.Med.K1.Adult.2020.365$main.diag, 1, 3)) %>%
  left_join(ICD_Codes, by = "ICD")

## 2019 ----
New.M.E.Med.K1.Adult.2019.365 <- New.M.E.Med.K1.Adult.2019.365 %>% 
  mutate(ICD = stringr::str_sub(New.M.E.Med.K1.Adult.2019.365$main.diag, 1, 3)) %>%
  left_join(ICD_Codes, by = "ICD")

## 2018 ----
New.M.E.Med.K1.Adult.2018.365 <- New.M.E.Med.K1.Adult.2018.365 %>% 
  mutate(ICD = stringr::str_sub(New.M.E.Med.K1.Adult.2018.365$main.diag, 1, 3)) %>%
  left_join(ICD_Codes, by = "ICD")

rm(ICD_Codes)


# 5. Create new and needed variables ----
## 2020 ----
### Age in 10 year steps ----
New.Sub1.2020.365 = New.M.E.Med.K1.Adult.2020.365 %>%
  mutate(
    Age.Gr.10yrs = case_when(
      Age.Gr.5yrs %in% c("20-24", "25-29") ~ "20-29",
      Age.Gr.5yrs %in% c("30-34", "35-39") ~ "30-39",
      Age.Gr.5yrs %in% c("40-44", "45-49") ~ "40-49",
      Age.Gr.5yrs %in% c("50-54", "55-59") ~ "50-59",
      Age.Gr.5yrs %in% c("60-64", "65-69") ~ "60-69",
      Age.Gr.5yrs %in% c("70-74", "75-79") ~ "70-79",
      Age.Gr.5yrs %in% c("80-84", "85-89") ~ "80-89",
      Age.Gr.5yrs %in% c("90-94", "95+") ~ "90+"))

table(New.Sub1.2020.365$Age.Gr.5yrs, useNA = "always")
table(New.Sub1.2020.365$Age.Gr.10yrs, useNA = "always")

### Sex ----
New.Sub1.2020.365$Sex <- NA
New.Sub1.2020.365$Sex[New.Sub1.2020.365$Gender %in% 1] <- "Male"
New.Sub1.2020.365$Sex[New.Sub1.2020.365$Gender %in% 2] <- "Female"

New.Sub1.2020.365 <- New.Sub1.2020.365 %>%
  mutate(Sex = factor(Sex, levels = c("Female", "Male")))

table(New.Sub1.2020.365$Gender, useNA = "always")
table(New.Sub1.2020.365$Sex, useNA = "always")


### Hospital Type --> Level ----
New.Sub1.2020.365 = New.Sub1.2020.365 %>%
  mutate(
    Hosp.Level = case_when(
      Hosp.Typo == "K111" ~ "Level 1",
      Hosp.Typo == "K112" ~ "Level 2",
      Hosp.Typo == "K121" ~ "Level 3",
      Hosp.Typo == "K122" ~ "Level 4"))

table(New.Sub1.2020.365$Hosp.Typo, useNA = "always")
table(New.Sub1.2020.365$Hosp.Level, useNA = "always")

### Main diagnosis, lowest level of detail ----
sort(table(New.Sub1.2020.365$Names1), decreasing = TRUE) 
# 1. Circulatory system diseases
# 2. Traumatic injuries, poisonings and some other consequences of external causes
# 3. Tumors

New.Sub1.2020.365 <- New.Sub1.2020.365 %>%
  mutate(MD.lowest = case_when(
    Names1 %in% "Circulatory system diseases" ~ "Circulatory system diseases",
    Names1 %in% "Traumatic injuries, poisonings and some other consequences of external causes" ~ "Traumatic injuries, poisonings and some other consequences of external causes",
    Names1 %in% "Tumors" ~"Tumors",
    TRUE ~ "Other"))

table(New.Sub1.2020.365$MD.lowest, useNA = "always")

# -> change levels & check
New.Sub1.2020.365 <- New.Sub1.2020.365 %>%
  mutate(MD.lowest = factor(MD.lowest, levels = c("Circulatory system diseases", 
                                                  "Traumatic injuries, poisonings and some other consequences of external causes", 
                                                  "Tumors", "Other")))

table(New.Sub1.2020.365$MD.lowest, useNA = "always")

### Mortality.di --> numeric ----
New.Sub1.2020.365 <- New.Sub1.2020.365 %>%
  mutate(Mort.numeric = ifelse(Mortality.di == "deceased", 1, 0))

table(New.Sub1.2020.365$Mortality.di, useNA = "always")
table(New.Sub1.2020.365$Mort.numeric, useNA = "always")

### keep needed variables from patient data 2020 ----
New.Sub1.2020.365 <- New.Sub1.2020.365 %>%
  select(X_ID, Year, Hosp.Typo, Hosp.Level, BUR.NR, LoS.DRG, ICU.stay, Gender, Sex, 
         Age.Gr.5yrs, Age.Gr.10yrs, Admission.month, Admission.type, Admission.body, 
         Decision.discharge, main.diag, Names1, MD.lowest, Swiss_eci.20, Swiss_eci.20.Gr, 
         Mortality.di, Mort.numeric, TODESDATUM_30)

## 2019 ----
### Age in 10 year steps ----
New.Sub1.2019.365 = New.M.E.Med.K1.Adult.2019.365 %>%
  mutate(
    Age.Gr.10yrs = case_when(
      Age.Gr.5yrs %in% c("20-24", "25-29") ~ "20-29",
      Age.Gr.5yrs %in% c("30-34", "35-39") ~ "30-39",
      Age.Gr.5yrs %in% c("40-44", "45-49") ~ "40-49",
      Age.Gr.5yrs %in% c("50-54", "55-59") ~ "50-59",
      Age.Gr.5yrs %in% c("60-64", "65-69") ~ "60-69",
      Age.Gr.5yrs %in% c("70-74", "75-79") ~ "70-79",
      Age.Gr.5yrs %in% c("80-84", "85-89") ~ "80-89",
      Age.Gr.5yrs %in% c("90-94", "95+") ~ "90+"))

table(New.Sub1.2019.365$Age.Gr.5yrs, useNA = "always")
table(New.Sub1.2019.365$Age.Gr.10yrs, useNA = "always")

### Sex ----
New.Sub1.2019.365$Sex <- NA
New.Sub1.2019.365$Sex[New.Sub1.2019.365$Gender %in% 1] <- "Male"
New.Sub1.2019.365$Sex[New.Sub1.2019.365$Gender %in% 2] <- "Female"

New.Sub1.2019.365 <- New.Sub1.2019.365 %>%
  mutate(Sex = factor(Sex, levels = c("Female", "Male")))

table(New.Sub1.2019.365$Gender, useNA = "always")
table(New.Sub1.2019.365$Sex, useNA = "always")

### Hospital Type --> Level ----
New.Sub1.2019.365 = New.Sub1.2019.365 %>%
  mutate(
    Hosp.Level = case_when(
      Hosp.Typo == "K111" ~ "Level 1",
      Hosp.Typo == "K112" ~ "Level 2",
      Hosp.Typo == "K121" ~ "Level 3",
      Hosp.Typo == "K122" ~ "Level 4"))

table(New.Sub1.2019.365$Hosp.Typo, useNA = "always")
table(New.Sub1.2019.365$Hosp.Level, useNA = "always")

### Main diagnosis, lowest level of detail ----
sort(table(New.Sub1.2019.365$Names1), decreasing = TRUE) 
# 1. Circulatory system diseases
# 2. Traumatic injuries, poisonings and some other consequences of external causes
# 3. Tumors

New.Sub1.2019.365 <- New.Sub1.2019.365 %>%
  mutate(MD.lowest = case_when(
    Names1 %in% "Circulatory system diseases" ~ "Circulatory system diseases",
    Names1 %in% "Traumatic injuries, poisonings and some other consequences of external causes" ~ "Traumatic injuries, poisonings and some other consequences of external causes",
    Names1 %in% "Tumors" ~"Tumors",
    TRUE ~ "Other"))

table(New.Sub1.2019.365$MD.lowest, useNA = "always")

# -> change levels & check
New.Sub1.2019.365 <- New.Sub1.2019.365 %>%
  mutate(MD.lowest = factor(MD.lowest, levels = c("Circulatory system diseases", 
                                                  "Traumatic injuries, poisonings and some other consequences of external causes", 
                                                  "Tumors", "Other")))

table(New.Sub1.2019.365$MD.lowest, useNA = "always")

### Mortality.di --> numeric ----
New.Sub1.2019.365 <- New.Sub1.2019.365 %>%
  mutate(Mort.numeric = ifelse(Mortality.di == "deceased", 1, 0))

table(New.Sub1.2019.365$Mortality.di, useNA = "always")
table(New.Sub1.2019.365$Mort.numeric, useNA = "always")

### keep needed variables from patient data 2019 ----
New.Sub1.2019.365 <- New.Sub1.2019.365 %>%
  select(X_ID, Year, Hosp.Typo, Hosp.Level, BUR.NR, LoS.DRG, ICU.stay, Gender, Sex, 
         Age.Gr.5yrs, Age.Gr.10yrs, Admission.month, Admission.type, Admission.body, 
         Decision.discharge, main.diag, Names1, MD.lowest, Swiss_eci.19, Swiss_eci.19.Gr, 
         Mortality.di, Mort.numeric, TODESDATUM_30)

## 2018 ----
### Age in 10 year steps ----
New.Sub1.2018.365 = New.M.E.Med.K1.Adult.2018.365 %>%
  mutate(
    Age.Gr.10yrs = case_when(
      Age.Gr.5yrs %in% c("20-24", "25-29") ~ "20-29",
      Age.Gr.5yrs %in% c("30-34", "35-39") ~ "30-39",
      Age.Gr.5yrs %in% c("40-44", "45-49") ~ "40-49",
      Age.Gr.5yrs %in% c("50-54", "55-59") ~ "50-59",
      Age.Gr.5yrs %in% c("60-64", "65-69") ~ "60-69",
      Age.Gr.5yrs %in% c("70-74", "75-79") ~ "70-79",
      Age.Gr.5yrs %in% c("80-84", "85-89") ~ "80-89",
      Age.Gr.5yrs %in% c("90-94", "95+") ~ "90+"))

table(New.Sub1.2018.365$Age.Gr.5yrs, useNA = "always")
table(New.Sub1.2018.365$Age.Gr.10yrs, useNA = "always")

### Sex ----
New.Sub1.2018.365$Sex <- NA
New.Sub1.2018.365$Sex[New.Sub1.2018.365$Gender %in% 1] <- "Male"
New.Sub1.2018.365$Sex[New.Sub1.2018.365$Gender %in% 2] <- "Female"

New.Sub1.2018.365 <- New.Sub1.2018.365 %>%
  mutate(Sex = factor(Sex, levels = c("Female", "Male")))

table(New.Sub1.2018.365$Gender, useNA = "always")
table(New.Sub1.2018.365$Sex, useNA = "always")

### Hospital Type --> Level ----
New.Sub1.2018.365 = New.Sub1.2018.365 %>%
  mutate(
    Hosp.Level = case_when(
      Hosp.Typo == "K111" ~ "Level 1",
      Hosp.Typo == "K112" ~ "Level 2",
      Hosp.Typo == "K121" ~ "Level 3",
      Hosp.Typo == "K122" ~ "Level 4"))

table(New.Sub1.2018.365$Hosp.Typo, useNA = "always")
table(New.Sub1.2018.365$Hosp.Level, useNA = "always")

### Main diagnosis, lowest level of detail ----
sort(table(New.Sub1.2018.365$Names1), decreasing = TRUE) 
# 1. Traumatic injuries, poisonings and some other consequences of external causes
# 2. Circulatory system diseases
# 3. Diseases of the osteo-articular system, muscles and connective tissue

New.Sub1.2018.365 <- New.Sub1.2018.365 %>%
  mutate(MD.lowest = case_when(
    Names1 %in% "Traumatic injuries, poisonings and some other consequences of external causes" ~ "Traumatic injuries, poisonings and some other consequences of external causes",
    Names1 %in% "Circulatory system diseases" ~ "Circulatory system diseases",
    Names1 %in% "Diseases of the osteo-articular system, muscles and connective tissue" ~"Diseases of the osteo-articular system, muscles and connective tissue",
    TRUE ~ "Other"))

table(New.Sub1.2018.365$MD.lowest, useNA = "always")

# -> change levels & check
New.Sub1.2018.365 <- New.Sub1.2018.365 %>%
  mutate(MD.lowest = factor(MD.lowest, levels = c("Traumatic injuries, poisonings and some other consequences of external causes", 
                                                "Circulatory system diseases", 
                                                "Diseases of the osteo-articular system, muscles and connective tissue", "Other")))

table(New.Sub1.2018.365$MD.lowest, useNA = "always")

### Mortality.di --> numeric ----
New.Sub1.2018.365 <- New.Sub1.2018.365 %>%
  mutate(Mort.numeric = ifelse(Mortality.di == "deceased", 1, 0))

table(New.Sub1.2018.365$Mortality.di, useNA = "always")
table(New.Sub1.2018.365$Mort.numeric, useNA = "always")

### keep needed variables from patient data 2018 ----
New.Sub1.2018.365 <- New.Sub1.2018.365 %>%
  select(X_ID, Year, Hosp.Typo, Hosp.Level, BUR.NR, LoS.DRG, ICU.stay, Gender, Sex, 
       Age.Gr.5yrs, Age.Gr.10yrs, Admission.month, Admission.type, Admission.body, 
       Decision.discharge, main.diag, Names1, MD.lowest, Swiss_eci.18, Swiss_eci.18.Gr, 
       Mortality.di, Mort.numeric, TODESDATUM_30)


# 6. Save New.Sub1 datasets (please do not execute!) ----
## 2020 ----
data.table::fwrite(x = New.Sub1.2020.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Sub1.2020.365.txt", 
                   sep = ";")

## 2019 ----
data.table::fwrite(x = New.Sub1.2019.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Sub1.2019.365.txt", 
                   sep = ";")

## 2018 ----
data.table::fwrite(x = New.Sub1.2018.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Sub1.2018.365.txt", 
                   sep = ";")


