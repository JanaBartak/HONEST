###############################################################################
# This is a preparation file. 
# If you run the codes, please do not execute step x (saving)).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Create aggregated personal dataset 
# 2.1 aggregate age (mean)
# 2.2 aggregate FTE (sum)
# 2.3 aggregate sex female (proportion) 
# 2.4 aggregate chief_leading (proportion)
# 2.5 aggregate residents and students (proportion)
# 2.6 aggregate RNs + special + midwives (proportion)
# 2.7 aggregate LPNs (- FAGE) (proportion)
# 2.8 aggregate nurse assisstants (proportion)
# 2.9 aggregate nationality
# 2.9.1 CH 
# 2.9.2 not CH 
# 2.10 merging personal_FTE_sum with Personal_akut.agg
# 3. Saving datasets
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed-data/")

# 1. Load data ----
load("05_data_new_wageFTE_var.RData")


# 2. Create aggregated personal dataset ----
## 2.1 aggregate age (mean) ----
# aggregate age mean personal
Personal_akut_age.m <- aggregate(age ~ BUR_ALEAT_T + JAHR, data = Personal_akut, mean)
colnames(Personal_akut_age.m) <- c("BUR_ALEAT_T", "JAHR", "age.mean")
# aggregate age mean Pflege
Pflege_akut_age.m <- aggregate(age ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, mean)
colnames(Pflege_akut_age.m) <- c("BUR_ALEAT_T", "JAHR", "age.mean_nurse")
# aggregate age mean Arzt
Arzt_akut_age.m <- aggregate(age ~ BUR_ALEAT_T + JAHR, data = Arzt_akut, mean)
colnames(Arzt_akut_age.m) <- c("BUR_ALEAT_T", "JAHR", "age.mean_physician")

# try out with the median as well
# aggregate age median
Personal_akut_age.me <- aggregate(age ~ BUR_ALEAT_T + JAHR, data = Personal_akut, median)
colnames(Personal_akut_age.me) <- c("BUR_ALEAT_T", "JAHR", "age.median")

# merging Personal_akut_age.m and Personal_akut_age.me
Personal_akut.agg <- merge(Personal_akut_age.m, Personal_akut_age.me, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Pflege_akut_age.m and Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_age.m, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Arzt_akut_age.m and Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_age.m, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Personal_ datasets not necessary
rm(Personal_akut_age.m, Personal_akut_age.me, Pflege_akut_age.m, Arzt_akut_age.m)




## 2.2 aggregate FTE (sum) ----
# Personal_akut_FTE <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = Personal_akut, sum)
# colnames(Personal_akut_FTE) <- c("BUR_ALEAT_T", "JAHR", "FTE.sum")
## aggregate FTE sum Pflege
Pflege_akut_FTE <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, sum)
colnames(Pflege_akut_FTE) <- c("BUR_ALEAT_T", "JAHR", "FTE.sum_nurse")
## aggregate FTE sum Arzt
Arzt_akut_FTE <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = Arzt_akut, sum)
colnames(Arzt_akut_FTE) <- c("BUR_ALEAT_T", "JAHR", "FTE.sum_physician")

## merging Personal_akut_FTE with Personal_akut.agg
# Personal_akut.agg <- merge(Personal_akut.agg, Personal_akut_FTE, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_FTE, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_FTE, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_FTE
rm(Pflege_akut_FTE, Arzt_akut_FTE)





## 2.3 aggregate sex female (proportion) ----
# Personal_akut_propgenderF <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.female = mean(sex.f == "Female"))

# aggregate gender prop female Pflege
Pflege_akut_propgenderF <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.female_nurse = mean(sex.f == "Female"))

# aggregate gender prop female Arzt
Arzt_akut_propgenderF <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.female_physician = mean(sex.f == "Female"))

# aggregate gender prop male
# Personal_akut_prop.male <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.male = mean(sex.f == "Male"))

# aggregate gender prop male Pflege
Pflege_akut_propgenderM <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.male_nurse = mean(sex.f == "Male"))

