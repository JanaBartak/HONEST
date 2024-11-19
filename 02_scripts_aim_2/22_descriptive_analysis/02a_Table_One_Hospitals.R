###############################################################################
# In this file, table one with the hospital characteristics will be created:
# CAVE: for the published tables we used calculated information with absolute numbers, 
## here they are on an aggregated level. Therefore, some values may slightly differ
## from the published tables. For the non-aggregated version see script 02b_.
## Comparisons are shown in script 02_.
## (The non-aggregated version was later added manually into the the published tables)
# 0. Install/load Packages
# 1. Set Work Directory & load merged data
# 2. Multiply pct.variables by 100
# 3. Table1
# 4. Remove lists/values in environment not needed
###############################################################################
# 0. Install/load Packages ----
library(dplyr)
library(tableone)
library(ggplot2)


# 1. Set Work Directory & load merged data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("New.Hosp.K1.Data.RData")


# 2. Multiply pct.variables by 100 ----
## 2020 ----
New.Hosp.K1.2020$pct.female_nurse_100 <- New.Hosp.K1.2020$pct.female_nurse *100
New.Hosp.K1.2020$pct.female_physician_100 <- New.Hosp.K1.2020$pct.female_physician *100
New.Hosp.K1.2020$pct.male_nurse_100 <- New.Hosp.K1.2020$pct.male_nurse *100
New.Hosp.K1.2020$pct.male_physician_100 <- New.Hosp.K1.2020$pct.male_physician *100
New.Hosp.K1.2020$pct.chief_leading_100 <- New.Hosp.K1.2020$pct.chief_leading *100
New.Hosp.K1.2020$pct.attending_hospital_100 <- New.Hosp.K1.2020$pct.attending_hospital *100
New.Hosp.K1.2020$pct.residents_students_100 <- New.Hosp.K1.2020$pct.residents_students*100
New.Hosp.K1.2020$pct.RNs_etc_100 <- New.Hosp.K1.2020$pct.RNs_etc *100
New.Hosp.K1.2020$pct.LPNs_100 <- New.Hosp.K1.2020$pct.LPNs *100
New.Hosp.K1.2020$pct.n_ass_100 <- New.Hosp.K1.2020$pct.n_ass *100

## 2019 ----
New.Hosp.K1.2019$pct.female_nurse_100 <- New.Hosp.K1.2019$pct.female_nurse *100
New.Hosp.K1.2019$pct.female_physician_100 <- New.Hosp.K1.2019$pct.female_physician *100
New.Hosp.K1.2019$pct.male_nurse_100 <- New.Hosp.K1.2019$pct.male_nurse *100
New.Hosp.K1.2019$pct.male_physician_100 <- New.Hosp.K1.2019$pct.male_physician *100
New.Hosp.K1.2019$pct.chief_leading_100 <- New.Hosp.K1.2019$pct.chief_leading *100
New.Hosp.K1.2019$pct.attending_hospital_100 <- New.Hosp.K1.2019$pct.attending_hospital *100
New.Hosp.K1.2019$pct.residents_students_100 <- New.Hosp.K1.2019$pct.residents_students*100
New.Hosp.K1.2019$pct.RNs_etc_100 <- New.Hosp.K1.2019$pct.RNs_etc *100
New.Hosp.K1.2019$pct.LPNs_100 <- New.Hosp.K1.2019$pct.LPNs *100
New.Hosp.K1.2019$pct.n_ass_100 <- New.Hosp.K1.2019$pct.n_ass *100

## 2018 ----
New.Hosp.K1.2018$pct.female_nurse_100 <- New.Hosp.K1.2018$pct.female_nurse *100
New.Hosp.K1.2018$pct.female_physician_100 <- New.Hosp.K1.2018$pct.female_physician *100
New.Hosp.K1.2018$pct.male_nurse_100 <- New.Hosp.K1.2018$pct.male_nurse *100
New.Hosp.K1.2018$pct.male_physician_100 <- New.Hosp.K1.2018$pct.male_physician *100
New.Hosp.K1.2018$pct.chief_leading_100 <- New.Hosp.K1.2018$pct.chief_leading *100
New.Hosp.K1.2018$pct.attending_hospital_100 <- New.Hosp.K1.2018$pct.attending_hospital *100
New.Hosp.K1.2018$pct.residents_students_100 <- New.Hosp.K1.2018$pct.residents_students*100
New.Hosp.K1.2018$pct.RNs_etc_100 <- New.Hosp.K1.2018$pct.RNs_etc *100
New.Hosp.K1.2018$pct.LPNs_100 <- New.Hosp.K1.2018$pct.LPNs *100
New.Hosp.K1.2018$pct.n_ass_100 <- New.Hosp.K1.2018$pct.n_ass *100


