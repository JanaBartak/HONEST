###############################################################################
# In this file, the newly received hospital data will be prepared according to 
# HONEST aim1 procedure.
# NOTE: These are the R-codes from Sarah Holzer from the files:
# 01_scripts_aim_1 --> 01_data_cleaning --> all scripts from 00_ until 07_
# The codes, work directories and titles might have been adjusted, and new 
# subset names given in order to fit the new dataset
###############################################################################
# 0. Install/load Packages
# 1. Set Work Directory
###############################################################################
# Script 00_load_raw_data.R
# This is the raw data loading file. 
# If you run the codes, please DO NOT execute step 3, 6, 9, 12, 15, 18, 22, 28 (saving)!
# 2. Load datasets (allg, lohn, leist, personal)
# (3. Save raw datasets as .RData files (please do not execute!))
###############################################################################
# Script 01_handling_missing_values_and_recording.R
# This is the first of a series of seven preparation files. 
# If you run the codes, please DO NOT execute step 3 (saving).
# If you want to run the code step by step and you already have the raw datasets 
# in the environment jump to step 5.
# 4. Load raw data
# 5. Recoding missing values, etc.
# (6. Saving datasets (please do not execute!))
###############################################################################
# Script 02_create_new_variables.R
# This is a preparation file.
# If you run the codes, please DO NOT execute step 9 (saving).
# If you want to run the code step by step and you already have the cleaned raw 
# datasets in the environment jump to step 8.
# 7. Load data
# 8. Create new variables
# (9. Saving datasets (please do not execute!))
###############################################################################
# Script 03_data_selection.R
# This is a preparation file. 
# If you run the codes, please DO NOT execute step 12 (saving).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 11.
# 10. Load data
# 11. Select data of interest
# (12. Save raw datasets as .RData files (please do not execute!))
###############################################################################
# Script 04_merging_hospital_datasets.R
# This is a preparation file. 
# If you run the codes, please DO NOT execute step 15 (saving).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 14.
# 13. Load data
# 14. Merge all hospital datasets
# (15. Saving datasets (please do not execute!))
###############################################################################
# Script 05_perparing_variable_wage.R
# This is a preparation file. 
# If you run the codes, please DO NOT execute step 18 (saving).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 17.
# 16. Load data
# 17. Calculate wage/FTE variable
# (18. Saving datasets (please do not execute!))
###############################################################################
# Script 06_aggregate_variables_personal_at_hospital_level.R
# This is a preparation file. 
# If you run the codes, please DO NOT execute step 21 (saving).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 20.
# 19. Load data
# 20. Create aggregated personal dataset 
# (22. Saving datasets (please do not execute!))
###############################################################################
# Script 07_merging_all_datasets_and_applying_incl_excl_criteria.R
# This is a preparation file. 
# If you run the codes, please DO NOT execute step 28 (saving)).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 24.
# 23. Load data
# 24. Removing all variables not necessary from hosp dataset
# 25. Merging hospital and aggregated personnel dataset together
# 26. Applying inclusion/exclusion criteria to final dataset
# 27. Selecting variables for final dataset
# (28. Saving datasets (please do not execute!))
###############################################################################
# 0. Install/load packages ----
library(tidyverse)
library(dplyr)


# 1. Set work directory ----
setwd("/Volumes/research$/HONEST Team/BFS_New_Data_2024/")


# Script 00_load_raw_data.R ----
# 2. Load datasets ----
## 2.1 load typo_ks_allg_2014-2022 (allg)
allg <- read.csv("typo_ks_allg_2014-2022.csv", 
                 sep = ";", 
                 comment.char = "#", 
                 colClasses = c (
                   "BUR_ALEAT_T"="factor",
                   "AKTIVITAET_A" = "numeric",
                   "AKTIVITAET_P" = "numeric",
                   "AKTIVITAET_R" = "numeric",
                   "AKTIVITAET_B" = "numeric",
                   "TYPOLOGIE" = "numeric",
                   "TYPOL99" = "factor",
                   "ANGEBOT_AMB" = "numeric",
                   "ANGEBOT_STAT" = "numeric",
                   "OE_BEITRAG_PAUSCHALE" = "numeric",
                   "OE_BEITRAG_GL" = "numeric",
                   "GL_AUSBILDUNG_MEDIZIN" = "numeric"))


## 2.2. load typo_ks_fibu_2014-2022 (lohn)
lohn <- read.csv("typo_ks_fibu_2014-2022.csv", 
                 sep = ";", 
                 comment.char = "#", 
                 colClasses = c (
                   "BUR_ALEAT_T"="factor",
                   "LOHN_ARZT" = "numeric",
                   "LOHN_PFLEGE"="numeric",
                   "LOHN_MEDTECH_PERS" = "numeric",
                   "LOHN_MEDTHERA_PERS" = "numeric",
                   "LOHN_SOZIALDIENST" = "numeric",
                   "LOHN_HAUSDIENST" = "numeric",
                   "LOHN_TECHDIENST" = "numeric",
                   "LOHN_ADMIN" = "numeric",
                   "LOHN_TOTAL" = "numeric",
                   "HONORAR_ARZT" = "numeric",
                   "SOZIALVERSICHERUNG" = "numeric",
                   "REST_PERSONAL_AU" = "numeric",
                   "PERSONAL_AU_TOTAL" = "numeric" ))

## 2.3 laod typo_ks_kostentraeger_2014-2022 (kost) (NOT NEEDED FOR AIM 1)
# kost <- read.csv("typo_ks_kostentraeger_2014-2022.csv", 
                  sep = ";",
                  comment.char = "#", 
                  colClasses = c (
                    "BUR_ALEAT_T"="factor",
                    "ACT_ID" = "factor",
                    "ACT_NOM_D"="factor"))


## 2.4 load typo_ks_leistungen_2014-2022 (leist)
leist <- read.csv("typo_ks_leistungen_2014-2022.csv", 
                  sep = ";", 
                  comment.char = "#", 
                  colClasses = c (
                    "BUR_ALEAT_T"="factor",
                    "ACT_ID" = "factor",
                    "ACT_NOM_D"="factor",
                    "PFLEGETAGE_STATIONAER" = "numeric",
                    "AUSTRITTE_STATIONAER" = "numeric",
                    "PFLEGETAGE_NEUGEBORENE" = "numeric",
                    "AUSTRITTE_NEUGEBORENE" = "numeric",
                    "AMBULANTE_KONSULTATIONEN" = "numeric",
                    "BETRIEBSBETTENTAGE" = "numeric",
                    "PLANBETTEN" = "numeric" ))


## 2.5 load typo_ks_personal_2014-2022 (personal)
personal <- read.csv ("typo_ks_personal_2014-2022.csv", 
                      sep = ";", 
                      comment.char = "#",
                      colClasses = c (
                        "BUR_ALEAT_T"="factor",
                        "MA_LAUFNR" = "numeric",
                        "MA_GEBURTSJAHR" = "numeric",
                        "MA_SEX" = "numeric",
                        "FUNKTIONSGRUPPE_ID" = "numeric",
                        "MA_BEZAHLTE_ARBEITSZEIT" = "numeric",
                        "GELEISTETE_ARBEITSZEIT_EXT" = "numeric",
                        "MA_FTE" = "numeric",
                        "MA_ENDE_JAHR" = "numeric",
                        "MA_HERKUNFT_DIPLOM" = "numeric",
                        "MA_IN_AUSBILDUNG" = "numeric",
                        "MA_NATION_CH" = "numeric",
                        "MA_NATION_D" = "numeric",
                        "MA_NATION_F" = "numeric",
                        "MA_NATION_I" = "numeric",
                        "MA_NATION_REST_EU" = "numeric",
                        "MA_NATION_US_CAN" = "numeric",
                        "MA_NATION_REST" = "numeric" ))


# 3. saving raw datasets (please do not execute!)----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/00_new_raw_data.RData")

###############################################################################
# Script 01_handling_missing_values_and_recording.R ----
# 4. Load raw datasets ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("00_new_raw_data.RData")


# 5. Recoding missing values, etc. ----
## 5.1 allg dataset
### 5.1.1 recoding NAs
#### LETZTE_ERHEBUNG
# transforming 9999 in NAs
allg$LETZTE_ERHEBUNG [allg$LETZTE_ERHEBUNG == "9999" ] <- NA

