This folder was set up by Jana Bartakova on September 2024 as a clean copy from a repository created on August 2022.

AUTHORS
-------
Sarah Holzer, MSc Nursing Science

Aleksandra Vasic, Msc Nursing Science

Prof. Dr. Michael Simon, PhD (PI)

Dr. Jana Bartakova, PhD, Health Economist (PI)

CONTACT INFORMATION
-------------------
Institute of Nursing Science

Medical Faculty | Department of Public Health (DPH) | University of Basel

Bernoullistrasse 28

CH-4056 Basel

Schweiz

Email: jana.bartakova@unibas.ch

HONEST
------
HONEST is a research project funded by European Uninon’s Marie Skłodowska-Curie Actions Programme. The HONEST project aims to facilitate the Swiss hospitals’ staff budget transparency and optimize investments in health systems through a better understanding of the association between nurse and physician wages and patient safety outcomes.

#### Aim 1: 

Nurses’ and physicians’ wages drivers in Swiss hospitals: a retrospective observational time series cross-sectional study

#### Aim 2: 

Nexus of nurses' and physicians' wages and patient safety outcomes in acute care settings: a cross-sectional study using routine data

#### Aim 3: 

Cost-effectiveness and budget impact of hospitals’ investments in nurses’ and physicians’ wages


DESCRIPTION OF SUBSTUDIES
-------------------------
#### Aim 1 
In this retrospective observational time series cross-sectional study based on de-identified data regularly collected by the Federal Statistical Office (BFS) which comprises information on Swiss acute care and specialized hospitals, as well as on staff (including nurses and physicians) employed in these hospitals from 2014 to 2020. After data cleaning and preparation, we conducted descriptive analysis. Eventually, we ran different regression models to determine the factors affecting wages for nurses and physicians.

#### Aim 2

#### Aim 3


FOLDERS/DIRECTORIES
-------------------

* scripts aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/01_data_cleaning 
* scripts aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/01_data_cleaning
* scripts aim 3:

* descriptive analysis aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/02_descriptive_analysis
* descriptive analysis aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/02_descriptive_analysis
* descriptive analysis aim 3:

* inferential analysis aim 1: https://github.com/JanaBartak/HONEST/tree/main/01_scripts_aim_1/03_inferential_analysis
* inferential analysis aim 2: https://github.com/JanaBartak/HONEST/tree/main/02_scripts_aim_2/03_inferential_analysis
* inferential analysis aim 3:


 FOLDER OVERVIEW
 -------------

Main folder HONEST

	01_scripts_aim_1
 
 		01_data_cleaning
   
   		02_descriptive_analysis
     
     		03_inferential_analysis
       
  02_scripts_aim_2
       
 		01_data_cleaning
   
   		02_descriptive_analysis
     
     		03_inferential_analysis
       
  HONEST.Rproj
       
  README.md


 WORKING WITHIN THIS PROJECT
 ---------------------------

### Get started
These instructions will help you set up the project on your local machine.

#### Prerequisites
Softwares that need to be installed:
- R Software (we used R version 4.3.2 (2023-10-31) -- "Eye Holes")

#### Installing
1. Clone the repository https://github.com/JanaBartak/HONEST.git
2. Install required packages using 'install.packages("package_name")

#### Aim 1
1. Run the cleaning using following R scripts:
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
1. Run the cleaning using following R scripts:
- Open: Data-Cleaning.Rproj
	- 00_Load_Save_Raw_New_Data.R
	- 01_Delete_Specialty-Clinics_Children_LoS-outside-range_Missings_Save.R
	- 02_Create-Elix_Mort-Save.R
	- 03_data_selection.R
	- 03_Merge-with_ICD_Hosp-data.R
	- 04_Prepare-New-Hosp-dat.R
	- 05_Subset-Hosp_Merge-Patient-Hosp.R
	
2. Run the descriptive analysis using following R scripts:
- Open: Descriptive-Analysis.Rproj
	- 01_Table-One_Patients.R
	- 02a_Table_One_Hospitals.R
	- 02b_Table-One_Empl-absolute-numbers.R
	
	
You will find details on how to run each script at the beginning of the scripts.

#### Aim 3



