###############################################################################
# This is a preparation file. 
# If you want to run the analysis jump to script 10_xxx and run source(xxx)
# If you want to run the code step by step and you already have the datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Removing all variables not necessary from hosp dataset
# 3. Merging hospital and aggregated personnel dataset together
# 4. Check non mergers 
# 5. Applying inclusion/exclusion criteria to final dataset
# 6. Selecting variables for final dataset
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed_data/")

# 1. Load data ----
load("06_aggregated_personal_data.RData")

# 2. Removing all variables not necessary from hosp dataset ----
hosp <- hosp [, -which(names(hosp) %in% c("activity.f", "FTE_CHEFARZT", "FTE_LEITENDER_ARZT", "FTE_SPITALARZT", "FTE_OBERARZT", "FTE_ASSISTENZ", "FTE_UNTERASSISTENZ", "FTE_PFLEGEFACH_SPEZ", "FTE_PFLEGEFACH_NICHT_SPEZ", "FTE_PFLEGE_SEK", "FTE_PFLEGE_ASSISTENZ", "FTE_PFLEGE_REST", "FTE_HEBAMME", "FTE_PFLEGE", "FTE_ARZT", "FTE_OTHERS", "LOHN_OTHERS", "LOHN_TOTAL", "Arzt_FTE", "Pflege_FTE"))]

# 3. Merging hospital and aggregated personnel dataset together ----
honest <- inner_join(hosp, Personal_akut.agg, by = c("BUR_ALEAT_T", "JAHR"))

# 4. Check non mergers ----
# nonmerge <- anti_join(hosp, Personal_akut.agg, by = c("BUR_ALEAT_T", "JAHR"))
# five (5) special clinics that don't merge

# 5. Remove raws where outcome variable wage/FTE nurses and wage/FTE physicians is missing
# test <- honest_wagecomp[is.na(honest_wagecomp$wageFTE_nurses), ]
honest_wagecomp <-honest[complete.cases(honest[ , c('wageFTE_nurses', 'wageFTE_physicians')]), ] 
# honest_wagecomp has 1003 obs., 140 less than the honest dataset


# 6. Applying inclusion/exclusion criteria to final dataset ----
# Keeping only observations with FTE_sum_physicians < 1%
honest_DEF <- honest_wagecomp
honest_DEF$prop.FTEphys_overall <- NA
honest_DEF$prop.FTEphys_overall <- honest_DEF$FTE.sum_physician/honest_DEF$FTE.sum_all
honestDEF_out <- honest_DEF[honest_DEF$prop.FTEphys_overall <= 0.01, ]
# honestDEF_out contains only clinics supply 3, 4, 5 and specialty clinics

honest_DEF <- honest_DEF[honest_DEF$prop.FTEphys_overall >= 0.01, ]
# test <- honest_DEF[is.na(honest_DEF$wageFTE_nurses), ]
# honest_DEF has 973 obs., 30 obs. less than honest_wagecomp 


### Keepeing only wage/FTE within range 
honest_DEF <- honest[!is.na(honest$wageFTE_physicians) & !is.na(honest$wageFTE_nurses) & honest$wageFTE_physicians > 60000 & honest$wageFTE_nurses > 30000 & honest$wageFTE_physicians < 400000 & honest$wageFTE_nurses < 200000, ]
# honest_DEF has now finally 916 obs., 57 less than before


# 6. Selecting variables for final dataset ----
honest_DEF <- honest_DEF [ , c("BUR_ALEAT_T", "JAHR", "typologie.f", "equipment", "LOHN_ARZT", "LOHN_PFLEGE", "wageFTE_nurses", "wageFTE_physicians", "age.mean_nurse", "age.mean_physician", "pct.female_nurse", "pct.female_physician", "pct.male_nurse", "pct.male_physician", "pct.chief_leading", "pct.attending_hospital", "pct.residents_students", "pct.RNs_etc", "pct.LPNs", "pct.n_ass", "pct.CH_nurse", "pct.CH_physician", "pct.notCH_nurse", "pct.notCH_physician", "pct.origin_dipl_CH_nurse", "pct.origin_dipl_CH_physician", "pct.origin_dipl_notCH_nurse", "pct.origin_dipl_notCH_physician", "pct.origin_dipl_nodipl_nurse", "pct.origin_dipl_nodipl_physician","PFLEGETAGE_STATIONAER", "AUSTRITTE_STATIONAER", "AMBULANTE_KONSULTATIONEN" )]


rm(hosp, honest_wagecomp, honestDEF_out, Personal_akut.agg)

# 6. Saving datasets ----
save(list = c("honest", "honest_DEF"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed_data/07_FINAL_datasets.RData")

