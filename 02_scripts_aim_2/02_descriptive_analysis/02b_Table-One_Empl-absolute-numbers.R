###############################################################################
# In this file, the employees characteristics will be calculated using absolute
## numbers from the non-aggregated dataset. These values were used for the 
## published tables!
# 0. Install/load Packages
# 1. Set Work Directory & load data
# 2. Subset into years 2018, 2019, 2020
# 3. Descriptive addition for table one with absolute numbers
###############################################################################
# 0. Install/load packages ----
library(tidyverse)
library(dplyr)


# 1. Set work directory & load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("05_new_data_new_wageFTE_var.RData")

setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("New.Hosp.K1.Data.RData")

# 2. Subset into years 2018, 2019, 2020 ----
## 2020 ----
Pflege.2020 <- Pflege_akut %>%
  filter(JAHR == 2020)

Arzt.2020 <- Arzt_akut %>%
  filter(JAHR == 2020)

### Delete L5 and spec.clinic ----
Pflege.2020.f <- Pflege.2020 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

Arzt.2020.f <- Arzt.2020 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

## 2019 ----
Pflege.2019 <- Pflege_akut %>%
  filter(JAHR == 2019)

Arzt.2019 <- Arzt_akut %>%
  filter(JAHR == 2019)

### Delete L5 and spec.clinic ----
Pflege.2019.f <- Pflege.2019 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

Arzt.2019.f <- Arzt.2019 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

## 2018 ----
Pflege.2018 <- Pflege_akut %>%
  filter(JAHR == 2018)

Arzt.2018 <- Arzt_akut %>%
  filter(JAHR == 2018)

### Delete L5 and spec.clinic ----
Pflege.2018.f <- Pflege.2018 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

Arzt.2018.f <- Arzt.2018 %>%
  filter(typologie.f %in% c("University hospital", "Cantonal hospital", 
                            "Supply level 3 hospital", "Supply level 4 hospital"))

rm(Pflege.2018, Pflege.2019, Pflege.2020)
rm(Arzt.2018, Arzt.2019, Arzt.2020)

# 3. Descriptive addition for table one with absolute numbers ----
## 2020 ----
### Age ----
summary(Pflege.2020.f$age)
sd(Pflege.2020.f$age)

summary(Arzt.2020.f$age)
sd(Arzt.2020.f$age)

#### compare ----
summary(New.Hosp.K1.2020$age.mean_nurse)
sd(New.Hosp.K1.2020$age.mean_nurse)

summary(New.Hosp.K1.2020$age.mean_physician)
sd(New.Hosp.K1.2020$age.mean_physician)


### Sex ----
table(Pflege.2020.f$sex.f, useNA = "always")
prop.table(table(Pflege.2020.f$sex.f)) *100

table(Arzt.2020.f$sex.f, useNA = "always")
prop.table(table(Arzt.2020.f$sex.f)) *100

#### compare ----
summary(New.Hosp.K1.2020$pct.female_nurse)
summary(New.Hosp.K1.2020$pct.male_nurse)

summary(New.Hosp.K1.2020$pct.female_physician)
summary(New.Hosp.K1.2020$pct.male_physician)


### Function ----
table(Pflege.2020.f$ma_funktion.f, useNA = "always")
prop.table(table(Pflege.2020.f$ma_funktion.f)) *100

table(Arzt.2020.f$ma_funktion.f, useNA = "always")
prop.table(table(Arzt.2020.f$ma_funktion.f)) *100

#### compare ----
summary(New.Hosp.K1.2020$pct.RNs_etc)
summary(New.Hosp.K1.2020$pct.LPNs)
summary(New.Hosp.K1.2020$pct.n_ass)

summary(New.Hosp.K1.2020$pct.chief_leading)
summary(New.Hosp.K1.2020$pct.attending_hospital)
summary(New.Hosp.K1.2020$pct.residents_students)


## 2019 ----
### Age ----
summary(Pflege.2019.f$age)
sd(Pflege.2019.f$age)

summary(Arzt.2019.f$age)
sd(Arzt.2019.f$age)

#### compare ----
summary(New.Hosp.K1.2019$age.mean_nurse)
sd(New.Hosp.K1.2019$age.mean_nurse)

summary(New.Hosp.K1.2019$age.mean_physician)
sd(New.Hosp.K1.2019$age.mean_physician)


### Sex ----
table(Pflege.2019.f$sex.f, useNA = "always")
prop.table(table(Pflege.2019.f$sex.f)) *100

table(Arzt.2019.f$sex.f, useNA = "always")
prop.table(table(Arzt.2019.f$sex.f)) *100

#### compare ----
summary(New.Hosp.K1.2019$pct.female_nurse)
summary(New.Hosp.K1.2019$pct.male_nurse)

summary(New.Hosp.K1.2019$pct.female_physician)
summary(New.Hosp.K1.2019$pct.male_physician)


### Function ----
table(Pflege.2019.f$ma_funktion.f, useNA = "always")
prop.table(table(Pflege.2019.f$ma_funktion.f)) *100

table(Arzt.2019.f$ma_funktion.f, useNA = "always")
prop.table(table(Arzt.2019.f$ma_funktion.f)) *100

#### compare ----
summary(New.Hosp.K1.2019$pct.RNs_etc)
summary(New.Hosp.K1.2019$pct.LPNs)
summary(New.Hosp.K1.2019$pct.n_ass)

summary(New.Hosp.K1.2019$pct.chief_leading)
summary(New.Hosp.K1.2019$pct.attending_hospital)
summary(New.Hosp.K1.2019$pct.residents_students)


## 2018 ----
### Age ----
summary(Pflege.2018.f$age)
sd(Pflege.2018.f$age)

summary(Arzt.2018.f$age)
sd(Arzt.2018.f$age)

#### compare ----
summary(New.Hosp.K1.2018$age.mean_nurse)
sd(New.Hosp.K1.2018$age.mean_nurse)

summary(New.Hosp.K1.2018$age.mean_physician)
sd(New.Hosp.K1.2018$age.mean_physician)


### Sex ----
table(Pflege.2018.f$sex.f, useNA = "always")
prop.table(table(Pflege.2018.f$sex.f)) *100

table(Arzt.2018.f$sex.f, useNA = "always")
prop.table(table(Arzt.2018.f$sex.f)) *100

#### compare ----
summary(New.Hosp.K1.2018$pct.female_nurse)
summary(New.Hosp.K1.2018$pct.male_nurse)

summary(New.Hosp.K1.2018$pct.female_physician)
summary(New.Hosp.K1.2018$pct.male_physician)


### Function ----
table(Pflege.2018.f$ma_funktion.f, useNA = "always")
prop.table(table(Pflege.2018.f$ma_funktion.f)) *100

table(Arzt.2018.f$ma_funktion.f, useNA = "always")
prop.table(table(Arzt.2018.f$ma_funktion.f)) *100

#### compare ----
summary(New.Hosp.K1.2018$pct.RNs_etc)
summary(New.Hosp.K1.2018$pct.LPNs)
summary(New.Hosp.K1.2018$pct.n_ass)

summary(New.Hosp.K1.2018$pct.chief_leading)
summary(New.Hosp.K1.2018$pct.attending_hospital)
summary(New.Hosp.K1.2018$pct.residents_students)



table(Pflege.2020.f$typologie.f, useNA = "always")
table(Pflege.2019.f$typologie.f, useNA = "always")
table(Pflege.2018.f$typologie.f, useNA = "always")