#### EROEFFNUNG
# transforming empty spaces in NAs
allg$EROEFFNUNG [allg$EROEFFNUNG == "" | allg$EROEFFNUNG == " "] <- NA

#### SCHLIESSUNG
# transforming empty spaces in NAs
allg$SCHLIESSUNG [allg$SCHLIESSUNG == "" | allg$SCHLIESSUNG == " "] <- NA

#### FTE_CHEFARZT
# transforming 0 in NA
allg$FTE_CHEFARZT [allg$FTE_CHEFARZT == 0] <- NA

#### FTE_LEITENDER_ARZT
# transforming 0 in NA
allg$FTE_LEITENDER_ARZT [allg$FTE_LEITENDER_ARZT == 0] <- NA

#### FTE_SPITALARZT
# transforming 0 in NA
allg$FTE_SPITALARZT [allg$FTE_SPITALARZT == 0] <- NA

#### FTE_OBERARZT
# transforming 0 in NA
allg$FTE_OBERARZT [allg$FTE_OBERARZT == 0] <- NA

#### FTE_ASSISTENZ
# transforming 0 in NA
allg$FTE_ASSISTENZ [allg$FTE_ASSISTENZ == 0] <- NA

#### FTE_UNTERASSISTENZ
# transforming 0 in NA
allg$FTE_UNTERASSISTENZ [allg$FTE_UNTERASSISTENZ == 0] <- NA

#### FTE_PFLEGEFACH_SPEZ
# transforming 0 in NA
allg$FTE_PFLEGEFACH_SPEZ [allg$FTE_PFLEGEFACH_SPEZ == 0] <- NA

#### FTE_PFLEGEFACH_NICHT_SPEZ
# transforming 0 in NA
allg$FTE_PFLEGEFACH_NICHT_SPEZ [allg$FTE_PFLEGEFACH_NICHT_SPEZ == 0] <- NA

#### FTE_PFLEGE_SEK
# transforming 0 in NA
allg$FTE_PFLEGE_SEK [allg$FTE_PFLEGE_SEK == 0] <- NA

#### FTE_PFLEGE_ASSISTENZ
# transforming 0 in NA
allg$FTE_PFLEGE_ASSISTENZ [allg$FTE_PFLEGE_ASSISTENZ == 0] <- NA

#### FTE_PFLEGE_REST
# transforming 0 in NA
allg$FTE_PFLEGE_REST [allg$FTE_PFLEGE_REST == 0] <- NA

#### FTE_HEBAMME
# transforming 0 in NA
allg$FTE_HEBAMME [allg$FTE_HEBAMME == 0] <- NA

#### FTE_TECHN_OP_FACHPERSON
# transforming 0 in NA
allg$FTE_TECHN_OP_FACHPERSON [allg$FTE_TECHN_OP_FACHPERSON == 0] <- NA

#### FTE_RADIOLOGIE
# transforming 0 in NA
allg$FTE_RADIOLOGIE [allg$FTE_RADIOLOGIE == 0] <- NA

#### FTE_BIOMED_ANALYTIK
# transforming 0 in NA
allg$FTE_BIOMED_ANALYTIK [allg$FTE_BIOMED_ANALYTIK == 0] <- NA

#### FTE_MED_TECH_PERS_SEK
# transforming 0 in NA
allg$FTE_MED_TECH_PERS_SEK [allg$FTE_MED_TECH_PERS_SEK == 0] <- NA

#### FTE_RETTUNGSSANITAET
# transforming 0 in NA
allg$FTE_RETTUNGSSANITAET [allg$FTE_RETTUNGSSANITAET == 0] <- NA

#### FTE_TRANSPORTSANITAET
# transforming 0 in NA
allg$FTE_TRANSPORTSANITAET [allg$FTE_TRANSPORTSANITAET == 0] <- NA

#### FTE_AKAD_PERS
# transforming 0 in NA
allg$FTE_AKAD_PERS [allg$FTE_AKAD_PERS == 0] <- NA

#### FTE_PHYSIO
# transforming 0 in NA
allg$FTE_PHYSIO [allg$FTE_PHYSIO == 0] <- NA

#### FTE_ERGO
# transforming 0 in NA
allg$FTE_ERGO [allg$FTE_ERGO == 0] <- NA

#### FTE_ERNAEHRUNG
# transforming 0 in NA
allg$FTE_ERNAEHRUNG [allg$FTE_ERNAEHRUNG == 0] <- NA

#### FTE_LOGO
# transforming 0 in NA
allg$FTE_LOGO [allg$FTE_LOGO == 0] <- NA

#### FTE_AKTIVIERUNG
# transforming 0 in NA
allg$FTE_AKTIVIERUNG [allg$FTE_AKTIVIERUNG == 0] <- NA

#### FTE_PSYCHOLOGIN
# transforming 0 in NA
allg$FTE_PSYCHOLOGIN [allg$FTE_PSYCHOLOGIN == 0] <- NA

#### FTE_MASSEURIN
# transforming 0 in NA
allg$FTE_MASSEURIN [allg$FTE_MASSEURIN == 0] <- NA

#### FTE_MED_THERAP_PERS_SEK
# transforming 0 in NA
allg$FTE_MED_THERAP_PERS_SEK [allg$FTE_MED_THERAP_PERS_SEK == 0] <- NA

#### FTE_ANDERER_THERAPEUT
# transforming 0 in NA
allg$FTE_ANDERER_THERAPEUT [allg$FTE_ANDERER_THERAPEUT == 0] <- NA

#### FTE_SOZIALDIENST
# transforming 0 in NA
allg$FTE_SOZIALDIENST [allg$FTE_SOZIALDIENST == 0] <- NA

#### FTE_HAUSDIENST
# transforming 0 in NA
allg$FTE_HAUSDIENST [allg$FTE_HAUSDIENST == 0] <- NA

#### FTE_TECHN_DIENSTE
# transforming 0 in NA
allg$FTE_TECHN_DIENSTE [allg$FTE_TECHN_DIENSTE == 0] <- NA

#### FTE_ADMIN
# transforming 0 in NA
allg$FTE_ADMIN [allg$FTE_ADMIN == 0] <- NA

### 5.1.2 recoding 2 to 0
#### ANGEBOT_AMB
# transforming 2 = no into 0
allg$ANGEBOT_AMB [allg$ANGEBOT_AMB %in% "2"] <- 0

#### SPITALLISTE_HOME
# transforming 2 = no into 0
allg$SPITALLISTE_HOME [allg$SPITALLISTE_HOME %in% "2"] <- 0

#### SPITALLISTE_OTHERS
# transforming 2 = no into 0
allg$SPITALLISTE_OTHERS [allg$SPITALLISTE_OTHERS %in% "2"] <- 0

#### VERTRAGSSPITAL
# transforming 2 = no into 0
allg$VERTRAGSSPITAL [allg$VERTRAGSSPITAL %in% "2"] <- 0

#### OE_BEITRAG_PAUSCHALE
# transforming 2 = no into 0
allg$OE_BEITRAG_PAUSCHALE [allg$OE_BEITRAG_PAUSCHALE %in% "2"] <- 0

#### OE_BEITRAG_GL
# transforming 2 = no into 0
allg$OE_BEITRAG_GL [allg$OE_BEITRAG_GL %in% "2"] <- 0

#### OE_BEITRAG_DEFIZITDECKUNG
# transforming 2 = no into 0
allg$OE_BEITRAG_DEFIZITDECKUNG [allg$OE_BEITRAG_DEFIZITDECKUNG %in% "2"] <- 0

#### ANGEBOT_AMB
# transforming 2 = no into 0
allg$ANGEBOT_AMB [allg$ANGEBOT_AMB %in% "2"] <- 0

#### SPITALLISTE_HOME
# transforming 2 = no into 0
allg$SPITALLISTE_HOME [allg$SPITALLISTE_HOME %in% "2"] <- 0

#### SPITALLISTE_OTHERS
# transforming 2 = no into 0
allg$SPITALLISTE_OTHERS [allg$SPITALLISTE_OTHERS %in% "2"] <- 0

