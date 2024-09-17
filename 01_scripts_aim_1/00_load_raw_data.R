###############################################################################
# This is the raw data loading file. 
# If you run the codes, please DO NOT execute step 3 (saving)!
# 0. Install/load Packages
# 1. Set work directory
# 2. Load datasets (allg, lohn, leist, personal)
# (3. Save raw datasets as .RData files)
###############################################################################

# 0. Install/load packages ----
# install.packages("tidyverse")
# install.packages("table1")
library(tidyverse)


# 1. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/KS_Typol_2014_2020/")


# 2. Load datasets ----
# 2.1 load typo_ks_allg_2014-2020 (allg) ----
allg <- read.csv("typo_ks_allg_2014-2020.csv", 
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


# 2.2. load typo_ks_fibu_2014-2020 (lohn) ----
lohn <- read.csv("typo_ks_fibu_2014-2020.csv", 
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

# 2.3 laod typo_ks_kostentraeger_2014-2020 (kost) (NOT NEEDED FOR AIM 1) ----
# kost <- read.csv("typo_ks_kostentraeger_2014-2020.csv", 
#                  sep = ";",
#                  comment.char = "#", 
#                  colClasses = c (
#                    "BUR_ALEAT_T"="factor",
#                    "ACT_ID" = "factor",
#                    "ACT_NOM_D"="factor"))


# 2.4 load typo_ks_leistungen_2014-2020 (leist) ----
leist <- read.csv("typo_ks_leistungen_2014-2020.csv", 
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


# 2.5 load typo_ks_personal_2014-2020 (personal) ----
personal <- read.csv ("typo_ks_personal_2014-2020.csv", 
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


# 3. saving raw datasets ----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/00_raw_data.RData")
