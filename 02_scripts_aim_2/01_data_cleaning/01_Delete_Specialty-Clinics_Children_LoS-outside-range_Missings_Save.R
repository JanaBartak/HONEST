###############################################################################
# This is the cleaning file, where exclusion criteria are applied:
# NOTE: If you run the codes, please DO NOT execute step 9 (saving)
# 0. Install/load Packages
# 1. Set Work Directory
# 2. Load datasets (new dataset from script 00_)
# 3. Rename Variables of Interest
# 4. Delete Specialty Clinics / Keep only K1 clinics
# 5. Delete Children / Keep only K1 & Adults
# 6. Delete LoS >/= 365 days (missings are included)
# 7. Delete missings (they are in variable LoS & ICU))
# 8. Delete cases with no MD (missings are coded as "")
# (9. Save new clean data  (please do not execute!))
###############################################################################
# 0. Install/load Packages ----
library(dplyr)


# 1. Set Work Directory ----
setwd("/Volumes/research$/HONEST Team/Data/")


# 2. Load datasets (new dataset from script 00_) ----
## 2020 ----
New.Med.2020 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.2020.txt", 
                                  sep = ";")

## 2019 ----
New.Med.2019 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.2019.txt", 
                                  sep = ";")

## 2018 ----
New.Med.2018 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Med.2018.txt", 
                                  sep = ";")


### adjust variable types for variables needed later:
char_vars <- c("X_ID", "X_4_3_V010", "X_4_3_V020", "X_4_3_V030", "X_4_3_V040", 
               "X_4_3_V050", "X_4_3_V060", "X_4_3_V070", "X_4_3_V080", 
               "X_4_3_V090", "X_4_3_V100", "X_4_3_V110", "X_4_3_V120", 
               "X_4_3_V130", "X_4_3_V140", "X_4_3_V150", "X_4_3_V160", 
               "X_4_3_V170", "X_4_3_V180", "X_4_3_V190", "X_4_3_V200", 
               "X_4_3_V210", "X_4_3_V220", "X_4_3_V230", "X_4_3_V240", 
               "X_4_3_V250", "X_4_3_V260", "X_4_3_V270", "X_4_3_V280", 
               "X_4_3_V290", "X_4_3_V300", "X_4_3_V310", "X_4_3_V320", 
               "X_4_3_V330", "X_4_3_V340", "X_4_3_V350", "X_4_3_V360", 
               "X_4_3_V370", "X_4_3_V380", "X_4_3_V390", "X_4_3_V400",
               "X_4_3_V410", "X_4_3_V420", "X_4_3_V430", "X_4_3_V440", 
               "X_4_3_V450", "X_4_3_V460", "X_4_3_V470", "X_4_3_V480", 
               "X_4_3_V490", "X_4_3_V500", "X_4_3_V510", "X_4_3_V520", 
               "X_4_3_V530", "X_4_3_V540", "X_4_3_V550", "X_4_3_V560", 
               "X_4_3_V570", "X_4_3_V580", "X_4_3_V590", "X_4_3_V600",
               "X_4_3_V610", "X_4_3_V620", "X_4_3_V630", "X_4_3_V640", 
               "X_4_3_V650", "X_4_3_V660", "X_4_3_V670", "X_4_3_V680", 
               "X_4_3_V690", "X_4_3_V700", "X_4_3_V710", "X_4_3_V720", 
               "X_4_3_V730", "X_4_3_V740", "X_4_3_V750", "X_4_3_V760", 
               "X_4_3_V770", "X_4_3_V780", "X_4_3_V790", "X_4_3_V800", 
               "X_4_3_V810", "X_4_3_V820", "X_4_3_V830", "X_4_3_V840", 
               "X_4_3_V850", "X_4_3_V860", "X_4_3_V870", "X_4_3_V880", 
               "X_4_3_V890", "X_4_3_V900", "X_4_3_V910", "X_4_3_V920", 
               "X_4_3_V930", "X_4_3_V940", "X_4_3_V950", "X_4_3_V960", 
               "X_4_3_V970", "X_4_3_V980", "X_4_3_V990", "X_4_3_V1000")

