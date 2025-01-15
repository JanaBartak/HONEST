# HONEST Project

This folder was set up by Jana Bartakova on September 2024 as a clean copy from a repository created on August 2022.

This project has received funding from the European Union's Horizon 2020 research and innovation programme under grant agreement No. 101029311.

## Authors
- **MEng. BSc. Jana Bartáková**, PhD – Health Economist (Principal Investigator)
- **Prof. Dr. Michael Simon**, PhD – Advisor
- **Sarah Holzer**, MSc Nursing Science
- **Aleksandra Vasic**, MSc Nursing Science

## Contact Information
**Jana Bartáková**  
Email: jana.bartakova@unibas.ch

**Institute of Nursing Science**  
Medical Faculty | Department of Public Health (DPH) | University of Basel  
Bernoullistrasse 28, CH-4056 Basel, Switzerland

---

## Project Overview

### HONEST Project
HONEST is a research project funded by European Uninon’s Marie Skłodowska-Curie Actions Programme. The HONEST project aims to facilitate the Swiss hospitals’ staff budget transparency and optimize investments in health systems through a better understanding of the association between nurse and physician wages and patient safety outcomes.

### Aim 1: 

Nurses’ and physicians’ wages drivers in Swiss hospitals: a retrospective observational time series cross-sectional study

### Aim 2: 

Nexus of nurses' and physicians' wages and mortality in acute care settings: a cross-sectional study using routine data

---

## Description of Substudies
### Aim 1 
In this retrospective observational time series cross-sectional study based on de-identified data regularly collected by the Federal Statistical Office (BFS) which comprises information on Swiss acute care and specialized hospitals, as well as on staff (including nurses and physicians) employed in these hospitals from 2014 to 2020. After data cleaning and preparation, we conducted descriptive analysis. Eventually, we ran different regression models to determine the factors affecting wages for nurses and physicians.

### Aim 2
In this cross-sectional study we used Swiss patient and hospital routine data from the year 2019, which we linked by matching the anonymized hospital identification number. After cleaning the data, we conducted descriptive analyses. For the inferential analysis we used the Generalized Additive Mixed Model (GAMM) to explore the association between nurse and physician wages aggregated at hospital level, and all-cause 30-day mortality. Sensitivity analyses were conducted by applying the same procedures to the data from 2018 and 2020.

---

## Project Setup

### Folder Directories

* scripts aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/
* scripts aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/

* data cleaning aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/01_data_cleaning 
* data cleaning aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/01_data_cleaning

* descriptive analysis aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/02_descriptive_analysis
* descriptive analysis aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/02_descriptive_analysis

* inferential analysis aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/03_inferential_analysis
* inferential analysis aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/03_inferential_analysis


### Folder Overview




	01_scripts_aim_1
 
 		11_data_cleaning
 		
 		12_descriptive_analysis
 		
 		13_inferential_analysis
 		
 		README
       
    02_scripts_aim_2
       
 		21_data_cleaning
 		
 		22_descriptive_analysis
 		
 		23_inferential_analysis
 		
 		Codebook_HONEST-aim2.pdf
 		
 	HONEST.Rproj
 		
 	README


---

## WORKING WITHIN THIS PROJECT


#### Get started
These instructions will help you set up the project on your local machine.

#### Prerequisites
Softwares that need to be installed:
- R Software (we used R version 4.3.2 (2023-10-31) -- "Eye Holes")

#### Installing
1. Clone the repository https://github.com/JanaBartak/HONEST.git
2. Install required packages using 'install.packages("package_name")

#### Aim 1
Specific information about the Aim 1 data is available in the README and metadata files.

1. Run the cleaning using following R scripts:
	- 00_load_raw_data.R
	- 01_handling_missing_values_and_recoding.R
	- 02_create_new_variables.R
	- 03_data_selection.R
	- 04_merging_hospital_datasets.R
	- 05_preparing_variable_wage.R
	- 06_aggregate_variables_personal_at_hospital_level.R
	- 07_merging_all_datasets_and_applying_incl_excl_criteria.R
	
2. Run descriptive analysis using following R script:
    - exploratory_descriptive_HONEST_aim1.Rmd
  
3. Run inferential analysis using following R script: 
   - inferential_models_HONEST_aim_1.Rmd

You will find details on how to run each script at the beginning of the scripts. 

#### Aim 2
1. Refer to the codebook "Codebook_HONEST-aim2.pdf" at: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2
2. Run the cleaning using following R scripts:
- Open: Data-Cleaning.Rproj
	- 00_Load_Save_Raw_New_Data.R
	- 01_Delete_Specialty-Clinics_Children_LoS-outside-range_Missings_Save.R
	- 02_Create-Elix_Mort-Save.R
	- 03_data_selection.R
	- 03_Merge-with_ICD_Hosp-data.R
	- 04_Prepare-New-Hosp-dat.R
	- 05_Subset-Hosp_Merge-Patient-Hosp.R
	
3. Run the descriptive analysis using following R scripts:
- Open: Descriptive-Analysis.Rproj
	- 01_Table-One_Patients.R
	- 02a_Table_One_Hospitals.R
	- 02b_Table-One_Empl-absolute-numbers.R
	
4. Run the inferential analysis using following RMD script:
	- inferential_models_HONEST_aim_2.RMD
	
You will find details on how to run each script at the beginning of the scripts.



