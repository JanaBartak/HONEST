###############################################################################
# This is the first of a series of seven preparation files. 
# If you run the codes, please do not execute step 3 (saving)).
# If you want to run the code step by step and you already have the raw datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load raw data
# 2. Recoding missing values, etc.
# 2.1. allg dataset
# 2.1.1 recoding NAs
# 2.1.2 recoding 2 to 0
# 2.2. lohn dataset
# 2.2.1 recoding NAs
# 2.3. leist dataset
# 2.3.1 recoding NAs
# 2.4. personal dataset
# 2.4.1 recoding NAs
# 2.4.2 recoding
# 3. Saving datasets
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed-data/")

# 1. Load raw datasets ----
load("00_raw_data.RData")

# 2. Recoding missing values, etc. ----
## 2.1 allg dataset ----
### 2.1.1 recoding NAs ----
#### LETZTE_ERHEBUNG ----
# transforming 9999 in NAs
allg$LETZTE_ERHEBUNG [allg$LETZTE_ERHEBUNG == "9999" ] <- NA

#### EROEFFNUNG  ----
# transforming empty spaces in NAs
allg$EROEFFNUNG [allg$EROEFFNUNG == "" | allg$EROEFFNUNG == " "] <- NA

#### SCHLIESSUNG ----
# transforming empty spaces in NAs
allg$SCHLIESSUNG [allg$SCHLIESSUNG == "" | allg$SCHLIESSUNG == " "] <- NA

#### FTE_CHEFARZT ----
# transforming 0 in NA
allg$FTE_CHEFARZT [allg$FTE_CHEFARZT == 0] <- NA

#### FTE_LEITENDER_ARZT ----
# transforming 0 in NA
allg$FTE_LEITENDER_ARZT [allg$FTE_LEITENDER_ARZT == 0] <- NA

#### FTE_SPITALARZT ----
# transforming 0 in NA
allg$FTE_SPITALARZT [allg$FTE_SPITALARZT == 0] <- NA

#### FTE_OBERARZT ----
# transforming 0 in NA
allg$FTE_OBERARZT [allg$FTE_OBERARZT == 0] <- NA

#### FTE_ASSISTENZ ----
# transforming 0 in NA
allg$FTE_ASSISTENZ [allg$FTE_ASSISTENZ == 0] <- NA

#### FTE_UNTERASSISTENZ ----
# transforming 0 in NA
allg$FTE_UNTERASSISTENZ [allg$FTE_UNTERASSISTENZ == 0] <- NA

#### FTE_PFLEGEFACH_SPEZ ----
# transforming 0 in NA
allg$FTE_PFLEGEFACH_SPEZ [allg$FTE_PFLEGEFACH_SPEZ == 0] <- NA

#### FTE_PFLEGEFACH_NICHT_SPEZ ----
# transforming 0 in NA
allg$FTE_PFLEGEFACH_NICHT_SPEZ [allg$FTE_PFLEGEFACH_NICHT_SPEZ == 0] <- NA

#### FTE_PFLEGE_SEK ----
# transforming 0 in NA
allg$FTE_PFLEGE_SEK [allg$FTE_PFLEGE_SEK == 0] <- NA

#### FTE_PFLEGE_ASSISTENZ ----
# transforming 0 in NA
allg$FTE_PFLEGE_ASSISTENZ [allg$FTE_PFLEGE_ASSISTENZ == 0] <- NA

#### FTE_PFLEGE_REST ----
# transforming 0 in NA
allg$FTE_PFLEGE_REST [allg$FTE_PFLEGE_REST == 0] <- NA

#### FTE_HEBAMME ----
# transforming 0 in NA
allg$FTE_HEBAMME [allg$FTE_HEBAMME == 0] <- NA

#### FTE_TECHN_OP_FACHPERSON ----
# transforming 0 in NA
allg$FTE_TECHN_OP_FACHPERSON [allg$FTE_TECHN_OP_FACHPERSON == 0] <- NA

#### FTE_RADIOLOGIE ----
# transforming 0 in NA
allg$FTE_RADIOLOGIE [allg$FTE_RADIOLOGIE == 0] <- NA

#### FTE_BIOMED_ANALYTIK ----
# transforming 0 in NA
allg$FTE_BIOMED_ANALYTIK [allg$FTE_BIOMED_ANALYTIK == 0] <- NA

#### FTE_MED_TECH_PERS_SEK ----
# transforming 0 in NA
allg$FTE_MED_TECH_PERS_SEK [allg$FTE_MED_TECH_PERS_SEK == 0] <- NA

#### FTE_RETTUNGSSANITAET ----
# transforming 0 in NA
allg$FTE_RETTUNGSSANITAET [allg$FTE_RETTUNGSSANITAET == 0] <- NA

