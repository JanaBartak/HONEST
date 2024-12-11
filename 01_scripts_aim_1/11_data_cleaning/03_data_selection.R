###############################################################################
# This is a preparation file. 
# If you run the codes, please do not execute step 5 (saving)).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Select data of interest - selecting only acute care hospitals (allg, leist, lohn datasets)
# 2.1 allg 
# 2.2 leist 
# 2.3 lohn 
# 2.4 personal
# 3. Select personal data of interest 
# 3.1 Selecting only personal under contract end of year
# 3.2 Selecting only nurses and physicians in personal
# 4. Variables selection 
# 4.1 allg variables selection
# 4.2 leist variables selection
# 4.3 lohn variables selection
# 4.4 personal variables selection
# 4.4.1 nurses -> creating subset 'pflege' (only nurses)
# 4.4.2 physicians -> creating subset 'arzt' (only physicians)
# (5. Save raw datasets as .RData files)
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed_data//")

# 1. Load data ----
load("02_new_variables.RData")


# 2. Select data of interest - selecting only acute care hospitals (allg, leist, lohn datasets) ----
## 2.1 allg  ----
allg_akut <- allg[allg$activity.f %in% c ("Akutpflege"), ]
# drop the levels of typologie.f that are not used!
allg_akut$typologie.f <- droplevels(allg_akut$typologie.f)
# only acute care hospitals

## 2.2 leist  ----
leist_akut <- leist [leist$ACT_NOM_D %in% c("Akutpflege"), ]
# no "Akutpflege" variable in lohn
# no "Akutpflege" variable in personal


## 2.3 lohn  ----
# merging lohn and allg in order to selct only acute care hospitals
lohn_akut <- left_join(lohn, allg_akut, by = c ("BUR_ALEAT_T", "JAHR"))
# choosing only acute care hospitals
lohn_akut <- lohn_akut[lohn_akut$activity.f %in% c("Akutpflege"),]

## 2.4 personal ----
# merging personal and allg in order to select only personal working in acute care hospitals
personal_akut <- left_join(personal, allg_akut, by = c("BUR_ALEAT_T", "JAHR"))  
# choose only personal working in acute care
personal_akut <- personal_akut[personal_akut$activity.f %in% c("Akutpflege"), ]

# cleaning environment
rm(allg, leist, personal, lohn)

###############################################################################
###############################################################################

# calculating the aggregated sum of all professionals will be merged in agg dataset in file 02f.1 ----
personal_FTE_sum <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = personal_akut, sum)
colnames(personal_FTE_sum) <- c("BUR_ALEAT_T", "JAHR", "FTE.sum_all")


### ---- ######################################################################
###############################################################################


# 3. Select personal data of interest  ----
## 3.1 Selecting only personal under contract end of year ----
personal_akut_cey <- personal_akut[personal_akut$ma_ende_jahr.f %in% c("Yes"), ]

## 3.2 Selecting only nurses and physicians in personal ----
# choosing only cases with nurses and physicians (externe Arzt + Hebamme are EXCLUDED!)
personal_akut_ceyPN <- personal_akut_cey [personal_akut_cey$ma_funktion.f %in% c("Physicians chiefs and leading", 
                                                                                 "Physicians attendings and hospital", 
                                                                                 "Physicians residents and students", 
                                                                                 "Nurses RNs + special. (inkl. midwives)",
                                                                                 "Nurses LPNs","Nurses assist."), ]


# drop the levels of ma_funktion.f that are not used!
personal_akut_ceyPN$ma_funktion.f <- droplevels(personal_akut_ceyPN$ma_funktion.f)


# cleaning the environment
rm(personal_akut, personal_akut_cey)


##### ---- ####################################################################
###############################################################################