# aggregate gender prop male Arzt
Arzt_akut_propgenderM <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.male_physician = mean(sex.f == "Male"))

# merging Personal_akut_propgenderF with Personal_akut.agg
# Personal_akut.agg <- merge(Personal_akut.agg, Personal_akut_propgenderF, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Pflege_akut_propgenderF with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_propgenderF, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Arzt_akut_propgenderF with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_propgenderF, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Pflege_akut_propgenderM with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_propgenderM, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# merging Arzt_akut_propgenderM with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_propgenderM, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Personal_akut_propgenderF
rm(Pflege_akut_propgenderF, Arzt_akut_propgenderF)
# removing Personal_akut_propgenderM
rm(Pflege_akut_propgenderM, Arzt_akut_propgenderM)





## 2.4 aggregate chief_leading (proportion) ----
# aggregate funktion prop chef
Arzt_akut.Chef <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.chief_leading = mean(ma_funktion.f == "Physicians chiefs and leading"))

# merging Arzt_akut.Chef with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.Chef, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Arzt_akut.Chef 
rm(Arzt_akut.Chef)



## 2.5 aggregate attendings and hospital physicians (proportion) ----
# aggregate funktion prop spital
Arzt_akut.Spital <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.attending_hospital = mean(ma_funktion.f == "Physicians attendings and hospital"))

# merging Arzt_akut.Spital with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.Spital, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Arzt_akut.Spital
rm(Arzt_akut.Spital)





## 2.5 aggregate residents and students (proportion) ----
# aggregate funktion prop AA
Arzt_akut.AA <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.residents_students = mean(ma_funktion.f == "Physicians residents and students"))

# merging Arzt_akut.AA with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.AA, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing AA
rm(Arzt_akut.AA)





## 2.6 aggregate RNs + special + midwives (proportion) ----
# aggregate funktion prop diplS
Pflege_akut.diplS <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.RNs_etc = mean(ma_funktion.f == "Nurses RNs + special. (inkl. midwives)"))

# merging Pflege_akut.diplS with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.diplS, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing diplS
rm(Pflege_akut.diplS)






## 2.7 aggregate LPNs (- FAGE) (proportion) ----
# aggregate funktion prop LPNs
Pflege_akut.fage <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.LPNs = mean(ma_funktion.f == "Nurses LPNs"))

# merging Pflege_akut.fage with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.fage, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing fage
rm(Pflege_akut.fage)





## 2.8 aggregate nurse assisstants (proportion) ----
# aggregate funktion prop PfAss
Pflege_akut.PfAss <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.n_ass = mean(ma_funktion.f == "Nurses assist."))

# merging Pflege_akut.PfAss with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.PfAss, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing pfAss
rm(Pflege_akut.PfAss)







## 2.9 aggregate nationality ----
### 2.9.1 CH ----

## aggregate CH prop
# Personal_akut_propCH <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.CH = mean(nationality == "CH"))

## aggregate CH prop Pflege
Pflege_akut_propCH <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.CH_nurse = mean(nationality == "CH"))
## aggregate CH prop Arzt
Arzt_akut_propCH <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.CH_physician = mean(nationality == "CH"))

## merging Personal_akut_propCH with Personal_akut.agg
# Personal_akut.agg <- merge(Personal_akut.agg, Personal_akut_propCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_propCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_propCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_propCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_propCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_propCH, Arzt_akut_propCH)





### 2.9.2 NOT CH ----
## aggregate CH prop 
# Personal_akut_propnotCH <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.noCH = mean(nationality == "no CH"))

## aggregate not CH prop Pflege
Pflege_akut_propNOTCH <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.notCH_nurse = mean(nationality == "no CH"))

## aggregate not CH prop Arzt
Arzt_akut_propNOTCH <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.notCH_physician = mean(nationality == "no CH"))

## merging Personal_akut_propnotCH with Personal_akut.agg
# Personal_akut.agg <- merge(Personal_akut.agg, Personal_akut_propnotCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_propNOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_propNOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_propNOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_propNOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_propNOTCH, Arzt_akut_propNOTCH)