#### FTE_TRANSPORTSANITAET ----
# transforming 0 in NA
allg$FTE_TRANSPORTSANITAET [allg$FTE_TRANSPORTSANITAET == 0] <- NA

#### FTE_AKAD_PERS ----
# transforming 0 in NA
allg$FTE_AKAD_PERS [allg$FTE_AKAD_PERS == 0] <- NA

#### FTE_PHYSIO ----
# transforming 0 in NA
allg$FTE_PHYSIO [allg$FTE_PHYSIO == 0] <- NA

#### FTE_ERGO ----
# transforming 0 in NA
allg$FTE_ERGO [allg$FTE_ERGO == 0] <- NA

#### FTE_ERNAEHRUNG ----
# transforming 0 in NA
allg$FTE_ERNAEHRUNG [allg$FTE_ERNAEHRUNG == 0] <- NA

#### FTE_LOGO ----
# transforming 0 in NA
allg$FTE_LOGO [allg$FTE_LOGO == 0] <- NA

#### FTE_AKTIVIERUNG ----
# transforming 0 in NA
allg$FTE_AKTIVIERUNG [allg$FTE_AKTIVIERUNG == 0] <- NA

#### FTE_PSYCHOLOGIN ----
# transforming 0 in NA
allg$FTE_PSYCHOLOGIN [allg$FTE_PSYCHOLOGIN == 0] <- NA

#### FTE_MASSEURIN ----
# transforming 0 in NA
allg$FTE_MASSEURIN [allg$FTE_MASSEURIN == 0] <- NA

#### FTE_MED_THERAP_PERS_SEK ----
# transforming 0 in NA
allg$FTE_MED_THERAP_PERS_SEK [allg$FTE_MED_THERAP_PERS_SEK == 0] <- NA

#### FTE_ANDERER_THERAPEUT ----
# transforming 0 in NA
allg$FTE_ANDERER_THERAPEUT [allg$FTE_ANDERER_THERAPEUT == 0] <- NA

#### FTE_SOZIALDIENST ----
# transforming 0 in NA
allg$FTE_SOZIALDIENST [allg$FTE_SOZIALDIENST == 0] <- NA

#### FTE_HAUSDIENST ----
# transforming 0 in NA
allg$FTE_HAUSDIENST [allg$FTE_HAUSDIENST == 0] <- NA

#### FTE_TECHN_DIENSTE ----
# transforming 0 in NA
allg$FTE_TECHN_DIENSTE [allg$FTE_TECHN_DIENSTE == 0] <- NA

#### FTE_ADMIN ----
# transforming 0 in NA
allg$FTE_ADMIN [allg$FTE_ADMIN == 0] <- NA

### 2.1.2 recoding 2 to 0 ----
#### ANGEBOT_AMB ----
# transforming 2 = no into 0
allg$ANGEBOT_AMB [allg$ANGEBOT_AMB %in% "2"] <- 0

#### SPITALLISTE_HOME ----
# transforming 2 = no into 0
allg$SPITALLISTE_HOME [allg$SPITALLISTE_HOME %in% "2"] <- 0

#### SPITALLISTE_OTHERS ----
# transforming 2 = no into 0
allg$SPITALLISTE_OTHERS [allg$SPITALLISTE_OTHERS %in% "2"] <- 0

#### VERTRAGSSPITAL ----
# transforming 2 = no into 0
allg$VERTRAGSSPITAL [allg$VERTRAGSSPITAL %in% "2"] <- 0

#### OE_BEITRAG_PAUSCHALE ----
# transforming 2 = no into 0
allg$OE_BEITRAG_PAUSCHALE [allg$OE_BEITRAG_PAUSCHALE %in% "2"] <- 0

#### OE_BEITRAG_GL ----
# transforming 2 = no into 0
allg$OE_BEITRAG_GL [allg$OE_BEITRAG_GL %in% "2"] <- 0

#### OE_BEITRAG_DEFIZITDECKUNG ----
# transforming 2 = no into 0
allg$OE_BEITRAG_DEFIZITDECKUNG [allg$OE_BEITRAG_DEFIZITDECKUNG %in% "2"] <- 0

#### ANGEBOT_AMB ----
# transforming 2 = no into 0
allg$ANGEBOT_AMB [allg$ANGEBOT_AMB %in% "2"] <- 0

#### SPITALLISTE_HOME ----
# transforming 2 = no into 0
allg$SPITALLISTE_HOME [allg$SPITALLISTE_HOME %in% "2"] <- 0

#### SPITALLISTE_OTHERS ----
# transforming 2 = no into 0
allg$SPITALLISTE_OTHERS [allg$SPITALLISTE_OTHERS %in% "2"] <- 0