#### VERTRAGSSPITAL
# transforming 2 = no into 0
allg$VERTRAGSSPITAL [allg$VERTRAGSSPITAL %in% "2"] <- 0

#### OE_BEITRAG_PAUSCHALE
# transforming 2 = no into 0
allg$OE_BEITRAG_PAUSCHALE [allg$OE_BEITRAG_PAUSCHALE %in% "2"] <- 0

#### OE_BEITRAG_GL
# transforming 2 = no into 0
allg$OE_BEITRAG_GL [allg$OE_BEITRAG_GL %in% "2"] <- 0

#### OE_BEITRAG_DEFIZITDECKUNG
# transforming 2 = no into 0
allg$OE_BEITRAG_DEFIZITDECKUNG [allg$OE_BEITRAG_DEFIZITDECKUNG %in% "2"] <- 0

#### GLOBALBUDGET_HOME
# transforming 2 = no into 0
allg$GLOBALBUDGET_HOME [allg$GLOBALBUDGET_HOME %in% "2"] <- 0

#### GLOBALBUDGET_OTHERS
# transforming 2 = no into 0
allg$GLOBALBUDGET_OTHERS [allg$GLOBALBUDGET_OTHERS %in% "2"] <- 0

#### OE_BEITRAG_ANDERS
# transforming 2 = no into 0
allg$OE_BEITRAG_ANDERS [allg$OE_BEITRAG_ANDERS %in% "2"] <- 0

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### 

## 5.2 lohn dataset
### 5.2.1 recoding NAs
#### LOHN_ARZT
# transforming 0 in NA
lohn$LOHN_ARZT[lohn$LOHN_ARZT==0]<- NA

#### LOHN_PFLEGE
# transforming 0 in NA
lohn$LOHN_PFLEGE[lohn$LOHN_PFLEGE==0]<- NA

#### LOHN_MEDTECH_PERS
# transforming 0 in NA
lohn$LOHN_MEDTECH_PERS[lohn$LOHN_MEDTECH_PERS==0]<- NA 
# transforming 1 in NA
lohn$LOHN_MEDTECH_PERS[lohn$LOHN_MEDTECH_PERS==1]<- NA 

#### LOHN_MEDTHERA_PERS
# transforming 0 in NA
lohn$LOHN_MEDTHERA_PERS[lohn$LOHN_MEDTHERA_PERS==0]<- NA 
# transforming 1 in NA
lohn$LOHN_MEDTHERA_PERS[lohn$LOHN_MEDTHERA_PERS==1]<- NA 

#### LOHN_SOZIALDIENST
# transforming 0 in NA
lohn$LOHN_SOZIALDIENST[lohn$LOHN_SOZIALDIENST==0]<- NA 

#### LOHN_HAUSDIENST
# transforming 0 in NA
lohn$LOHN_HAUSDIENST[lohn$LOHN_HAUSDIENST==0]<- NA 

#### LOHN_TECHDIENST
# transforming 0 in NA
lohn$LOHN_TECHDIENST[lohn$LOHN_TECHDIENST==0]<- NA 

#### LOHN_ADMIN
# transforming 0 in NA
lohn$LOHN_ADMIN[lohn$LOHN_ADMIN==0]<- NA 

#### LOHN_TOTAL
# transforming 0 in NA
lohn$LOHN_TOTAL[lohn$LOHN_TOTAL==0]<- NA 

#### HONORAR_ARZT
# transforming 0 in NA
lohn$HONORAR_ARZT[lohn$HONORAR_ARZT==0]<- NA 

#### SOZIALVERSICHERUNG
# transforming 0 in NA
lohn$SOZIALVERSICHERUNG[lohn$SOZIALVERSICHERUNG==0]<- NA 

#### REST_PERSONAL_AU
# transforming 0 in NA
lohn$REST_PERSONAL_AU[lohn$REST_PERSONAL_AU==0]<- NA 

#### PERSONAL_AU_TOTAL
# transforming 0 in NA
lohn$PERSONAL_AU_TOTAL[lohn$PERSONAL_AU_TOTAL==0]<- NA

#### HONORAR_MED_LEISTUNG_ARZT
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_ARZT[lohn$HONORAR_MED_LEISTUNG_ARZT==0]<- NA 

#### HONORAR_MED_LEISTUNG_HEBAMME
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_HEBAMME[lohn$HONORAR_MED_LEISTUNG_HEBAMME==0]<- NA 

#### HONORAR_MED_LEISTUNG_UEBRIGE
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_UEBRIGE[lohn$HONORAR_MED_LEISTUNG_UEBRIGE==0]<- NA 

#### HONORAR_MED_LEISTUNG_TOTAL
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_TOTAL[lohn$HONORAR_MED_LEISTUNG_TOTAL==0]<- NA 

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## 5.3 leist dataset
### 5.3.1 recoding NAs
#### ACT_ID
# changing the observation that has no category to NAs
leist$ACT_ID [leist$ACT_ID == "" ] <- NA
# dropping level with name "" 
leist$ACT_ID <- droplevels(leist$ACT_ID)

#### ACT_NOM_D
# changing observation without category in NA
leist$ACT_NOM_D [leist$ACT_NOM_D == ""] <- NA
# dropping level with name "" 
leist$ACT_NOM_D <- droplevels(leist$ACT_NOM_D)

#### PFLEGETAGE_STATIONAER
# transforming 0 in NA, hospitals with 0 inpatient days are not hospitals
leist$PFLEGETAGE_STATIONAER[leist$PFLEGETAGE_STATIONAER == 0 ]<- NA

#### AUSTRITTE_STATIONAER
# transforming 0 in NA, impossibile to have 0 discharges as a hospital
leist$AUSTRITTE_STATIONAER[leist$AUSTRITTE_STATIONAER == 0 ]<- NA

#### PFLEGETAGE_NEUGEBORENE
# transforming 0 in NA
leist$PFLEGETAGE_NEUGEBORENE[leist$PFLEGETAGE_NEUGEBORENE == 0 ]<- NA
summary(leist$PFLEGETAGE_NEUGEBORENE)

#### AUSTRITTE_NEUGEBORENE
# transforming 0 in NA
leist$AUSTRITTE_NEUGEBORENE[leist$AUSTRITTE_NEUGEBORENE == 0 ]<- NA

#### AMBULANTE_KONSULTATIONEN
# transforming 0 in NA
leist$AMBULANTE_KONSULTATIONEN[leist$AMBULANTE_KONSULTATIONEN == 0 ]<- NA

#### BETRIEBSBETTENTAGE
# transforming 0 in NA, hospitals with no operating bed days can't be hospitals
leist$BETRIEBSBETTENTAGE[leist$BETRIEBSBETTENTAGE == 0 ]<- NA

#### PLANBETTEN
# transforming 0 in NA
# leist$PLANBETTEN[leist$PLANBETTEN == 0 ]<- NA

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## 5.4 personal dataset
### 5.4.1 recoding NAs
#### MA_GEBURTSJAHR
# transforming 0 in NA
personal$MA_GEBURTSJAHR[personal$MA_GEBURTSJAHR == 0 ]<- NA
# personal14$MA_GEBURTSJAHR[personal14$MA_GEBURTSJAHR < 1953 ]<- NA

#### FUNKTIONSGRUPPE
# transforming " " in NA
personal$FUNKTIONSGRUPPE[personal$FUNKTIONSGRUPPE == "" ]<- NA

#### MA_BEZAHLTE_ARBEITSZEIT
# transforming 0 in NA
personal$MA_BEZAHLTE_ARBEITSZEIT[personal$MA_BEZAHLTE_ARBEITSZEIT == 0 ]<- NA

#### GELEISTETE_ARBEITSZEIT_EXT
# transforming 0 in NA
personal$GELEISTETE_ARBEITSZEIT_EXT[personal$GELEISTETE_ARBEITSZEIT_EXT == 0 ]<- NA

#### MA_FTE
# transforming 0 and >1 in NA
personal$MA_FTE[personal$MA_FTE == 0 ]<- NA
personal$MA_FTE[personal$MA_FTE > 1 ]<- NA

#### MA_ENDE_JAHR
# transforming 9 in NA
personal$MA_ENDE_JAHR[personal$MA_ENDE_JAHR == 9 ]<- NA