## 2.10 aggregate origin_diploma ----
### 2.10.1 origin_diploma CH ----

## aggregate origin_diploma_CH prop
# Personal_akut_prop_origin_diploma_CH <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.origin_dipl_CH = mean(origin_diploma == "CH"))

## aggregate origin_diploma_CH prop Pflege
Pflege_akut_prop_origin_diploma_CH <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_CH_nurse = mean(origin_diploma == "CH"))
## aggregate CH prop Arzt
Arzt_akut_prop_origin_diploma_CH <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_CH_physician = mean(origin_diploma == "CH"))

## merging Personal_akut_prop_origin_diploma_CH with Personal_akut.agg
# Personal_akut_prop_origin_diploma_CH <- merge(Personal_akut.agg, Personal_akut_prop_origin_diploma_CH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_prop_origin_diploma_CH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_prop_origin_diploma_CH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_propCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_prop_origin_diploma_CH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_prop_origin_diploma_CH, Arzt_akut_prop_origin_diploma_CH)





### 2.10.2 NOT CH ----
## aggregate origin_diploma_CH prop
# Personal_akut_prop_origin_diploma_NO_CH <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.origin_dipl_noCH = mean(origin_diploma == "no CH"))

## aggregate origin_diploma_noCH prop Pflege
Pflege_akut_prop_origin_diploma_NOTCH <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_notCH_nurse = mean(origin_diploma == "no CH"))
## aggregate CH prop Arzt
Arzt_akut_prop_origin_diploma_NOTCH <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_notCH_physician = mean(origin_diploma == "no CH"))

## merging Personal_akut_prop_origin_diploma_NO_CH with Personal_akut.agg
# Personal_akut_prop_origin_diploma_NO_CH <- merge(Personal_akut.agg, Personal_akut_prop_origin_diploma_NO_CH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_prop_origin_diploma_NOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_prop_origin_diploma_NOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_prop_origin_diploma_NOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_prop_origin_diploma_NOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_prop_origin_diploma_NOTCH, Arzt_akut_prop_origin_diploma_NOTCH)




### 2.10.3 NO diploma ----
## aggregate origin_diploma_NO_dipl prop
# Personal_akut_prop_origin_diploma_NO_dipl <- Personal_akut %>% 
#   group_by(BUR_ALEAT_T, JAHR) %>%
#   summarize(pct.origin_dipl_nodipl = mean(origin_diploma == "no diploma"))

## aggregate origin_diploma_nodipl prop Pflege
Pflege_akut_prop_origin_diploma_NOdipl <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_nodipl_nurse = mean(origin_diploma == "no diploma"))
## aggregate origin_diploma_nodipl Arzt
Arzt_akut_prop_origin_diploma_NOdipl <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.origin_dipl_nodipl_physician = mean(origin_diploma == "no diploma"))

## merging Personal_akut_prop_origin_diploma_NO_dipl with Personal_akut.agg
# Personal_akut_prop_origin_diploma_NO_dipl <- merge(Personal_akut.agg, Personal_akut_prop_origin_diploma_NO_dipl, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_prop_origin_diploma_NOdipl with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_prop_origin_diploma_NOdipl, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_prop_origin_diploma_NOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_prop_origin_diploma_NOdipl, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_prop_origin_diploma_NOdipl, Arzt_akut_prop_origin_diploma_NOdipl)






## 2.11 merging personal_FTE_sum with Personal_akut.agg ----
Personal_akut.agg <- merge(Personal_akut.agg, personal_FTE_sum, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# change position of personal_sumFTE
Personal_akut.agg <- Personal_akut.agg %>% relocate (FTE.sum_all, .before = FTE.sum_nurse)

rm(Arzt_akut, Personal_akut, personal_FTE_sum, Pflege_akut)





# 3. Saving datasets ----
save(list = c("hosp", "Personal_akut.agg"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/06_aggregated_personal_data.RData")