#### Apply as.character() to selected variables
New.Med.2020 <- mutate(New.Med.2020, across(all_of(char_vars), as.character))

New.Med.2019 <- mutate(New.Med.2019, across(all_of(char_vars), as.character))

New.Med.2018 <- mutate(New.Med.2018, across(all_of(char_vars), as.character))


# 3. Rename Variables of Interest ----
## 2020 ----
New.Med.2020 = New.Med.2020 %>% rename(Year = X_0_0_V01,
                                       Hosp.Typo = X_0_0_V02,
                                       BUR.NR = X_0_1_V02a, 
                                       LoS.DRG = X_0_0_V05_2, 
                                       Gender = X_1_1_V01,
                                       Age.Gr.5yrs = X_1_1_V03_5,
                                       Admission.month = X_1_2_V01M,
                                       Admission.type = X_1_2_V03,
                                       Admission.body = X_1_2_V04,
                                       ICU.stay = X_1_3_V03,
                                       Decision.discharge = X_1_5_V02,
                                       main.diag = X_4_2_V010)

## 2019 ----
New.Med.2019 = New.Med.2019 %>% rename(Year = X_0_0_V01,
                                       Hosp.Typo = X_0_0_V02,
                                       BUR.NR = X_0_1_V02a, 
                                       LoS.DRG = X_0_0_V05_2, 
                                       Gender = X_1_1_V01,
                                       Age.Gr.5yrs = X_1_1_V03_5,
                                       Admission.month = X_1_2_V01M,
                                       Admission.type = X_1_2_V03,
                                       Admission.body = X_1_2_V04,
                                       ICU.stay = X_1_3_V03,
                                       Decision.discharge = X_1_5_V02,
                                       main.diag = X_4_2_V010)

## 2018 ----
New.Med.2018 = New.Med.2018 %>% rename(Year = X_0_0_V01,
                               Hosp.Typo = X_0_0_V02,
                               BUR.NR = X_0_1_V02a, 
                               LoS.DRG = X_0_0_V05_2, 
                               Gender = X_1_1_V01,
                               Age.Gr.5yrs = X_1_1_V03_5,
                               Admission.month = X_1_2_V01M,
                               Admission.type = X_1_2_V03,
                               Admission.body = X_1_2_V04,
                               ICU.stay = X_1_3_V03,
                               Decision.discharge = X_1_5_V02,
                               main.diag = X_4_2_V010)


# 4. Delete Specialty Clinics / Keep only K1 clinics ----
## K1 2020 (- 255'102 cases) ----
New.Med.K1.2020 <- New.Med.2020[!(New.Med.2020$Hosp.Typo %in% 
                                    c("K123", "K211", "K212", "K221","K231", 
                                      "K232", "K233", "K234", "K235")), ]

## K1 2019 (- 262'310 cases) ----
New.Med.K1.2019 <- New.Med.2019[!(New.Med.2019$Hosp.Typo %in% 
                                    c("K123", "K211", "K212", "K221","K231", 
                                      "K232", "K233", "K234", "K235")), ]

## K1 2018 (- 265'989 cases) ----
New.Med.K1.2018 <- New.Med.2018[!(New.Med.2018$Hosp.Typo %in% 
                                    c("K123", "K211", "K212", "K221","K231", 
                                      "K232", "K233", "K234", "K235")), ]


# 5. Delete Children / Keep only K1 & Adults ----
## 2020 (- 144'766 cases)
New.Med.K1.Adult.2020 <- New.Med.K1.2020[!(New.Med.K1.2020$Age.Gr.5yrs %in% 
                                             c("0-4", "5-9", "10-14", "15-19")), ]

## 2019 (- 157'482 cases)
New.Med.K1.Adult.2019 <- New.Med.K1.2019[!(New.Med.K1.2019$Age.Gr.5yrs %in% 
                                             c("0-4", "5-9", "10-14", "15-19")), ]

## 2018
New.Med.K1.Adult.2018 <- New.Med.K1.2018[!(New.Med.K1.2018$Age.Gr.5yrs %in% 
                                             c("0-4", "5-9", "10-14", "15-19")), ]