# 3. Table1 ----
## 2020 ----
myVars20.hosp <- c("Hosp.Level2", "wageFTE_nurses", "wageFTE_physicians", "age.mean_nurse", "age.mean_physician",
                   "pct.female_nurse_100", "pct.male_nurse_100", "pct.female_physician_100", "pct.male_physician_100", 
                   "pct.RNs_etc_100", "pct.LPNs_100", "pct.n_ass_100", "pct.chief_leading_100", 
                   "pct.attending_hospital_100", "pct.residents_students_100")

catVars20.hosp <- "Hosp.Level2"

tab1.hosp.20 <- CreateTableOne(vars = myVars20.hosp, data = New.Hosp.K1.2020, factorVars = catVars20.hosp)
tab1.hosp.20


## add Min-Max
Min.wage.n20 <- min(New.Hosp.K1.2020$wageFTE_nurses)
Max.wage.n20 <- max(New.Hosp.K1.2020$wageFTE_nurses)

Min.wage.p20 <- min(New.Hosp.K1.2020$wageFTE_physicians)
Max.wage.p20 <- max(New.Hosp.K1.2020$wageFTE_physicians)

MinMax.wageFTE.2020 <- data.frame(Min.wage.n20, Max.wage.n20, Min.wage.p20, Max.wage.p20)


## 2019 ----
myVars19.hosp <- c("Hosp.Level2", "wageFTE_nurses", "wageFTE_physicians", "age.mean_nurse", "age.mean_physician",
                   "pct.female_nurse_100", "pct.male_nurse_100", "pct.female_physician_100", "pct.male_physician_100", 
                   "pct.RNs_etc_100", "pct.LPNs_100", "pct.n_ass_100", "pct.chief_leading_100", 
                   "pct.attending_hospital_100", "pct.residents_students_100")

catVars19.hosp <- "Hosp.Level2"

tab1.hosp.19 <- CreateTableOne(vars = myVars19.hosp, data = New.Hosp.K1.2019, factorVars = catVars19.hosp)
tab1.hosp.19


## add Min-Max
Min.wage.n19 <- min(New.Hosp.K1.2019$wageFTE_nurses)
Max.wage.n19 <- max(New.Hosp.K1.2019$wageFTE_nurses)

Min.wage.p19 <- min(New.Hosp.K1.2019$wageFTE_physicians)
Max.wage.p19 <- max(New.Hosp.K1.2019$wageFTE_physicians)

MinMax.wageFTE.2019 <- data.frame(Min.wage.n19, Max.wage.n19, Min.wage.p19, Max.wage.p19)


## 2018 ----
myVars18.hosp <- c("Hosp.Level2", "wageFTE_nurses", "wageFTE_physicians", "age.mean_nurse", "age.mean_physician",
                   "pct.female_nurse_100", "pct.male_nurse_100", "pct.female_physician_100", "pct.male_physician_100", 
                   "pct.RNs_etc_100", "pct.LPNs_100", "pct.n_ass_100", "pct.chief_leading_100", 
                   "pct.attending_hospital_100", "pct.residents_students_100")

catVars18.hosp <- "Hosp.Level2"

tab1.hosp.18 <- CreateTableOne(vars = myVars18.hosp, data = New.Hosp.K1.2018, factorVars = catVars18.hosp)
tab1.hosp.18


## add Min-Max
Min.wage.n18 <- min(New.Hosp.K1.2018$wageFTE_nurses)
Max.wage.n18 <- max(New.Hosp.K1.2018$wageFTE_nurses)

Min.wage.p18 <- min(New.Hosp.K1.2018$wageFTE_physicians)
Max.wage.p18 <- max(New.Hosp.K1.2018$wageFTE_physicians)

MinMax.wageFTE.2018 <- data.frame(Min.wage.n18, Max.wage.n18, Min.wage.p18, Max.wage.p18)


# 4. Remove lists/values in environment not needed ----
rm(tab1.hosp.20, tab1.hosp.19, tab1.hosp.18)
rm(Min.wage.n18, Min.wage.n19, Min.wage.n20, Min.wage.p18, Min.wage.p19, Min.wage.p20)
rm(Max.wage.n18, Max.wage.n19, Max.wage.n20, Max.wage.p18, Max.wage.p19, Max.wage.p20)
rm(MinMax.wageFTE.2018, MinMax.wageFTE.2019, MinMax.wageFTE.2020)
rm(catVars18.hosp, catVars19.hosp, catVars20.hosp)
rm(myVars18.hosp, myVars19.hosp, myVars20.hosp)



