###############################################################################
# In this file, table one with the patients characteristics will be created:
# NOTE: If you do not wish to run the codes, you can go directly to step 7 and load the tables 
# If you run the codes, please DO NOT execute step 5 (saving)
# 0. Install/load Packages
# 1. Set Work Directory & load merged data
# 2. Check levels of preferred not-numeric variables and change if needed
# 3. Create Table One 
# 4. Remove values in environment not needed
# (5. Save tables (please do not execute!))
# 6. Remove lists in environment not needed
# 7. Load tables directly
###############################################################################
# 0. Install/load Packages ----
library(dplyr)
library(tableone)


# 1. Set Work Directory & load merged data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_new-merged-data/")
load("New.Merged.Data.RData")


# 2. Check levels of preferred not-numeric variables and change if needed ----
## Age ----
table(New.Merged.2020$Age.Gr.10yrs, useNA = "always") # ok
table(New.Merged.2019$Age.Gr.10yrs, useNA = "always") # ok
table(New.Merged.2018$Age.Gr.10yrs, useNA = "always") # ok

## Sex ----
### 2020 ----
table(New.Merged.2020$Sex, useNA = "always") # change

New.Merged.2020 <- New.Merged.2020 %>%
  mutate(Sex = factor(Sex, levels = c("Male", "Female"))) 

table(New.Merged.2020$Sex, useNA = "always") # ok

### 2019 ----
table(New.Merged.2019$Sex, useNA = "always") # change

New.Merged.2019 <- New.Merged.2019 %>%
  mutate(Sex = factor(Sex, levels = c("Male", "Female")))

table(New.Merged.2019$Sex, useNA = "always") # ok

### 2018 ----
table(New.Merged.2018$Sex, useNA = "always") # change

New.Merged.2018 <- New.Merged.2018 %>%
  mutate(Sex = factor(Sex, levels = c("Male", "Female")))

table(New.Merged.2018$Sex, useNA = "always") # ok

## Hosp.Level ----
table(New.Merged.2020$Hosp.Level, useNA = "always") # ok
table(New.Merged.2019$Hosp.Level, useNA = "always") # ok
table(New.Merged.2018$Hosp.Level, useNA = "always") # ok


## Swiss_eci.xx.Gr ----
### 2020 ----
table(New.Merged.2020$Swiss_eci.20.Gr, useNA = "always") # change

New.Merged.2020 <- New.Merged.2020 %>%
  mutate(Swiss_eci.20.Gr = factor(Swiss_eci.20.Gr, levels = c("<0", "0", "1-5", ">=5")))

table(New.Merged.2020$Swiss_eci.20.Gr, useNA = "always") # ok

### 2019 ----
table(New.Merged.2019$Swiss_eci.19.Gr, useNA = "always") # change

New.Merged.2019 <- New.Merged.2019 %>%
  mutate(Swiss_eci.19.Gr = factor(Swiss_eci.19.Gr, levels = c("<0", "0", "1-5", ">=5")))

table(New.Merged.2019$Swiss_eci.19.Gr, useNA = "always") # ok

### 2018 ----
table(New.Merged.2018$Swiss_eci.18.Gr, useNA = "always") # change

New.Merged.2018 <- New.Merged.2018 %>%
  mutate(Swiss_eci.18.Gr = factor(Swiss_eci.18.Gr, levels = c("<0", "0", "1-5", ">=5")))

table(New.Merged.2018$Swiss_eci.18.Gr, useNA = "always") # ok

## Mortality.di ----
table(New.Merged.2020$Mortality.di, useNA = "always") # ok
table(New.Merged.2019$Mortality.di, useNA = "always") # ok
table(New.Merged.2018$Mortality.di, useNA = "always") # ok


# 3. Create Table One  ----
## 2020 ----
myVars20 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level", "Swiss_eci.20", "Swiss_eci.20.Gr",
                     "LoS.DRG", "ICU.stay", "Mortality.di")

catVars20 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level",
                      "Swiss_eci.20.Gr")

tab1.20 <- CreateTableOne(vars = myVars20, data = New.Merged.2020, factorVars = catVars20)
tab1.20


## 2019 ----
myVars19 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level", "Swiss_eci.19", "Swiss_eci.19.Gr",
                     "LoS.DRG", "ICU.stay", "Mortality.di")

catVars19 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level", 
                      "Swiss_eci.19.Gr")

tab1.19 <- CreateTableOne(vars = myVars19, data = New.Merged.2019, factorVars = catVars19)
tab1.19


## 2018 ----
myVars18 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level", "Swiss_eci.18", "Swiss_eci.18.Gr",
                     "LoS.DRG", "ICU.stay", "Mortality.di")

catVars18 <- c("Age.Gr.10yrs", "Sex", "Hosp.Level",
                      "Swiss_eci.18.Gr")

tab1.18 <- CreateTableOne(vars = myVars18, data = New.Merged.2018, factorVars = catVars18)
tab1.18


# 4. Remove values in environment not needed ----
rm(catVars18, catVars19, catVars20)
rm(myVars18, myVars19, myVars20)


# 5. Save tables (please do not execute) ----
## 2020 ----
t1.20 <- print(tab1.20)
write.csv(t1.20, file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.20.csv")

## 2019 ----
t1.19 <- print(tab1.19)
write.csv(t1.19, file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.19.csv")

## 2018 ----
t1.18 <- print(tab1.18)
write.csv(t1.18, file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.18.csv")


# 6. Remove lists in environment not needed ----
rm(tab1.18, tab1.19, tab1.20)


# 7. Load tables directly ----
## (change path if needed)

## 2020 ----
t1.20 <- read.csv(file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.20.csv")
print(t1.20)


## 2019 ----
t1.19 <- read.csv(file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.19.csv")
print(t1.19)


## 2018 ----
t1.18 <- read.csv(file = "/Users/aleksandravasic/Desktop/HONEST_public/HONEST/02_scripts_aim_2/02_descriptive_analysis/descriptive-results_tables/t1.18.csv")
print(t1.18)





