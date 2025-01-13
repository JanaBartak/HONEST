# HONEST AIM 1

## Authors
- **MEng. BSc. Jana Bartáková**, PhD – Health Economist (Principal Investigator, Project Leader, and Fellow) – *Main Contact Person*
- **Prof. Dr. Michael Simon**, PhD
- **Sarah Holzer**, MSc Nursing Science

## Contact Information
Institute of Nursing Science

Medical Faculty | Department of Public Health (DPH) | University of Basel

Bernoullistrasse 28, CH-4056 Basel, Switzerland

Email: jana.bartakova@unibas.ch

---

## Overview
The datasets used for this analysis contain de-identified data obtained from the Swiss Federal Statistical Office, focusing on acute care hospitals and specialized acute care clinics in Switzerland. The data covers the years 2014 to 2020.

All data used in this study were derived from the annual hospital census report, which is captured each year between April and June. This mandatory nationwide survey is developed by the Swiss Federal Statistical Office and conducted by the cantons via an online application on behalf of the Swiss Federal Government.

The data consists of four distinct datasets that were merged into the final **HONEST_aim_1** dataset following specific data manipulation and cleaning procedures. 

---

## Data Description

### 1. **Data Source:**
- **Provider:** Swiss Federal Statistical Office
- **Period Covered:** 2014–2020
- **Geographic Coverage:** Switzerland (including acute care hospitals and specialized acute care clinics)
- **Data Protection Contract:** The data was de-identified by the Swiss Federal Statistical Office before being provided to us

### 2. **Types of Data:**
- **Hospital-Level Data (3 Datasets)**:
  - Hospital characteristics data (e.g., hospital type, technical equipment of the hospital, etc.): `typo_ks_allg_2014-2020`
  - Hospital expenditures data (e.g., expenditures for nurses' wages, expenditures for physicians' wages, etc.): `typo_ks_fibu_2014-2020`
  - Hospital services data (e.g., nr. outpatient consultations, nr. care days, etc.): `typo_ks_leistungen_2014-2020`
  
- **Workforce/Staff Characteristics (1 Dataset)**:
  - Data related to hospital staff, including roles, demographics, full-time equivalents, whether contracts end within the year, and other workforce-related attributes: `typo_ks_personal_2014-2020`

### 3. **Data Transformation and Merging:**
We cleaned and transformed the data to merge the four original datasets into a single consolidated dataset, `HONEST_aim_1`. This final dataset integrated hospital-level data with workforce characteristics aggregated at the hospital level, providing a comprehensive foundation for our analysis. Merging the datasets was crucial for conducting inferential analyses to identify factors associated with the wages of nurses and physicians, which was the primary aim of our study. We merged the datasets using hospital ID and year as identifiers.

To create our outcome variable *wage*, the wage expenses for nurses and physicians were provided only as aggregated totals for the entire category, without differentiation between specific roles or groups. To estimate the mean wages for nurses and physicians, we divided the total wage expenses by the full-time equivalents (FTEs) for each profession, respectively.

To prepare for regression analysis, we aggregated other personnel characteristics to the hospital level. For example, we calculated the proportion of registered nurses within the overall nursing population, while summarizing age-related data by computing the mean age of personnel. Similar aggregations were performed for other relevant characteristics. Throughout this transformation process, we adapted variable names and types as necessary, and created new variables to facilitate our analysis.

### 4. **Missing Data Handling:**
During the merging process, missing values in the merged variables were marked as 'NA' and were not included in the regression analysis.

### 5. **Ethical and Legal Considerations:**
The data we received was de-identified and shared based on a contract between us and the Swiss Federal Statistical Office, in accordance with Article 22 of the Swiss Federal Act on Data Protection. No personally identifiable information was included in the datasets. Since the data was de-identified, it was exempt from ethical approval.

---

## Variables and Data Structure

Detailed descriptions of the variables in the final **HONEST_aim_1 dataset**, along with information on data transformations, can be found in the accompanying metadata.

---

## Data Usage and Citation

### 1. **Usage Restrictions:**
Due to contractual obligations with the Swiss Federal Statistical Office and legal restrictions under the Swiss Federal Act on Data Protection, we are only able to provide metadata for the datasets we used. The data is subject to strict confidentiality and cannot be shared with third parties. If you wish to request the raw data, you can directly contact the Swiss Federal Statistical Office via their contact page: https://www.bfs.admin.ch/bfs/de/home/dienstleistungen/kontakt.html

### 2. **Citation:**
When using this data, please cite the following:




