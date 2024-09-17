---
title: "README"
author: " "
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


#### Authors
Sarah Holzer, MSc Nursing Science

Aleksandra Vasic, Msc Nursing Science

Prof. Dr. Michael Simon, PhD

Dr. Jana Bartakova, PhD, Health Economist (PI)

#### HONEST
HONEST is a research project funded by European Uninon’s Marie Skłodowska-Curie Actions Programme. The HONEST project aims to facilitate the Swiss hospitals’ staff budget transparency and optimize investments in health systems through a better understanding of the association between nurse and physician wages and patient safety outcomes.

#### Aim 1: 

Nurses’ and physicians’ wages drivers in Swiss hospitals: a retrospective observational time series cross-sectional study

#### Aim 2: 

Nexus of nurses' and physicians' wages and patient safety outcomes in acute care settings: a cross-sectional study using routine data

#### Aim 3: 

Cost-effectiveness and budget impact of hospitals’ investments in nurses’ and physicians’ wages


### Description of substudies

#### Aim 1 
In this retrospective observational time series cross-sectional study based on de-identified data regularly collected by the Federal Statistical Office (BFS) which comprises information on Swiss acute care and specialized hospitals, as well as on staff (including nurses and physicians) employed in these hospitals from 2014 to 2020. After data cleaning and preparation, we conducted descriptive analysis. Eventually, we ran different regression models to determine the factors affecting wages for nurses and physicians.

#### Aim 2

#### Aim 3


### Get started
These instructions will help you set up the project on your local machine.

#### Prerequisites
Softwares that need to be installed:
- R Software (we used R version 4.3.2 (2023-10-31) -- "Eye Holes")

#### Installing
1. Clone the repository https://github.com/...
2. Install required packages using 'install.packages("package_name")

#### Aim 1
1. Run the project using following R scripts:
	- 00_load_raw_data.R
	- 01_handling_missing_values_and_recoding.R
	- 02_create_new_variables.R
	- 03_data_selection.R
	- 04_merging_hospital_datasets.R
	- 05_preparing_variable_wage.R
	- 06_aggregate_variables_personal_at_hospital_level.R
	- 07_merging_all_datasets_and_applying_incl_excl_criteria.R
You will find details on how to run each script at the beginning of the scripts. 

#### Aim 2

#### Aim 3



