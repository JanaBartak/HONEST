###############################################################################
# In this script, first the hospital data will be subsetted into the years
## 2020, 2019 & 2018, and then specialty clinics and level 5 hospitals will be 
## dropped before merging with patient data
# ------------------------------------------------------------------------------
# 0. Install/load Packages
# If you do not want to run all the codes, you can jump to nr.11 directly and
## load your preferred datasets.
# NOTE: If you run the codes, please DO NOT execute step 4, 6 & 10 (saving)
# 1. Load new Hospital Dataset (wd included) & New.Sub datasets
# 2. Rename variables according to patient data
# 3. Make subsets for 2020, 2019, 2018
# (4. Save New.Hosp. subsets as .Rdata files (please do not execute!))
# 5. Delete specialty clinics and level 5 hospitals
# (6. Save New.Hosp.K1 subsets as .RData files (please do not execute!))
# 7. Change BUR.NR variable type in patient data from integer to numeric 
##   (CAVE: do NOT change it back!)
# 8. Check how many BUR.NR are matching from the patient and hospital dataset
# 9. Merge Hosp. & Patient data by BUR.NR
# (10. Save New.Merged datasets (please do not execute!))
# 11. Load preferred datasets directly
###############################################################################
# 0. Install/load packages ----
library(dplyr)

# 1. Load Hospital Dataset (wd included) ----
load("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/07_new_FINAL_datasets.RData")

# Set Work Directory ----
setwd("/Volumes/research$/HONEST Team/Data/")
## New.Sub. datasets ----
### 2020 ----
New.Sub1.2020.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Sub1.2020.365.txt", 
                                                   sep = ";")

### 2019 ----
New.Sub1.2019.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Sub1.2019.365.txt", 
                                       sep = ";")

### 2018 ----
New.Sub1.2018.365 <- data.table::fread(file = "aim2_processed-data/aim2_additional-data/New.Sub1.2018.365.txt", 
                                       sep = ";")


# 2. Rename variables according to patient data ----
honest_DEF = honest_DEF %>% rename(Hosp.Level2 = typologie.f,
                                   BUR.NR = BUR_ALEAT_T)

table(honest_DEF$Hosp.Level2, useNA = "always") # no NA's
table(honest_DEF$BUR.NR, useNA = "always") # no NA's

table(honest_DEF$JAHR, useNA = "always") # no NA's, 2020 n = 126, 2019 n = 135, 2018 n = 132

# 3. Make subsets for 2020, 2019, 2018 ----
## 2020 ----
New.Hosp.2020 <- honest_DEF %>%
  filter(JAHR == 2020)
### n = 126, correct

## 2019 ----
New.Hosp.2019 <- honest_DEF %>%
  filter(JAHR == 2019)
### n = 135, correct

## 2018 ----
New.Hosp.2018 <- honest_DEF %>%
  filter(JAHR == 2018)
### n = 132, correct