# 6. Delete LoS >/= 365 days (missings are included) ----
## 2020 CAVE odd year --> limit 366 days (- 1'453 cases) ----
New.Med.K1.Adult.2020.365.NA <- New.Med.K1.Adult.2020[((is.na(New.Med.K1.Adult.2020$LoS.DRG) | 
                                                          (New.Med.K1.Adult.2020$LoS.DRG > 0 & 
                                                             New.Med.K1.Adult.2020$LoS.DRG < 367))), ]

### to see how many < 1 / > 366:
New.Med.K1.Adult.2020 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG > 366) %>%
  nrow()

New.Med.K1.Adult.2020 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG == 0) %>%
  nrow()

## 2019 (- 1'042 cases) ----
New.Med.K1.Adult.2019.365.NA <- New.Med.K1.Adult.2019[((is.na(New.Med.K1.Adult.2019$LoS.DRG) | 
                                                          (New.Med.K1.Adult.2019$LoS.DRG > 0 & 
                                                             New.Med.K1.Adult.2019$LoS.DRG < 366))), ]

### to see how many < 1 / > 365:
New.Med.K1.Adult.2019 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG > 365) %>%
  nrow()

New.Med.K1.Adult.2019 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG == 0) %>%
  nrow()

## 2018 (- 785 cases) ----
New.Med.K1.Adult.2018.365.NA <- New.Med.K1.Adult.2018[((is.na(New.Med.K1.Adult.2018$LoS.DRG) | 
                                                          (New.Med.K1.Adult.2018$LoS.DRG > 0 & 
                                                             New.Med.K1.Adult.2018$LoS.DRG < 366))), ]

## to see how many < 1 / > 365:
New.Med.K1.Adult.2018 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG > 365) %>%
  nrow()

New.Med.K1.Adult.2018 %>%
  filter(!is.na(LoS.DRG) & LoS.DRG == 0) %>%
  nrow()


# 7. Delete missings (they are in variable LoS & ICU)) ----
## 2020----
New.Med.K1.Adult.2020.365 <- New.Med.K1.Adult.2020.365.NA[complete.cases(New.Med.K1.Adult.2020.365.NA$LoS.DRG), ]

## 2019----
New.Med.K1.Adult.2019.365 <- New.Med.K1.Adult.2019.365.NA[complete.cases(New.Med.K1.Adult.2019.365.NA$LoS.DRG, 
                                                                         New.Med.K1.Adult.2019.365.NA$ICU.stay), ]

## 2018----
New.Med.K1.Adult.2018.365 <- New.Med.K1.Adult.2018.365.NA[complete.cases(New.Med.K1.Adult.2018.365.NA$LoS.DRG), ]


# 8. Delete cases with no MD (missings are coded as "") ----
## 2020 ----
sum(New.Med.K1.Adult.2020.365$main.diag == "")
New.Med.K1.Adult.2020.365 <- New.Med.K1.Adult.2020.365[!New.Med.K1.Adult.2020.365$main.diag == "", ]

## 2019 ----
sum(New.Med.K1.Adult.2019.365$main.diag == "")
New.Med.K1.Adult.2019.365 <- New.Med.K1.Adult.2019.365[!New.Med.K1.Adult.2019.365$main.diag == "", ]

## 2018 ----
sum(New.Med.K1.Adult.2018.365$main.diag == "")
New.Med.K1.Adult.2018.365 <- New.Med.K1.Adult.2018.365[!New.Med.K1.Adult.2018.365$main.diag == "", ]


# 9. Save new clean data  (please do not execute!) ----
## 2020 ----
data.table::fwrite(x = New.Med.K1.Adult.2020.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2020.365.txt", 
                   sep = ";")

## 2019 ----
data.table::fwrite(x = New.Med.K1.Adult.2019.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2019.365.txt", 
                   sep = ";")

## 2018 ----
data.table::fwrite(x = New.Med.K1.Adult.2018.365, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.K1.Adult.2018.365.txt", 
                   sep = ";")


rm(char_vars)
