###############################################################################
# This is a preparation file.
# If you run the codes, please do not execute step 3 (saving)).
# If you want to run the code step by step and you already have the cleaned raw datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Create new variables
# 2.1 create NEW variables in allg dataset
# 2.2 create NEW variables in lohn dataset
# 2.3 create NEW variables in personal dataset
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed-data/")

# 1. Load data ----
load("01_clean_raw_data.RData")

# 2. Create new variables ----
## 2.1 create NEW variables in allg dataset ----
### NEW typologie.f ----
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

### NEW activity.f ----
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

### NEW RECHTSFORM.f ----
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

### NEW FTE_ARZT ----
# creating new var called FTE_ARZT which is the mean value of all other physicians subgroups
allg <- allg %>% rowwise() %>%
  mutate(FTE_ARZT = mean(c(FTE_CHEFARZT, FTE_LEITENDER_ARZT, FTE_SPITALARZT, FTE_OBERARZT, FTE_ASSISTENZ, FTE_UNTERASSISTENZ)))

# change position of NEW var 
allg <- allg %>% relocate (FTE_ARZT, .before = FTE_PFLEGEFACH_SPEZ)

### NEW FTE_PFLEGE ----
# (Hebamme included) creating new var called FTE_PFLEGE which is the mean value of all other nursing professions
allg <- allg %>% rowwise() %>%
  mutate(FTE_PFLEGE = mean(c(FTE_PFLEGEFACH_SPEZ, FTE_PFLEGEFACH_NICHT_SPEZ, FTE_PFLEGE_SEK, FTE_PFLEGE_ASSISTENZ, FTE_PFLEGE_REST, FTE_HEBAMME)))

# change position of NEW var 
allg <- allg %>% relocate (FTE_PFLEGE, .before = FTE_TECHN_OP_FACHPERSON)

### NEW FTE_OTHERS ----
# creating new var called FTE_OTHER which is the mean value of all other professions
allg <- allg %>% rowwise() %>%
  mutate(FTE_OTHERS = mean(c(FTE_TECHN_OP_FACHPERSON, FTE_RADIOLOGIE, FTE_BIOMED_ANALYTIK, FTE_MED_TECH_PERS_SEK, FTE_RETTUNGSSANITAET, FTE_TRANSPORTSANITAET, FTE_AKAD_PERS, FTE_PHYSIO, FTE_ERGO, FTE_ERNAEHRUNG, FTE_LOGO, FTE_AKTIVIERUNG, FTE_PSYCHOLOGIN, FTE_MASSEURIN, FTE_MED_THERAP_PERS_SEK, FTE_ANDERER_THERAPEUT, FTE_SOZIALDIENST, FTE_HAUSDIENST, FTE_TECHN_DIENSTE, FTE_ADMIN )))

# change position of NEW var 
allg <- allg %>% relocate (FTE_OTHERS, .before = LANGZEIT_PFLEGETAGE)

### NEW Diagnostic equipment (DiagEq) ----
allg$DiagEq <- NA
allg$DiagEq <- allg$MRI + allg$CT_SCANNER + allg$PET_SCANNER + allg$GAMMA_CAMERA + allg$ANGIOGRAPHIE

# change position of NEW var 
allg <- allg %>% relocate (DiagEq, .before = MRI)

### NEW Diagnostic equipment (DiagEq) EXAMEN TOTAL ----
allg$DiagEq_EXAMEN_TOTAL <- NA
allg$DiagEq_EXAMEN_TOTAL <- allg$MRI_EXAMEN_TOTAL + allg$CT_SCANNER_EXAMEN_TOTAL + allg$PET_SCANNER_EXAMEN_TOTAL + allg$GAMMA_CAMERA_EXAMEN_TOTAL + allg$ANGIOGRAPHIE_EXAMEN_TOTAL

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_TOTAL, .before = MRI_EXAMEN_TOTAL)

### NEW Diagnostic equipment (DiagEq) EXAMEN AMB ----
allg$DiagEq_EXAMEN_AMB <- NA
allg$DiagEq_EXAMEN_AMB <- allg$MRI_EXAMEN_AMB + allg$CT_SCANNER_EXAMEN_AMB + allg$PET_SCANNER_EXAMEN_AMB + allg$GAMMA_CAMERA_EXAMEN_AMB + allg$ANGIOGRAPHIE_EXAMEN_AMB

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_AMB, .before = MRI_EXAMEN_AMB)

### NEW Diagnostic equipment (DiagEq) EXAMEN STAT ----
allg$DiagEq_EXAMEN_STAT <- NA
allg$DiagEq_EXAMEN_STAT <- allg$MRI_EXAMEN_STAT + allg$CT_SCANNER_EXAMEN_STAT + allg$PET_SCANNER_EXAMEN_STAT + allg$GAMMA_CAMERA_EXAMEN_STAT + allg$ANGIOGRAPHIE_EXAMEN_STAT

# change position of NEW var 
allg <- allg %>% relocate (DiagEq_EXAMEN_STAT, .before = MRI_EXAMEN_STAT)


### NEW Therapeutic equipment (TherEq) ----
allg$TherEq <- NA
allg$TherEq <- allg$LINEARBESCHLEUNIGER + allg$LITHOTRIPTOR + allg$DIALYSE