# 4. Variables selection ----
## 4.1 allg variables selection ----
# create main subset Allg with variables of interest
Allg_akut <- allg_akut [ , c ("BUR_ALEAT_T", "JAHR", "activity.f", "typologie.f", "RECHTSFORM.f", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS", "equipment","DiagEq", "DiagEq_EXAMEN_TOTAL", "DiagEq_EXAMEN_AMB", "DiagEq_EXAMEN_STAT", "TherEq", "TherEq_EXAMEN_TOTAL", "TherEq_EXAMEN_AMB", "TherEq_EXAMEN_STAT","MRI", "MRI_EXAMEN_TOTAL", "MRI_EXAMEN_AMB", "MRI_EXAMEN_STAT", "CT_SCANNER", "CT_SCANNER_EXAMEN_TOTAL", "CT_SCANNER_EXAMEN_AMB", "CT_SCANNER_EXAMEN_STAT", "PET_SCANNER", "PET_SCANNER_EXAMEN_TOTAL", "PET_SCANNER_EXAMEN_AMB", "PET_SCANNER_EXAMEN_STAT", "GAMMA_CAMERA", "GAMMA_CAMERA_EXAMEN_TOTAL", "GAMMA_CAMERA_EXAMEN_AMB", "GAMMA_CAMERA_EXAMEN_STAT", "LINEARBESCHLEUNIGER", "LINEARBESCHLEUNIGER_EXAMEN_TOT", "LINEARBESCHLEUNIGER_EXAMEN_AMB", "LINEARBESCHLEUNIGER_EXAMEN_STA", "LITHOTRIPTOR", "LITHOTRIPTOR_EXAMEN_TOTAL", "LITHOTRIPTOR_EXAMEN_AMB", "LITHOTRIPTOR_EXAMEN_STAT", "ANGIOGRAPHIE", "ANGIOGRAPHIE_EXAMEN_TOTAL", "ANGIOGRAPHIE_EXAMEN_AMB", "ANGIOGRAPHIE_EXAMEN_STAT", "DIALYSE", "DIALYSE_EXAMEN_TOTAL", "DIALYSE_EXAMEN_AMB", "DIALYSE_EXAMEN_STAT")]


## 4.2 leist variables selection ----
# create main subset Leist with variables of interest
Leist_akut <- leist_akut [ , c("BUR_ALEAT_T", "JAHR", "PFLEGETAGE_STATIONAER", "AUSTRITTE_STATIONAER", "AMBULANTE_KONSULTATIONEN")]




## 4.3 lohn variables selection ----
# create main subset Lohn with variables of interest
Lohn_akut <- lohn_akut [ , c("BUR_ALEAT_T", "JAHR", "LOHN_ARZT", "LOHN_PFLEGE", "LOHN_OTHERS", "LOHN_TOTAL")]




## 4.4 personal variables selection ----
# create main subset Personal with variables of interest
Personal_akut <- personal_akut_ceyPN [ , c("BUR_ALEAT_T", "JAHR", "sex.f", "age", "MA_FTE", "MA_BEZAHLTE_ARBEITSZEIT", "ma_funktion.f", "funk_gr", "ma_diplom.f", "origin_diploma","nation", "nationality","typologie.f", "MA_IN_AUSBILDUNG", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS")]

# Personal_akut_NOtrain <- personal_akut_ceyNOtrainPN [ , c("BUR_ALEAT_T", "JAHR", "sex.f", "age", "MA_FTE", "MA_BEZAHLTE_ARBEITSZEIT", "ma_funktion.f", "funk_gr", "ma_diplom.f", "nation", "nationality", "typologie.f", "MA_IN_AUSBILDUNG", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS")]

### 4.4.1 nurses -> creating subset 'pflege' ----
Pflege_akut <-Personal_akut[Personal_akut$ma_funktion.f %in% c("Nurses RNs + special. (inkl. midwives)","Nurses LPNs","Nurses assist."), ]
# drop the levels of ma_funktion.f that are not used! 
Pflege_akut$ma_funktion.f <- droplevels(Pflege_akut$ma_funktion.f)

### 4.4.2 physicians -> creating subset 'arzt' ----
Arzt_akut <-Personal_akut[Personal_akut$ma_funktion.f %in% c("Physicians chiefs and leading", "Physicians attendings and hospital", "Physicians residents and students"), ]
# drop the levels of ma_funktion.f that are not used! 
Arzt_akut$ma_funktion.f <- droplevels(Arzt_akut$ma_funktion.f)

# removing unnecessary datasets from environment
rm(allg_akut, leist_akut, lohn_akut, personal_akut_ceyPN)




# 5. Saving datasets ----
save(list = c("Allg_akut", "Arzt_akut", "Leist_akut", "Lohn_akut", "Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/03_data_acute_only.RData")