#### VERTRAGSSPITAL ----
# transforming 2 = no into 0
allg$VERTRAGSSPITAL [allg$VERTRAGSSPITAL %in% "2"] <- 0

#### OE_BEITRAG_PAUSCHALE ----
# transforming 2 = no into 0
allg$OE_BEITRAG_PAUSCHALE [allg$OE_BEITRAG_PAUSCHALE %in% "2"] <- 0

#### OE_BEITRAG_GL ----
# transforming 2 = no into 0
allg$OE_BEITRAG_GL [allg$OE_BEITRAG_GL %in% "2"] <- 0

#### OE_BEITRAG_DEFIZITDECKUNG ----
# transforming 2 = no into 0
allg$OE_BEITRAG_DEFIZITDECKUNG [allg$OE_BEITRAG_DEFIZITDECKUNG %in% "2"] <- 0

#### GLOBALBUDGET_HOME ----
# transforming 2 = no into 0
allg$GLOBALBUDGET_HOME [allg$GLOBALBUDGET_HOME %in% "2"] <- 0

#### GLOBALBUDGET_OTHERS ----
# transforming 2 = no into 0
allg$GLOBALBUDGET_OTHERS [allg$GLOBALBUDGET_OTHERS %in% "2"] <- 0

#### OE_BEITRAG_ANDERS ----
# transforming 2 = no into 0
allg$OE_BEITRAG_ANDERS [allg$OE_BEITRAG_ANDERS %in% "2"] <- 0

###############################################################################
###############################################################################

## 2.2 lohn dataset ----
### 2.2.1 recoding NAs ----
#### LOHN_ARZT ----
# transforming 0 in NA
lohn$LOHN_ARZT[lohn$LOHN_ARZT==0]<- NA

#### LOHN_PFLEGE ----
# transforming 0 in NA
lohn$LOHN_PFLEGE[lohn$LOHN_PFLEGE==0]<- NA

#### LOHN_MEDTECH_PERS ----
# transforming 0 in NA
lohn$LOHN_MEDTECH_PERS[lohn$LOHN_MEDTECH_PERS==0]<- NA 
# transforming 1 in NA
lohn$LOHN_MEDTECH_PERS[lohn$LOHN_MEDTECH_PERS==1]<- NA 

#### LOHN_MEDTHERA_PERS ----
# transforming 0 in NA
lohn$LOHN_MEDTHERA_PERS[lohn$LOHN_MEDTHERA_PERS==0]<- NA 
# transforming 1 in NA
lohn$LOHN_MEDTHERA_PERS[lohn$LOHN_MEDTHERA_PERS==1]<- NA 

#### LOHN_SOZIALDIENST ----
# transforming 0 in NA
lohn$LOHN_SOZIALDIENST[lohn$LOHN_SOZIALDIENST==0]<- NA 

#### LOHN_HAUSDIENST ----
# transforming 0 in NA
lohn$LOHN_HAUSDIENST[lohn$LOHN_HAUSDIENST==0]<- NA 

#### LOHN_TECHDIENST ----
# transforming 0 in NA
lohn$LOHN_TECHDIENST[lohn$LOHN_TECHDIENST==0]<- NA 

#### LOHN_ADMIN ----
# transforming 0 in NA
lohn$LOHN_ADMIN[lohn$LOHN_ADMIN==0]<- NA 

#### LOHN_TOTAL ----
# transforming 0 in NA
lohn$LOHN_TOTAL[lohn$LOHN_TOTAL==0]<- NA 

#### HONORAR_ARZT ----
# transforming 0 in NA
lohn$HONORAR_ARZT[lohn$HONORAR_ARZT==0]<- NA 

#### SOZIALVERSICHERUNG ----
# transforming 0 in NA
lohn$SOZIALVERSICHERUNG[lohn$SOZIALVERSICHERUNG==0]<- NA 

#### REST_PERSONAL_AU ----
# transforming 0 in NA
lohn$REST_PERSONAL_AU[lohn$REST_PERSONAL_AU==0]<- NA 

#### PERSONAL_AU_TOTAL ----
# transforming 0 in NA
lohn$PERSONAL_AU_TOTAL[lohn$PERSONAL_AU_TOTAL==0]<- NA

#### HONORAR_MED_LEISTUNG_ARZT ----
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_ARZT[lohn$HONORAR_MED_LEISTUNG_ARZT==0]<- NA 

#### HONORAR_MED_LEISTUNG_HEBAMME ----
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_HEBAMME[lohn$HONORAR_MED_LEISTUNG_HEBAMME==0]<- NA 

#### HONORAR_MED_LEISTUNG_UEBRIGE ----
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_UEBRIGE[lohn$HONORAR_MED_LEISTUNG_UEBRIGE==0]<- NA 

