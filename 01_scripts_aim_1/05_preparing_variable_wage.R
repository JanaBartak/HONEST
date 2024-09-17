###############################################################################
# This is a preparation file. 
# If you run the codes, please do not execute step 3 (saving)).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Calculate wage/FTE variable
# 2.1 calculate sum FTE and sum BEZ. ARBEITSZEIT pflege
# 2.2 calculate sum FTE and sum BEZ. ARBEITSZEIT aerzte
# 2.3 Merging FTE and BEZAHLTE ARBEITSSTUNDEN datasets
# 2.4 Merging FTE_SUM AND ZZ_SUM into hosp dataset
# 2.5 Creating new columns wageFTE_nurses and wageFTE_physicians in hosp
# 2.6 Creating new columns wageZZ_nurses and wageZZ_physicians in hosp
# 3. Saving datasets
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed-data/")

# 1. Load data ----
load("04_hospital_data_merged.RData")


# 2. Calculating wage/FTE variable ----
## 2.1 calculate sum FTE and sum BEZ. ARBEITSZEIT pflege ----
# aggregating MA_FTE by summing its values
fte_pflege <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, sum)
# aggregating MA_BEZAHLTE_ARBEITSZEIT by summing its values 
zz_pflege <- aggregate(MA_BEZAHLTE_ARBEITSZEIT ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, sum)
# naming columns
names(fte_pflege)<-c("BUR_ALEAT_T", "JAHR", "Pflege_FTE")
names(zz_pflege)<-c("BUR_ALEAT_T", "JAHR","Pflege_Zeit")




## 2.2 calculate sum FTE and sum BEZ. ARBEITSZEIT aerzte ----
# aggregating MA_FTE by summing its 
fte_arzt <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, Arzt_akut, sum)
# aggregating MA_BEZAHLTE_ARBEITSZEIT by summing its values arzt
zz_arzt <- aggregate(MA_BEZAHLTE_ARBEITSZEIT ~ BUR_ALEAT_T + JAHR, data = Arzt_akut, sum)
# naming columns
names(fte_arzt)<-c("BUR_ALEAT_T","JAHR" ,"Arzt_FTE")
names(zz_arzt)<-c("BUR_ALEAT_T","JAHR", "Arzt_Zeit")


## 2.3 Merging FTE and BEZAHLTE ARBEITSSTUNDEN datasets ----
# merging FTE
FTE_sum <- merge(fte_arzt,fte_pflege, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing other fte datasets
rm(fte_arzt, fte_pflege)

# merging BEZAHLTE ARBEITSSTUNDEN
ZZ_sum <- merge(zz_arzt, zz_pflege, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing other zz datasets
rm(zz_arzt, zz_pflege)



## 2.4 Merging FTE_SUM AND ZZ_SUM into hosp dataset ----
hosp <- left_join(hosp, FTE_sum, by = c("BUR_ALEAT_T", "JAHR"))
hosp <- left_join(hosp, ZZ_sum, by = c("BUR_ALEAT_T", "JAHR"))


rm(FTE_sum, ZZ_sum)


## 2.5 Creating new columns wageFTE_nurses and wageFTE_physicians in hosp ----
# nurses
hosp$wageFTE_nurses <- NA
hosp$wageFTE_nurses <- (hosp$LOHN_PFLEGE/hosp$Pflege_FTE)
# physicians
hosp$wageFTE_physicians <- NA
hosp$wageFTE_physicians <- (hosp$LOHN_ARZT/hosp$Arzt_FTE)


## 2.6 Creating new columns wageZZ_nurses and wageZZ_physicians in hosp ----
# nurses
hosp$wageZZ_nurses <- NA
hosp$wageZZ_nurses <- (hosp$LOHN_PFLEGE/hosp$Pflege_Zeit)
# physicians
hosp$wageZZ_physicians <- NA
hosp$wageZZ_physicians <- (hosp$LOHN_ARZT/hosp$Arzt_Zeit)


# 3. Saving datasets ----
save(list = c("Arzt_akut", "hosp","Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/05_data_new_wageFTE_var.RData")