# change position of NEW var 
allg <- allg %>% relocate (TherEq, .before = MRI)

### NEW Therapeutic equipment (TherEq) EXAMEN TOTAL ----
allg$TherEq_EXAMEN_TOTAL <- NA
allg$TherEq_EXAMEN_TOTAL <- allg$LINEARBESCHLEUNIGER_EXAMEN_TOT + allg$LITHOTRIPTOR_EXAMEN_TOTAL + allg$DIALYSE_EXAMEN_TOTAL

# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_TOTAL, .before = MRI_EXAMEN_TOTAL)

### NEW Therapeutic equipment (TherEq) EXAMEN AMB ----
allg$TherEq_EXAMEN_AMB <- NA
allg$TherEq_EXAMEN_AMB <- allg$LINEARBESCHLEUNIGER_EXAMEN_AMB + allg$LITHOTRIPTOR_EXAMEN_AMB + allg$DIALYSE_EXAMEN_AMB

# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_AMB, .before = MRI_EXAMEN_AMB)

### NEW Therapeutic equipment (TherEq) EXAMEN STAT ----
allg$TherEq_EXAMEN_STAT <- NA
allg$TherEq_EXAMEN_STAT <- allg$LINEARBESCHLEUNIGER_EXAMEN_STA + allg$LITHOTRIPTOR_EXAMEN_STAT + allg$DIALYSE_EXAMEN_STAT
# change position of NEW var 
allg <- allg %>% relocate (TherEq_EXAMEN_STAT, .before = MRI_EXAMEN_STAT)


### NEW equipment - Therapeutic and Diagnostic Equipment total (count) ----
allg$equipment <- NA
allg$equipment <- allg$TherEq + allg$DiagEq

# change position of NEW var 
allg <- allg %>% relocate (equipment, .before = DiagEq)


###############################################################################
###############################################################################



## 2.2 create NEW variable in lohn dataset ----
### NEW LOHN_OTHERS ----
# creating new var called LOHN_OTHERS which is the mean value of all other professions
lohn <- lohn %>% rowwise() %>%
  mutate(LOHN_OTHERS = mean(c(LOHN_MEDTECH_PERS, LOHN_MEDTHERA_PERS, LOHN_SOZIALDIENST, LOHN_HAUSDIENST, LOHN_TECHDIENST, LOHN_ADMIN)))

# change position of NEW LOHN_OTHERS 
lohn <- lohn %>% relocate (LOHN_OTHERS, .after = LOHN_ADMIN)


###############################################################################
###############################################################################


## 2.3 create NEW variables in personal dataset ----
### NEW age ----
# creating new var age
personal$age <- NA
personal$age <- personal$JAHR - personal$MA_GEBURTSJAHR

# keeping only meaningful age
personal$age [personal$age < 18] <- NA
personal$age [personal$age > 65] <- NA

personal <- personal %>% drop_na(age)

### NEW sex.f ----
# changing 1 and 2 in male and female
personal$sex.f <- NA
personal$sex.f  [personal$MA_SEX %in% "0"] <- "Male"
personal$sex.f [personal$MA_SEX %in% "1"] <- "Female"
personal$sex.f <- as.factor(personal$sex.f)

### NEW ma_funktion.f ----
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


### NEW funk_gr ----
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

### NEW funk_gr.cc ----
# personal$funk_gr.cc <- personal$funk_gr [complete.cases(personal$funk_gr)]

### NEW funk_ph_nu ----
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


### NEW ma_ende_jahr.f ----
# changing 1 and 2 in yes, no
personal$ma_ende_jahr.f <- NA
personal$ma_ende_jahr.f  [personal$MA_ENDE_JAHR %in% "1"] <- "Yes"
personal$ma_ende_jahr.f [personal$MA_ENDE_JAHR %in% "2"] <- "No"
personal$ma_ende_jahr.f <- as.factor(personal$ma_ende_jahr.f)

### NEW ma_hauptleist.f ----
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

### NEW ma_diplom.f ----
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


### NEW origin_diploma ----
personal$origin_diploma [personal$ma_diplom.f %in% "CH"] <- "CH"
personal$origin_diploma [personal$ma_diplom.f %in% "DE"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "FR"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "IT"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "EU"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "USA/CAN"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "other"] <- "no CH"
personal$origin_diploma [personal$ma_diplom.f %in% "no diploma"] <- "no diploma"
personal$origin_diploma <- factor(personal$origin_diploma, levels = c ("CH", "no CH", "no diploma"))

### NEW ma_in_ausbildung.f ----
# changing 1 and 0 in yes, no 
personal$ma_in_ausbildung.f <- NA
personal$ma_in_ausbildung.f [personal$MA_IN_AUSBILDUNG %in% "1"] <- "yes"
personal$ma_in_ausbildung.f [personal$MA_IN_AUSBILDUNG %in% "0"] <- "no"
personal$ma_in_ausbildung.f <- as.factor(personal$ma_in_ausbildung.f)


### NEW nation ----
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

### NEW nationality ----
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



# 3. Saving datasets ----
save(list = c("allg", "leist", "lohn", "personal"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/02_new_variables.RData")