#### MA_HAUPTLEISTUNGSSTELLE
# changing in NA values that don't have a variable 
personal$MA_HAUPTLEISTUNGSSTELLE[personal$MA_HAUPTLEISTUNGSSTELLE == "" ]<- NA

### 5.4.2 recoding
#### MA_SEX
# transforming 2 = female into 1
# 0 is male
# 1 is female
personal$MA_SEX [personal$MA_SEX %in% "1"] <- 0
personal$MA_SEX [personal$MA_SEX %in% "2"] <- 1

#### FUNKTIONSGRUPPE
# changing \xc4rzteschaft in Aerzteschaft
personal$FUNKTIONSGRUPPE [personal$FUNKTIONSGRUPPE %in% "\xc4rzteschaft"] <- "Aerzteschaft"

#re-leveling FUNKTIONSGRUPPE
personal$FUNKTIONSGRUPPE <- factor(personal$FUNKTIONSGRUPPE, levels =   c("Aerzteschaft", 
                                                                          "Pflegepersonal", 
                                                                          "Medizinisch - technisches Personal", 
                                                                          "Medizinisch - therapeutisches Personal", 
                                                                          "Sozialdienste", "Hausdienst", 
                                                                          "Technische Dienste", "Administrativpersonal", 
                                                                          "Externes Personal"))


# 6. saving datasets (please do not execute!) ----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/01_new_clean_raw_data.RData")


###############################################################################
# Script 02_create_new_variables.R ----
# 7. Load clean datasets ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("01_new_clean_raw_data.RData")

# 8. Create new variables ----
## 8.1 create NEW variables in allg dataset
### NEW typologie.f
allg$typologie.f <- NA
allg$typologie.f [allg$TYPOL99 %in% 'K111'] <- "University hospital"
allg$typologie.f [allg$TYPOL99 %in% 'K112'] <- "Cantonal hospital"
allg$typologie.f [allg$TYPOL99 %in% 'K121'] <- "Supply level 3 hospital"
allg$typologie.f [allg$TYPOL99 %in% 'K122'] <- "Supply level 4 hospital"
allg$typologie.f [allg$TYPOL99 %in% 'K123'] <- "Supply level 5 hospital"
allg$typologie.f [allg$TYPOL99 %in% 'K211'] <- "Psychiatry supply level 1"
allg$typologie.f [allg$TYPOL99 %in% 'K212'] <- "Psychiatry supply level 2"
allg$typologie.f [allg$TYPOL99 %in% 'K221'] <- "Rehabilitation"
allg$typologie.f [allg$TYPOL99 %in% 'K231'] <- "Special clinic"
allg$typologie.f [allg$TYPOL99 %in% 'K232'] <- "SK Ginecology/Neonatology"
allg$typologie.f [allg$TYPOL99 %in% 'K233'] <- "Special clinic"
allg$typologie.f [allg$TYPOL99 %in% 'K234'] <- "Special clinic"
allg$typologie.f [allg$TYPOL99 %in% 'K235'] <- "Special clinic"

# transforming in factor
allg$typologie.f <- factor(allg$typologie.f, levels = c ("University hospital", "Cantonal hospital", "Supply level 3 hospital", "Supply level 4 hospital", "Supply level 5 hospital", "Special clinic", "Psychiatry supply level 1", "Psychiatry supply level 2", "Rehabilitation", "SK Ginecology/Neonatology"))

# change position of NEW typologie.f 
allg <- allg %>% relocate (typologie.f, .before = TYPOLOGIE)

### NEW activity.f
allg$activity.f <- NA
allg$activity.f [allg$TYPOL99 %in% 'K111'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K112'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K121'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K122'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K123'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K211'] <- "Psychiatrie"
allg$activity.f [allg$TYPOL99 %in% 'K212'] <- "Psychiatrie"
allg$activity.f [allg$TYPOL99 %in% 'K221'] <- "Rehabilitation / Geriatrie"
allg$activity.f [allg$TYPOL99 %in% 'K231'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K232'] <- "Geburtshaus"
allg$activity.f [allg$TYPOL99 %in% 'K233'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K234'] <- "Akutpflege"
allg$activity.f [allg$TYPOL99 %in% 'K235'] <- "Akutpflege"

# transforming in factor
allg$activity.f <- as.factor(allg$activity.f)

# change position of NEW activity.f 
allg <- allg %>% relocate (activity.f, .before = typologie.f)

### NEW RECHTSFORM.f
# changing numbers into meaningful names
allg$RECHTSFORM.f <- NA
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "1"] <- "Einzelfirma"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "2"] <- "Einfache Gesellschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "3"] <- "Kollektivgesellschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "4"] <- "Kommanditgesellschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "5"] <- "Kommanditaktiengesellschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "6"] <- "Aktiengesellschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "7"] <- "Gesellschaft beschränkter Haftung"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "8"] <- "Genossenschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "9"] <- "Verein"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "10"] <- "Stiftung"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "20"] <- "Verwaltung Bund"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "21"] <- " Verwaltung Kanton"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "22"] <- " Verwaltung Bezirk"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "23"] <- "Verwaltung Gemeinde"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "24"] <- "Öffentlich-rechtliche Körperschaften Verwaltung"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "25"] <- "Staatlich anerkannte Kirche"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "27"] <- "Ausländische Rechtsform"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "28"] <- "Ausländischer Staat/Botschaft"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "29"] <- "Internationale Organisation"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "30"] <- "Öffentliche Unternehmen des Bundes"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "31"] <- "Öffentliche Unternehmen des Kantons"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "32"] <- "Öffentliche Unternehmen des Bezirks"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "33"] <- "Öffentliche Unternehmen der Gemeinde"
allg$RECHTSFORM.f [allg$RECHTSFORM %in% "34"] <- "Öffentliche Unternehmen einer Körperschaft"

# transforming in factor
allg$RECHTSFORM.f <- as.factor(allg$RECHTSFORM.f)


# change position of NEW RECHTSFORM.f
allg <- allg %>% relocate (RECHTSFORM.f, .before  = ERSTE_ERHEBUNG)

### NEW FTE_ARZT
# creating new var called FTE_ARZT which is the mean value of all other physicians subgroups
allg <- allg %>% rowwise() %>%
  mutate(FTE_ARZT = mean(c(FTE_CHEFARZT, FTE_LEITENDER_ARZT, FTE_SPITALARZT, FTE_OBERARZT, FTE_ASSISTENZ, FTE_UNTERASSISTENZ)))

# change position of NEW var 
allg <- allg %>% relocate (FTE_ARZT, .before = FTE_PFLEGEFACH_SPEZ)

### NEW FTE_PFLEGE
# (Hebamme included) creating new var called FTE_PFLEGE which is the mean value of all other nursing professions
allg <- allg %>% rowwise() %>%
  mutate(FTE_PFLEGE = mean(c(FTE_PFLEGEFACH_SPEZ, FTE_PFLEGEFACH_NICHT_SPEZ, FTE_PFLEGE_SEK, FTE_PFLEGE_ASSISTENZ, FTE_PFLEGE_REST, FTE_HEBAMME)))

# change position of NEW var 
allg <- allg %>% relocate (FTE_PFLEGE, .before = FTE_TECHN_OP_FACHPERSON)

### NEW FTE_OTHERS
# creating new var called FTE_OTHER which is the mean value of all other professions
allg <- allg %>% rowwise() %>%
  mutate(FTE_OTHERS = mean(c(FTE_TECHN_OP_FACHPERSON, FTE_RADIOLOGIE, FTE_BIOMED_ANALYTIK, FTE_MED_TECH_PERS_SEK, FTE_RETTUNGSSANITAET, FTE_TRANSPORTSANITAET, FTE_AKAD_PERS, FTE_PHYSIO, FTE_ERGO, FTE_ERNAEHRUNG, FTE_LOGO, FTE_AKTIVIERUNG, FTE_PSYCHOLOGIN, FTE_MASSEURIN, FTE_MED_THERAP_PERS_SEK, FTE_ANDERER_THERAPEUT, FTE_SOZIALDIENST, FTE_HAUSDIENST, FTE_TECHN_DIENSTE, FTE_ADMIN )))

