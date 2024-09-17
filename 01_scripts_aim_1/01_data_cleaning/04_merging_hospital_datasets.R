###############################################################################
# This is a preparation file. 
# If you run the codes, please do not execute step 3 (saving)).
# If you want to run the code step by step and you already have the datasets in the environment jump to step 2.
# 0. Set work directory
# 1. Load data
# 2. Merge all hospital datasets
# 3. Saving datasets
###############################################################################

# 0. Set work directory ----
setwd("/Volumes/research$/HONEST Team/Data/aim_1_processed-data/")

# 1. Load data ----
load("03_data_acute_only.RData")

# 2. Merge all hospital datasets ----
hosp <- left_join(Allg_akut, Lohn_akut, by = c("BUR_ALEAT_T", "JAHR"))
hosp <- left_join(hosp, Leist_akut, by = c("BUR_ALEAT_T", "JAHR"))

rm(Allg_akut, Leist_akut, Lohn_akut)

# 3. Saving datasets ----
save(list = c("Arzt_akut", "hosp","Personal_akut", "personal_FTE_sum", "Pflege_akut"),
     file = "/Volumes/research$/HONEST Team/Data/aim_1_processed-data/04_hospital_data_merged.RData")
