###############################################################################
# This is the raw data loading file:
# NOTE: If you run all codes, DO NOT execute step 3 (saving)
# 0. Install/load Packages
# 1. Set Work Directory
# 2. Load data
# (3. Save datasets as .txt-files with data.table (please do not execute!))
###############################################################################
# 0. Install/load Packages ----
library(dplyr)
library(readr)


# 1. Set Work Directory ----
setwd("/Volumes/research$/HONEST Team/BFS_New_Data_2024/")


# 2. Import & Load Raw Medical Datasets 2020, 2019 & 2018 ----
## Dataset 2020 ----
New.Med.2020 <- read.table("DATA_BFS_MS_DRG_TYPO_2020/DATA_BFS_MS_DRG_TYPO_2020.DAT", 
                           header = TRUE, sep = "|", comment.char="#")

if (any(duplicated(New.Med.2020$X_ID))) {
  print("There are duplicates in the variable.")
} else {
  print("There are no duplicates in the variable.")
}

### no duplicates

## Dataset 2019 ----
New.Med.2019 <- read.table("DATA_BFS_MS_DRG_TYPO_2019/DATA_BFS_MS_DRG_TYPO_2019.DAT", 
                           header = TRUE, sep = "|", comment.char="#")

if (any(duplicated(New.Med.2019$X_ID))) {
  print("There are duplicates in the variable.")
} else {
  print("There are no duplicates in the variable.")
}

### no duplicates

## Dataset 2018 ----
New.Med.2018 <- read.table("DATA_BFS_MS_DRG_TYPO_2018/DATA_BFS_MS_DRG_TYPO_2018.DAT", 
                           header = TRUE, sep = "|", comment.char="#")

if (any(duplicated(New.Med.2018$X_ID))) {
  print("There are duplicates in the variable.")
} else {
  print("There are no duplicates in the variable.")
}

### there are duplicates --> delete them:
duplicates <- New.Med.2018$X_ID[duplicated(New.Med.2018$X_ID)]

a <- subset(New.Med.2018, X_ID %in% c(2772700, 8181410, 27812974))

New.Med.2018 <- New.Med.2018[!duplicated(New.Med.2018$X_ID), ]


# 3. Save datasets as .txt-files with data.table (please do not execute!) ----
## save original/whole dataset 2020 ----
data.table::fwrite(x = New.Med.2020, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.2020.txt", 
                   sep = ";")

## save original/whole dataset 2019 ----
data.table::fwrite(x = New.Med.2019, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.2019.txt", 
                   sep = ";")

## save original/whole dataset 2018 ----
data.table::fwrite(x = New.Med.2018, 
                   file = "/Volumes/research$/HONEST Team/Data/aim2_processed-data/aim2_additional-data/New.Med.2018.txt", 
                   sep = ";")