# change position of NEW var 
allg <- allg %>% relocate (FTE_OTHERS, .before = LANGZEIT_PFLEGETAGE)

### NEW Diagnostic equipment (DiagEq)
allg$DiagEq <- NA
allg$DiagEq <- allg$MRI + allg$CT_SCANNER + allg$PET_SCANNER + allg$GAMMA_CAMERA + allg$ANGIOGRAPHIE

# change position of NEW var 
allg <- allg %>% relocate (DiagEq, .before = MRI)

### NEW Diagnostic equipment (DiagEq) EXAMEN TOTAL
allg$DiagEq_EXAMEN_TOTAL <- NA
allg$DiagEq_EXAMEN_TOTAL <- allg$MRI_EXAMEN_TOTAL + allg$CT_SCANNER_EXAMEN_TOTAL + allg$PET_SCANNER_EXAMEN_TOTAL + allg$GAMMA_CAMERA_EXAMEN_TOTAL + allg$ANGIOGRAPHIE_EXAMEN_TOTAL

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_TOTAL, .before = MRI_EXAMEN_TOTAL)

### NEW Diagnostic equipment (DiagEq) EXAMEN AMB
allg$DiagEq_EXAMEN_AMB <- NA
allg$DiagEq_EXAMEN_AMB <- allg$MRI_EXAMEN_AMB + allg$CT_SCANNER_EXAMEN_AMB + allg$PET_SCANNER_EXAMEN_AMB + allg$GAMMA_CAMERA_EXAMEN_AMB + allg$ANGIOGRAPHIE_EXAMEN_AMB

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_AMB, .before = MRI_EXAMEN_AMB)

### NEW Diagnostic equipment (DiagEq) EXAMEN STAT
allg$DiagEq_EXAMEN_STAT <- NA
allg$DiagEq_EXAMEN_STAT <- allg$MRI_EXAMEN_STAT + allg$CT_SCANNER_EXAMEN_STAT + allg$PET_SCANNER_EXAMEN_STAT + allg$GAMMA_CAMERA_EXAMEN_STAT + allg$ANGIOGRAPHIE_EXAMEN_STAT

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_STAT, .before = MRI_EXAMEN_STAT)


### NEW Therapeutic equipment (TherEq)
allg$TherEq <- NA
allg$TherEq <- allg$LINEARBESCHLEUNIGER + allg$LITHOTRIPTOR + allg$DIALYSE

# change position of NEW var 
allg <- allg %>% relocate (TherEq, .before = MRI)

### NEW Therapeutic equipment (TherEq) EXAMEN TOTAL
allg$TherEq_EXAMEN_TOTAL <- NA
allg$TherEq_EXAMEN_TOTAL <- allg$LINEARBESCHLEUNIGER_EXAMEN_TOT + allg$LITHOTRIPTOR_EXAMEN_TOTAL + allg$DIALYSE_EXAMEN_TOTAL

# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_TOTAL, .before = MRI_EXAMEN_TOTAL)

### NEW Therapeutic equipment (TherEq) EXAMEN AMB
allg$TherEq_EXAMEN_AMB <- NA
allg$TherEq_EXAMEN_AMB <- allg$LINEARBESCHLEUNIGER_EXAMEN_AMB + allg$LITHOTRIPTOR_EXAMEN_AMB + allg$DIALYSE_EXAMEN_AMB

# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_AMB, .before = MRI_EXAMEN_AMB)

### NEW Therapeutic equipment (TherEq) EXAMEN STAT
allg$TherEq_EXAMEN_STAT <- NA
allg$TherEq_EXAMEN_STAT <- allg$LINEARBESCHLEUNIGER_EXAMEN_STA + allg$LITHOTRIPTOR_EXAMEN_STAT + allg$DIALYSE_EXAMEN_STAT
# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_STAT, .before = MRI_EXAMEN_STAT)


### NEW equipment - Therapeutic and Diagnostic Equipment total (count)
allg$equipment <- NA
allg$equipment <- allg$TherEq + allg$DiagEq

# change position of NEW var 
allg <- allg %>% relocate (equipment, .before = DiagEq)

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## 8.2 create NEW variable in lohn dataset
### NEW LOHN_OTHERS
# creating new var called LOHN_OTHERS which is the mean value of all other professions
lohn <- lohn %>% rowwise() %>%
  mutate(LOHN_OTHERS = mean(c(LOHN_MEDTECH_PERS, LOHN_MEDTHERA_PERS, LOHN_SOZIALDIENST, LOHN_HAUSDIENST, LOHN_TECHDIENST, LOHN_ADMIN)))

# change position of NEW LOHN_OTHERS 
lohn <- lohn %>% relocate (LOHN_OTHERS, .after = LOHN_ADMIN)

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

## 8.3 create NEW variables in personal dataset 
### NEW age
# creating new var age
personal$age <- NA
personal$age <- personal$JAHR - personal$MA_GEBURTSJAHR

# keeping only meaningful age
personal$age [personal$age < 18] <- NA
personal$age [personal$age > 65] <- NA

personal <- personal %>% drop_na(age)

### NEW sex.f
# changing 1 and 2 in male and female
personal$sex.f <- NA
personal$sex.f  [personal$MA_SEX %in% "1"] <- "Male"
personal$sex.f [personal$MA_SEX %in% "2"] <- "Female"
personal$sex.f <- as.factor(personal$sex.f)

### NEW ma_funktion.f
personal$ma_funktion.f <- as.factor(personal$MA_FUNKTION)

levels(personal$ma_funktion.f)<-c("AChef","ALeitung","ASpital","AOber","AAss","AUnterA","PDiplS","PDipl","PSekII","PAss","PSonst","Hebamme","MTTechOP","MTRadio","MTBiomedA","MTMTSekII","MTRettung","MTTransport","MTAkadPers","MTPPhysio","MTPErgo","MTPErnährung","MTPLogo","MTPAktivierung","MTPPsychol","MTPMasseur","MTPSekII","MTPAndere","AndereSozial","AndereHaus","AndereTechnik","AndereAdmin","ExtArzt","ExtHebamme","ExtMedPers")

# renaming creating only 3 cat for nurses and physicians
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AChef"] <- "Physicians chiefs and leading"
personal$ma_funktion.fu [personal$ma_funktion.f %in% "ALeitung"] <- "Physicians chiefs and leading"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "ASpital"] <- "Physicians attendings and hospital"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AOber"] <- "Physicians attendings and hospital"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AAss"] <- "Physicians residents and students"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AUnterA"] <- "Physicians residents and students"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "PDiplS"] <- "Nurses RNs + special. (inkl. midwives)"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "PDipl"] <- "Nurses RNs + special. (inkl. midwives)"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "Hebamme"] <- "Nurses RNs + special. (inkl. midwives)"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "PSekII"] <- "Nurses LPNs"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "PAss"] <- "Nurses assist."
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "PSonst"] <- "Nurses assist."
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTTechOP"] <- "MTTechOP"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTRadio"] <- "MTRadio"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTBiomedA"] <- "MTBiomedA"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTMTSekII"] <- "MTMTSekII"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTRettung"] <- "MTRettung"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTTransport"] <- "MTTransport"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTAkadPers"] <- "MTAkadPers"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPPhysio"] <- "MTPPhysio"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPErgo"] <- "MTPErgo"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPErnährung"] <- "MTPErnährung"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPLogo"] <- "MTPLogo"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPAktivierung"] <- "MTPAktivierung"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPPsychol"] <- "MTPPsychol"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPMasseur"] <- "MTPMasseur"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPSekII"] <- "MTPSekII"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "MTPAndere"] <- "MTPAndere"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AndereSozial"] <- "AndereSozial"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AndereHaus"] <- "AndereHaus"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AndereTechnik"] <- "AndereTechnik"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "AndereAdmin"] <- "AndereAdmin"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "ExtArzt"] <- "ExtArzt"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "ExtHebamme"] <- "ExtHebamme"
personal$ma_funktion.fu  [personal$ma_funktion.f %in% "ExtMedPers"] <- "ExtMedPers"

#as.factor
personal$ma_funktion.f <- as.factor(personal$ma_funktion.fu)

personal$ma_funktion.f <- factor(personal$ma_funktion.f, levels=c("Physicians chiefs and leading", "Physicians attendings and hospital", "Physicians residents and students", "Nurses RNs + special. (inkl. midwives)", "Nurses LPNs", "Nurses assist.", "MTTechOP", "MTRadio","MTBiomedA","MTMTSekII","MTRettung","MTTransport","MTAkadPers","MTPPhysio","MTPErgo","MTPErnährung","MTPLogo","MTPAktivierung","MTPPsychol","MTPMasseur","MTPSekII","MTPAndere","AndereSozial","AndereHaus","AndereTechnik","AndereAdmin","ExtArzt","ExtHebamme","ExtMedPers"))


### NEW funk_gr
personal$funk_gr <- NA
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Aerzteschaft"] <- "Physicians"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Pflegepersonal"] <- "Nurses"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Medizinisch - technisches Personal"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Medizinisch - therapeutisches Personal"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Sozialdienste"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Hausdienst"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Technische Dienste"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Administrativpersonal"] <- "Others"
personal$funk_gr [personal$FUNKTIONSGRUPPE %in% "Externes Personal"] <- "Others"

personal$funk_gr <- factor(personal$funk_gr, levels =   c("Physicians", "Nurses", "Others"))

### NEW funk_gr.cc
# personal$funk_gr.cc <- personal$funk_gr [complete.cases(personal$funk_gr)]

### NEW funk_ph_nu
# personal$funk_ph_nu <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Aerzteschaft"] <- "Physicians"
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Pflegepersonal"] <- "Nurses"
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Medizinisch - technisches Personal"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Medizinisch - therapeutisches Personal"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Sozialdienste"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Hausdienst"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Technische Dienste"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Administrativpersonal"] <- NA
# personal$funk_ph_nu [personal$FUNKTIONSGRUPPE %in% "Externes Personal"] <- NA
# 
# personal$funk_ph_nu <- factor(personal$funk_ph_nu, levels =   c("Physicians", "Nurses"))

# personal <- personal[!is.na(personal$funk_ph_nu),]


### NEW ma_ende_jahr.f
# changing 1 and 2 in yes, no
personal$ma_ende_jahr.f <- NA
personal$ma_ende_jahr.f  [personal$MA_ENDE_JAHR %in% "1"] <- "Yes"
personal$ma_ende_jahr.f [personal$MA_ENDE_JAHR %in% "2"] <- "No"
personal$ma_ende_jahr.f <- as.factor(personal$ma_ende_jahr.f)

### NEW ma_hauptleist.f
# changing MA_HAUPTLEISTUNGSSTELLE in factor with new names
personal$ma_hauptleist.f <- NA
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'E100'] <- "Schule(n)"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'E200'] <- "Übrige Nebenbetriebe" 
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'I100'] <- "Verwaltung"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'I200'] <- "Apotheke"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'I300'] <- "Küche"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'I400'] <- "Hausdienst"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'I500'] <- "Technischer Dienst und Unterhalt"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M000'] <- "Med. Fachgebiete allg."
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M050'] <- "Intensivmedizin"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M100'] <- "Innere Med."
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M200'] <- "Chirurgie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M300'] <- "Gynäkologie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M400'] <- "Pädiatrie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M500'] <- "Psychiatrie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M600'] <- "Ophtalmologie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M700'] <- "ORL"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M800'] <- "Derma und Venereologie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M850'] <- "Med. Radiologie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M900'] <- "Geriatrie und subakute Pflege"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M950'] <- "Reha und physikalische Medizin"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'M990'] <- "Weitere Tätigkeitsgebiete"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T100'] <- "Spezielle Infrastruktur"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T200'] <- "Radiologie und Nuklearmedizin"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T300'] <- "Strahlentherapie"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T400'] <- "Diagnostische Dienste"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T500'] <- "Übrige therapeutische Dienste"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T600'] <- "Beratungs- und Sozialdienste"
personal$ma_hauptleist.f [personal$MA_HAUPTLEISTUNGSSTELLE %in% 'T700'] <- "Körperpflege"

# re-leveling
personal$ma_hauptleist.f <- factor(personal$ma_hauptleist.f, levels =   c("Schule(n)", "Übrige Nebenbetriebe",  "Verwaltung",  "Apotheke",  "Küche",  "Hausdienst",  "Technischer Dienst und Unterhalt", "Med. Fachgebiete allg.", "Intensivmedizin", "Innere Med.", "Chirurgie", "Gynäkologie", "Pädiatrie", "Psychiatrie", "Ophtalmologie", "ORL",  "Derma und Venereologie", "Med. Radiologie", "Geriatrie und subakute Pflege", "Reha und physikalische Medizin", "Weitere Tätigkeitsgebiete",  "Spezielle Infrastruktur",  "Radiologie und Nuklearmedizin",  "Strahlentherapie",  "Diagnostische Dienste",  "Übrige therapeutische Dienste",  "Beratungs- und Sozialdienste",  "Körperpflege"))

### NEW ma_diplom.f
personal$ma_diplom.f <- NA
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "1"] <- "CH"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "2"] <- "DE"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "3"] <- "FR"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "4"] <- "IT"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "5"] <- "EU"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "6"] <- "USA/CAN"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "7"] <- "other"
personal$ma_diplom.f  [personal$MA_HERKUNFT_DIPLOM %in% "8"] <- "no diploma"

personal$ma_diplom.f <- factor(personal$ma_diplom.f, levels = c("CH", "DE", "FR", "IT", "EU", "USA/CAN", "other", "no diploma"))

### NEW ma_in_ausbildung.f
# changing 1 and 0 in yes, no 
personal$ma_in_ausbildung.f <- NA
personal$ma_in_ausbildung.f [personal$MA_IN_AUSBILDUNG %in% "1"] <- "yes"
personal$ma_in_ausbildung.f [personal$MA_IN_AUSBILDUNG %in% "0"] <- "no"
personal$ma_in_ausbildung.f <- as.factor(personal$ma_in_ausbildung.f)


### NEW nation
personal <- personal %>% mutate(nation = case_when (MA_NATION_CH == 1 ~ "CH",
                                                    MA_NATION_D == 1 ~ "DE",
                                                    MA_NATION_F == 1 ~ "FR",
                                                    MA_NATION_I == 1 ~ "IT",
                                                    MA_NATION_REST_EU == 1 ~ "EU",
                                                    MA_NATION_US_CAN == 1 ~ "USA/CAN",
                                                    MA_NATION_REST == 1 ~ "other",
))

personal$nation <- factor(personal$nation, levels = c ("CH", "DE", "FR", "IT", "EU", "USA/CAN", "other"))

# change position of NEW nation 
personal <- personal %>% relocate (nation, .before = MA_NATION_CH)

### NEW nationality
personal$nationality [personal$nation %in% "CH"] <- "CH"
personal$nationality [personal$nation %in% "DE"] <- "no CH"
personal$nationality [personal$nation %in% "FR"] <- "no CH"
personal$nationality [personal$nation %in% "IT"] <- "no CH"
personal$nationality [personal$nation %in% "EU"] <- "no CH"
personal$nationality [personal$nation %in% "USA/CAN"] <- "no CH"
personal$nationality [personal$nation %in% "other"] <- "no CH"
personal$nationality <- factor(personal$nationality, levels = c ("CH", "no CH"))

# change position of NEW nationality 
personal <- personal %>% relocate (nationality, .before = MA_NATION_CH)
personal <- personal %>% relocate (nation, .before = nationality)


# 9. Saving datasets (please do not execute!) ----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/02_new_new_variables.RData")





##############################################################################
# Script 03_data_selection.R ----
# 10. Load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("02_new_new_variables.RData")


# 11. Select data of interest ----
## selecting only acute care hospitals (allg, leist, lohn datasets) 
## 11.1 allg 
allg_akut <- allg[allg$activity.f %in% c ("Akutpflege"), ]
# drop the levels of typologie.f that are not used!
allg_akut$typologie.f <- droplevels(allg_akut$typologie.f)
# only acute care hospitals

## 11.2 leist 
leist_akut <- leist [leist$ACT_NOM_D %in% c("Akutpflege"), ]
# no "Akutpflege" variable in lohn
# no "Akutpflege" variable in personal


## 11.3 lohn
# merging lohn and allg in order to selct only acute care hospitals
lohn_akut <- left_join(lohn, allg_akut, by = c ("BUR_ALEAT_T", "JAHR"))
# choosing only acute care hospitals
lohn_akut <- lohn_akut[lohn_akut$activity.f %in% c("Akutpflege"),]

## 11.4 personal
# merging personal and allg in order to select only personal working in acute care hospitals
personal_akut <- left_join(personal, allg_akut, by = c("BUR_ALEAT_T", "JAHR"))  
# choose only personal working in acute care
personal_akut <- personal_akut[personal_akut$activity.f %in% c("Akutpflege"), ]

# cleaning environment
rm(allg, leist, personal, lohn)

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# calculating the aggregated sum of all professionals will be merged in agg dataset in file 02f.1
personal_FTE_sum <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = personal_akut, sum)
colnames(personal_FTE_sum) <- c("BUR_ALEAT_T", "JAHR", "FTE.sum_all")


#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#11.b Select personal data of interest
## 11.1 Selecting only personal under contract end of year
personal_akut_cey <- personal_akut[personal_akut$ma_ende_jahr.f %in% c("Yes"), ]

## 11.2 Selecting only nurses and physicians in personal
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

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# 11.c. Variables selection
## 11.1 allg variables selection
# create main subset Allg with variables of interest
Allg_akut <- allg_akut [ , c ("BUR_ALEAT_T", "JAHR", "activity.f", "typologie.f", "RECHTSFORM.f", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS", "equipment","DiagEq", "DiagEq_EXAMEN_TOTAL", "DiagEq_EXAMEN_AMB", "DiagEq_EXAMEN_STAT", "TherEq", "TherEq_EXAMEN_TOTAL", "TherEq_EXAMEN_AMB", "TherEq_EXAMEN_STAT","MRI", "MRI_EXAMEN_TOTAL", "MRI_EXAMEN_AMB", "MRI_EXAMEN_STAT", "CT_SCANNER", "CT_SCANNER_EXAMEN_TOTAL", "CT_SCANNER_EXAMEN_AMB", "CT_SCANNER_EXAMEN_STAT", "PET_SCANNER", "PET_SCANNER_EXAMEN_TOTAL", "PET_SCANNER_EXAMEN_AMB", "PET_SCANNER_EXAMEN_STAT", "GAMMA_CAMERA", "GAMMA_CAMERA_EXAMEN_TOTAL", "GAMMA_CAMERA_EXAMEN_AMB", "GAMMA_CAMERA_EXAMEN_STAT", "LINEARBESCHLEUNIGER", "LINEARBESCHLEUNIGER_EXAMEN_TOT", "LINEARBESCHLEUNIGER_EXAMEN_AMB", "LINEARBESCHLEUNIGER_EXAMEN_STA", "LITHOTRIPTOR", "LITHOTRIPTOR_EXAMEN_TOTAL", "LITHOTRIPTOR_EXAMEN_AMB", "LITHOTRIPTOR_EXAMEN_STAT", "ANGIOGRAPHIE", "ANGIOGRAPHIE_EXAMEN_TOTAL", "ANGIOGRAPHIE_EXAMEN_AMB", "ANGIOGRAPHIE_EXAMEN_STAT", "DIALYSE", "DIALYSE_EXAMEN_TOTAL", "DIALYSE_EXAMEN_AMB", "DIALYSE_EXAMEN_STAT")]


## 11.2 leist variables selection
# create main subset Leist with variables of interest
Leist_akut <- leist_akut [ , c("BUR_ALEAT_T", "JAHR", "PFLEGETAGE_STATIONAER", "AUSTRITTE_STATIONAER", "AMBULANTE_KONSULTATIONEN")]


## 11.3 lohn variables selection
# create main subset Lohn with variables of interest
Lohn_akut <- lohn_akut [ , c("BUR_ALEAT_T", "JAHR", "LOHN_ARZT", "LOHN_PFLEGE", "LOHN_OTHERS", "LOHN_TOTAL")]


## 11.4 personal variables selection
# create main subset Personal with variables of interest
Personal_akut <- personal_akut_ceyPN [ , c("BUR_ALEAT_T", "JAHR", "sex.f", "age", "MA_FTE", "MA_BEZAHLTE_ARBEITSZEIT", "ma_funktion.f", "funk_gr", "ma_diplom.f", "nation", "nationality","typologie.f", "MA_IN_AUSBILDUNG", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS")]

# Personal_akut_NOtrain <- personal_akut_ceyNOtrainPN [ , c("BUR_ALEAT_T", "JAHR", "sex.f", "age", "MA_FTE", "MA_BEZAHLTE_ARBEITSZEIT", "ma_funktion.f", "funk_gr", "ma_diplom.f", "nation", "nationality", "typologie.f", "MA_IN_AUSBILDUNG", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS")]

### 11.4.1 nurses -> creating subset 'pflege'
Pflege_akut <-Personal_akut[Personal_akut$ma_funktion.f %in% c("Nurses RNs + special. (inkl. midwives)","Nurses LPNs","Nurses assist."), ]
# drop the levels of ma_funktion.f that are not used! 
Pflege_akut$ma_funktion.f <- droplevels(Pflege_akut$ma_funktion.f)

### 11.4.2 physicians -> creating subset 'arzt'
Arzt_akut <-Personal_akut[Personal_akut$ma_funktion.f %in% c("Physicians chiefs and leading", "Physicians attendings and hospital", "Physicians residents and students"), ]
# drop the levels of ma_funktion.f that are not used! 
Arzt_akut$ma_funktion.f <- droplevels(Arzt_akut$ma_funktion.f)

# removing unnecessary datasets from environment
rm(allg_akut, leist_akut, lohn_akut, personal_akut_ceyPN)


# 12. Saving datasets (please do not execute!) ----
save(list = c("Allg_akut", "Arzt_akut", "Leist_akut", "Lohn_akut", "Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/03_new_data_acute_only.RData")


################################################################################
# Script 04_merging_hospital_datasets.R ----
# 13. Load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("03_new_data_acute_only.RData")

# 14. Merge all hospital datasets ----
hosp <- left_join(Allg_akut, Lohn_akut, by = c("BUR_ALEAT_T", "JAHR"))
hosp <- left_join(hosp, Leist_akut, by = c("BUR_ALEAT_T", "JAHR"))

rm(Allg_akut, Leist_akut, Lohn_akut)

# 15. Saving datasets (please do not execute!) ----
save(list = c("Arzt_akut", "hosp","Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/04_new_hospital_data_merged.RData")


###############################################################################
# Script 05_perparing_variable_wage.R ----

# 16. Load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("04_new_hospital_data_merged.RData")


# 17. Calculating wage/FTE variable ----
## 17.1 calculate sum FTE and sum BEZ. ARBEITSZEIT pflege
# aggregating MA_FTE by summing its values
fte_pflege <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, sum)
# aggregating MA_BEZAHLTE_ARBEITSZEIT by summing its values 
zz_pflege <- aggregate(MA_BEZAHLTE_ARBEITSZEIT ~ BUR_ALEAT_T + JAHR, data = Pflege_akut, sum)
# naming columns
names(fte_pflege)<-c("BUR_ALEAT_T", "JAHR", "Pflege_FTE")
names(zz_pflege)<-c("BUR_ALEAT_T", "JAHR","Pflege_Zeit")


## 17.2 calculate sum FTE and sum BEZ. ARBEITSZEIT aerzte ----
# aggregating MA_FTE by summing its 
fte_arzt <- aggregate(MA_FTE ~ BUR_ALEAT_T + JAHR, Arzt_akut, sum)
# aggregating MA_BEZAHLTE_ARBEITSZEIT by summing its values arzt
zz_arzt <- aggregate(MA_BEZAHLTE_ARBEITSZEIT ~ BUR_ALEAT_T + JAHR, data = Arzt_akut, sum)
# naming columns
names(fte_arzt)<-c("BUR_ALEAT_T","JAHR" ,"Arzt_FTE")
names(zz_arzt)<-c("BUR_ALEAT_T","JAHR", "Arzt_Zeit")


## 17.3 Merging FTE and BEZAHLTE ARBEITSSTUNDEN datasets ----
# merging FTE
FTE_sum <- merge(fte_arzt,fte_pflege, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing other fte datasets
rm(fte_arzt, fte_pflege)

# merging BEZAHLTE ARBEITSSTUNDEN
ZZ_sum <- merge(zz_arzt, zz_pflege, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing other zz datasets
rm(zz_arzt, zz_pflege)



## 17.4 Merging FTE_SUM AND ZZ_SUM into hosp dataset ----
hosp <- left_join(hosp, FTE_sum, by = c("BUR_ALEAT_T", "JAHR"))
hosp <- left_join(hosp, ZZ_sum, by = c("BUR_ALEAT_T", "JAHR"))


rm(FTE_sum, ZZ_sum)


## 17.5 Creating new columns wageFTE_nurses and wageFTE_physicians in hosp ----
# nurses
hosp$wageFTE_nurses <- NA
hosp$wageFTE_nurses <- (hosp$LOHN_PFLEGE/hosp$Pflege_FTE)
# physicians
hosp$wageFTE_physicians <- NA
hosp$wageFTE_physicians <- (hosp$LOHN_ARZT/hosp$Arzt_FTE)


## 17.6 Creating new columns wageZZ_nurses and wageZZ_physicians in hosp ----
# nurses
hosp$wageZZ_nurses <- NA
hosp$wageZZ_nurses <- (hosp$LOHN_PFLEGE/hosp$Pflege_Zeit)
# physicians
hosp$wageZZ_physicians <- NA
hosp$wageZZ_physicians <- (hosp$LOHN_ARZT/hosp$Arzt_Zeit)


# 18. Saving datasets (please do not execute) ----
save(list = c("Arzt_akut", "hosp","Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/05_new_data_new_wageFTE_var.RData")


###############################################################################
# Script 06_aggregate_variables_personal_at_hospital_level.R ----
# 19. Load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("05_new_data_new_wageFTE_var.RData")


# 20. Create aggregated personal dataset ----
## 20.1 aggregate age (mean)
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




## 20.2 aggregate FTE (sum)
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


## 20.3 aggregate sex female (proportion) 
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


## 20.4 aggregate chief_leading (proportion)
# aggregate funktion prop chef
Arzt_akut.Chef <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.chief_leading = mean(ma_funktion.f == "Physicians chiefs and leading"))

# merging Arzt_akut.Chef with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.Chef, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Arzt_akut.Chef 
rm(Arzt_akut.Chef)


## 20.5 aggregate attendings and hospital physicians (proportion)
# aggregate funktion prop spital
Arzt_akut.Spital <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.attending_hospital = mean(ma_funktion.f == "Physicians attendings and hospital"))

# merging Arzt_akut.Spital with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.Spital, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing Arzt_akut.Spital
rm(Arzt_akut.Spital)


## 20.6 aggregate residents and students (proportion)
# aggregate funktion prop AA
Arzt_akut.AA <- Arzt_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.residents_students = mean(ma_funktion.f == "Physicians residents and students"))

# merging Arzt_akut.AA with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut.AA, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing AA
rm(Arzt_akut.AA)


## 20.7 aggregate RNs + special + midwives (proportion)
# aggregate funktion prop diplS
Pflege_akut.diplS <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.RNs_etc = mean(ma_funktion.f == "Nurses RNs + special. (inkl. midwives)"))

# merging Pflege_akut.diplS with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.diplS, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing diplS
rm(Pflege_akut.diplS)


## 20.8 aggregate LPNs (- FAGE) (proportion) 
# aggregate funktion prop LPNs
Pflege_akut.fage <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.LPNs = mean(ma_funktion.f == "Nurses LPNs"))

# merging Pflege_akut.fage with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.fage, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing fage
rm(Pflege_akut.fage)


## 20.9 aggregate nurse assisstants (proportion)
# aggregate funktion prop PfAss
Pflege_akut.PfAss <- Pflege_akut %>% 
  group_by(BUR_ALEAT_T, JAHR) %>%
  summarize(pct.n_ass = mean(ma_funktion.f == "Nurses assist."))

# merging Pflege_akut.PfAss with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut.PfAss, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

# removing pfAss
rm(Pflege_akut.PfAss)


## 21.0 aggregate nationality
### 21.0.1 CH 

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

### 21.0.2 NOT CH 
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

## merging Personal_akut_propNOTCH with Personal_akut.agg
# Personal_akut.agg <- merge(Personal_akut.agg, Personal_akut_propnotCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Pflege_akut_propNOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Pflege_akut_propNOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
## merging Arzt_akut_propNOTCH with Personal_akut.agg
Personal_akut.agg <- merge(Personal_akut.agg, Arzt_akut_propNOTCH, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)

## removing Personal_akut_propCH
rm(Pflege_akut_propNOTCH, Arzt_akut_propNOTCH)


## 21.2 merging personal_FTE_sum with Personal_akut.agg 
Personal_akut.agg <- merge(Personal_akut.agg, personal_FTE_sum, by = c("BUR_ALEAT_T", "JAHR"), all.y = T, all.x =T)
# change position of personal_sumFTE
Personal_akut.agg <- Personal_akut.agg %>% relocate (FTE.sum_all, .before = FTE.sum_nurse)

rm(Arzt_akut, Personal_akut, personal_FTE_sum, Pflege_akut)


# 22. Saving datasets (please do not execute!) ----
save(list = c("hosp", "Personal_akut.agg"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/06_new_aggregated_personal_data.RData")


###############################################################################
# Script 07_merging_all_datasets_and_applying_incl_excl_criteria.R ----
# 23. Load data ----
setwd("/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/")
load("06_new_aggregated_personal_data.RData")


# 24. Removing all variables not necessary from hosp dataset ----
hosp <- hosp [, -which(names(hosp) %in% c("activity.f", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS", "LOHN_OTHERS", "LOHN_TOTAL", "Arzt_FTE", "Pflege_FTE"))]


# 25. Merging hospital and aggregated personnel dataset together ----
honest <- inner_join(hosp, Personal_akut.agg, by = c("BUR_ALEAT_T", "JAHR"))

# check non mergers
# nonmerge <- anti_join(hosp, Personal_akut.agg, by = c("BUR_ALEAT_T", "JAHR"))
# 5 special clinics that don't merge 


# rm(Arzt_akut, Personal_akut, Personal_akut.agg, Pflege_akut, hosp, nonmerge)


# 26. Applying inclusion/exclusion criteria to final dataset ----

### Keepeing only wage/FTE within range and excluding NAs
honest_DEF <- honest[!is.na(honest$wageFTE_physicians) & !is.na(honest$wageFTE_nurses) & honest$wageFTE_physicians > 30000 & honest$wageFTE_nurses > 30000 & honest$wageFTE_physicians < 400000 & honest$wageFTE_nurses < 200000, ]

# Keeping only obseervations with FTE_sum_physicians < 1%
honest_DEF$prop.FTEphys_overall <- NA
honest_DEF$prop.FTEphys_overall <- honest_DEF$FTE.sum_physician/honest_DEF$FTE.sum_all
honest_DEF <- honest_DEF[honest_DEF$prop.FTEphys_overall >= 0.01, ]


# 27. Selecting variables for final dataset ----
honest_DEF <- honest_DEF [ , c("BUR_ALEAT_T", "JAHR", "typologie.f", "equipment", "LOHN_ARZT", "LOHN_PFLEGE", "wageFTE_nurses", "wageFTE_physicians", "age.mean_nurse", "age.mean_physician", "pct.female_nurse", "pct.female_physician", "pct.male_nurse", "pct.male_physician", "pct.chief_leading", "pct.attending_hospital", "pct.residents_students", "pct.RNs_etc", "pct.LPNs", "pct.n_ass", "pct.CH_nurse", "pct.CH_physician", "pct.notCH_nurse", "pct.notCH_physician", "PFLEGETAGE_STATIONAER", "AUSTRITTE_STATIONAER", "AMBULANTE_KONSULTATIONEN" )]


rm(hosp, Personal_akut.agg)

# 28. Saving datasets (please do not execute!) ----
save(list = c("honest", "honest_DEF"),
     file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data_hosp/07_new_FINAL_datasets.RData")