#### HONORAR_MED_LEISTUNG_TOTAL ----
# transforming 0 in NA
lohn$HONORAR_MED_LEISTUNG_TOTAL[lohn$HONORAR_MED_LEISTUNG_TOTAL==0]<- NA 


###############################################################################
###############################################################################


## 2.3 leist dataset ----
### 2.3.1 recoding NAs ----
#### ACT_ID ----
# changing the observation that has no category to NAs
leist$ACT_ID [leist$ACT_ID == "" ] <- NA
# dropping level with name "" 
leist$ACT_ID <- droplevels(leist$ACT_ID)

#### ACT_NOM_D ----
# changing observation without category in NA
leist$ACT_NOM_D [leist$ACT_NOM_D == ""] <- NA
# dropping level with name "" 
leist$ACT_NOM_D <- droplevels(leist$ACT_NOM_D)

#### PFLEGETAGE_STATIONAER ----
# transforming 0 in NA, hospitals with 0 inpatient days are not hospitals
leist$PFLEGETAGE_STATIONAER[leist$PFLEGETAGE_STATIONAER == 0 ]<- NA

#### AUSTRITTE_STATIONAER ----
# transforming 0 in NA, impossibile to have 0 discharges as a hospital
leist$AUSTRITTE_STATIONAER[leist$AUSTRITTE_STATIONAER == 0 ]<- NA

#### PFLEGETAGE_NEUGEBORENE ----
# transforming 0 in NA
leist$PFLEGETAGE_NEUGEBORENE[leist$PFLEGETAGE_NEUGEBORENE == 0 ]<- NA
summary(leist$PFLEGETAGE_NEUGEBORENE)

#### AUSTRITTE_NEUGEBORENE ----
# transforming 0 in NA
leist$AUSTRITTE_NEUGEBORENE[leist$AUSTRITTE_NEUGEBORENE == 0 ]<- NA

#### AMBULANTE_KONSULTATIONEN ----
# transforming 0 in NA
leist$AMBULANTE_KONSULTATIONEN[leist$AMBULANTE_KONSULTATIONEN == 0 ]<- NA

#### BETRIEBSBETTENTAGE ----
# transforming 0 in NA, hospitals with no operating bed days can't be hospitals
leist$BETRIEBSBETTENTAGE[leist$BETRIEBSBETTENTAGE == 0 ]<- NA

#### PLANBETTEN ----
# transforming 0 in NA
# leist$PLANBETTEN[leist$PLANBETTEN == 0 ]<- NA


###############################################################################
###############################################################################

## 2.4 personal dataset ----
### 2.4.1 recoding NAs ----
#### MA_GEBURTSJAHR ----
# transforming 0 in NA
personal$MA_GEBURTSJAHR[personal$MA_GEBURTSJAHR == 0 ]<- NA
# personal14$MA_GEBURTSJAHR[personal14$MA_GEBURTSJAHR < 1953 ]<- NA

#### FUNKTIONSGRUPPE ----
# transforming " " in NA
personal$FUNKTIONSGRUPPE[personal$FUNKTIONSGRUPPE == "" ]<- NA

#### MA_BEZAHLTE_ARBEITSZEIT ----
# transforming 0 in NA
personal$MA_BEZAHLTE_ARBEITSZEIT[personal$MA_BEZAHLTE_ARBEITSZEIT == 0 ]<- NA

#### GELEISTETE_ARBEITSZEIT_EXT ----
# transforming 0 in NA
personal$GELEISTETE_ARBEITSZEIT_EXT[personal$GELEISTETE_ARBEITSZEIT_EXT == 0 ]<- NA

#### MA_FTE ----
# transforming 0 and >1 in NA
personal$MA_FTE[personal$MA_FTE == 0 ]<- NA
personal$MA_FTE[personal$MA_FTE > 1 ]<- NA

#### MA_ENDE_JAHR ----
# transforming 9 in NA
personal$MA_ENDE_JAHR[personal$MA_ENDE_JAHR == 9 ]<- NA

#### MA_HAUPTLEISTUNGSSTELLE ----
# changing in NA values that don't have a variable 
personal$MA_HAUPTLEISTUNGSSTELLE[personal$MA_HAUPTLEISTUNGSSTELLE == "" ]<- NA

### 2.4.2 recoding ----
#### MA_SEX ----
# transforming 2 = female into 1
# 0 is male
# 1 is female
personal$MA_SEX [personal$MA_SEX %in% "1"] <- 0
personal$MA_SEX [personal$MA_SEX %in% "2"] <- 1

#### FUNKTIONSGRUPPE ----
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




# 3. saving datasets ----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/01_clean_raw_data.RData")