# 4. Save Hosp. subsets as .RData files (please do not execute!) ----
## 2020, 2019, 2018 ----
save(list = c("New.Hosp.2020", "New.Hosp.2019", "New.Hosp.2018"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/New.Hosp.Data.RData")


# 5. Delete specialty clinics and level 5 hospitals ----
## 2020 ----
New.Hosp.K1.2020 <- New.Hosp.2020 %>%
  filter(Hosp.Level2 %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))


## 2019 ----
New.Hosp.K1.2019 <- New.Hosp.2019 %>%
  filter(Hosp.Level2 %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

## 2018 ----
New.Hosp.K1.2018 <- New.Hosp.2018 %>%
  filter(Hosp.Level2 %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))


# 6. Save Hosp.K1 subsets as .RData files (please do not execute!) ----
## 2020, 2019, 2018 ----
save(list = c("New.Hosp.K1.2020", "New.Hosp.K1.2019", "New.Hosp.K1.2018"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/New.Hosp.K1.Data.RData")


# 7. Change BUR.NR variable type in patient data from integer to numeric (CAVE: do NOT change it back!) ----
## 2020 ----
sort(unique(New.Sub1.2020.365$BUR.NR))

New.Sub1.2020.365$BUR.NR <- as.factor(New.Sub1.2020.365$BUR.NR)
sort(unique(New.Sub1.2020.365$BUR.NR)) # numbers are the same --> correct

## 2019 ----
sort(unique(New.Sub1.2019.365$BUR.NR))

New.Sub1.2019.365$BUR.NR <- as.factor(New.Sub1.2019.365$BUR.NR)
sort(unique(New.Sub1.2019.365$BUR.NR)) # numbers are the same --> correct

## 2018 ----
sort(unique(New.Sub1.2018.365$BUR.NR))

New.Sub1.2018.365$BUR.NR <- as.factor(New.Sub1.2018.365$BUR.NR)
sort(unique(New.Sub1.2018.365$BUR.NR)) # numbers are the same --> correct


# 8. Check how many BUR.NR are matching from the patient and hospital dataset ----
## 2020 ----
sort(unique(New.Hosp.K1.2020$BUR.NR))
sort(unique(New.Sub1.2020.365$BUR.NR))

### following BUR.NR do not exist in the hospital data: 5x Hosp.L.4 --> 22'570 cases
BUR18 <- New.Sub1.2020.365 %>% filter(BUR.NR == 18) # Hosp.L.4 --> 4144 cases
BUR69 <- New.Sub1.2020.365 %>% filter(BUR.NR == 69) # Hosp.L.4 --> 4382 cases
BUR251 <- New.Sub1.2020.365 %>% filter(BUR.NR == 251) # Hosp.L.4 --> 3583 cases
BUR388 <- New.Sub1.2020.365 %>% filter(BUR.NR == 388) # Hosp.L.4 --> 4877 cases
BUR522 <- New.Sub1.2020.365 %>% filter(BUR.NR == 522) # Hosp.L.4 --> 5584 cases

#### remove subsets
rm(BUR18, BUR69, BUR251, BUR388, BUR522)

## 2019 ----
sort(unique(New.Hosp.K1.2019$BUR.NR))
sort(unique(New.Sub1.2019.365$BUR.NR))

### following BUR.NR do not exist in the hospital data: 5x Hosp.L.4 --> 22'074 cases
BUR18 <- New.Sub1.2019.365 %>% filter(BUR.NR == 18) # Hosp.L.4 --> 4332 cases
BUR69 <- New.Sub1.2019.365 %>% filter(BUR.NR == 69) # Hosp.L.4 --> 4247 cases
BUR251 <- New.Sub1.2019.365 %>% filter(BUR.NR == 251) # Hosp.L.4 --> 3652 cases
BUR388 <- New.Sub1.2019.365 %>% filter(BUR.NR == 388) # Hosp.L.4 --> 4706 cases
BUR522 <- New.Sub1.2019.365 %>% filter(BUR.NR == 522) # Hosp.L.4 --> 5137 cases

#### remove subsets
rm(BUR18, BUR69, BUR251, BUR388, BUR522)

## 2018 ----
sort(unique(New.Hosp.K1.2018$BUR.NR))
sort(unique(New.Sub1.2018.365$BUR.NR))

### following BUR.NR do not exist in the hospital data: 4x Hosp.L.4, 1x Hosp.L3 --> 22'076 cases
BUR18 <- New.Sub1.2018.365 %>% filter(BUR.NR == 18) # Hosp.L.4 --> 4373 cases
BUR69 <- New.Sub1.2018.365 %>% filter(BUR.NR == 69) # Hosp.L.3 --> 4364 cases
BUR251 <- New.Sub1.2018.365 %>% filter(BUR.NR == 251) # Hosp.L.4 --> 3269 cases
BUR388 <- New.Sub1.2018.365 %>% filter(BUR.NR == 388) # Hosp.L.4 --> 4997 cases
BUR522 <- New.Sub1.2018.365 %>% filter(BUR.NR == 522) # Hosp.L.4 --> 5073 cases

#### remove subsets
rm(BUR18, BUR69, BUR251, BUR388, BUR522)


# 9. Merge Hosp. & Patient data by BUR.NR ----
## 2020 ----
New.Merged.2020 <- inner_join(New.Sub1.2020.365, New.Hosp.K1.2020, by = "BUR.NR")
sort(unique(New.Merged.2020$BUR.NR))
### --> -22'570 cases correct; 83 hospitals correct

## 2019 ----
New.Merged.2019 <- inner_join(New.Sub1.2019.365, New.Hosp.K1.2019, by = "BUR.NR")
sort(unique(New.Merged.2019$BUR.NR))
### --> -22'074 cases correct; 82 hospitals correct

## 2018 ----
New.Merged.2018 <- inner_join(New.Sub1.2018.365, New.Hosp.K1.2018, by = "BUR.NR")
sort(unique(New.Merged.2018$BUR.NR))
### --> -22'076 cases correct; 81 hospitals correct


# 10. Save New.Merged datasets (please do not execute!) ----
save(list = c("New.Merged.2018", "New.Merged.2019", "New.Merged.2020"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_new-merged-data/New.Merged.Data.RData")


# 11. Load preferred datasets directly ----

## Load New.Hosp. 2020, 2019, 2018 directly ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("New.Hosp.Data.RData")

## Load New.Hosp.K1 2020, 2019, 2018 directly ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("New.Hosp.K1.Data.RData")

## Load New.Merged datasets directly ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_new-merged-data/")
load("New.Merged.Data.RData")

