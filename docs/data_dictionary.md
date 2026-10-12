# Data Dictionary and Analytical Methodology

## 1. Dataset Overview

**Dataset:** Data Science Salaries (`ds_salaries`)

**Period:** 2020–2022

**Records:** 607

**Purpose:** Analyze global data science compensation across experience levels, company sizes, work arrangements, and company locations.

Each row represents one salary record. Records should not automatically be interpreted as unique job vacancies or individual employees.

## 2. Data Dictionary

| Field | Description |
|---|---|
| `work_year` | Year associated with the salary record |
| `experience_level` | Employee experience category |
| `employment_type` | Employment arrangement, such as full-time or part-time |
| `job_title` | Reported job title |
| `salary` | Salary in the original reported currency |
| `salary_currency` | Original salary currency |
| `salary_in_usd` | Salary converted to USD |
| `employee_residence` | Employee's country of residence |
| `remote_ratio` | Percentage of work performed remotely |
| `company_location` | Country where the employer is located |
| `company_size` | Employer size category |

## 3. Category Definitions

### Experience Level

| Code | Meaning |
|---|---|
| EN | Entry Level |
| MI | Intermediate |
| SE | Senior |
| EX | Expert |

### Company Size

| Code | Meaning |
|---|---|
| S | Small |
| M | Medium |
| L | Large |

### Work Arrangement

| Remote Ratio | Classification |
|---|---|
| 0 | Onsite |
| 50 | Hybrid |
| 100 | Fully Remote |

## 4. KPI Definitions

**Total Salary Records**

Number of records included after applying dashboard filters.

**Median Annual Salary**

50th percentile of `salary_in_usd` for the selected records.

**Average Annual Salary**

Arithmetic mean of `salary_in_usd` for the selected records.

**Fully Remote Share**

Percentage of selected records where `remote_ratio = 100`.

Formula:

Fully Remote Share (%) = (Fully Remote Records / Total Records) × 100

## 5. Geographic Analysis

The geographic visualization uses `company_location` rather than `employee_residence`.

- Bubble size represents the number of salary records.
- Bubble color represents median annual salary in USD.
- Country-level comparisons should consider the underlying sample size.
- The SQL geographic analysis applies a minimum threshold of six records per country. This threshold should be checked against the published Tableau map filter.

## 6. Analytical Methodology

The project uses descriptive analytics to compare compensation across different segments.

Median salary is emphasized because unusually high salaries can influence the arithmetic mean.

Aggregations are calculated at the relevant segment level, including experience level, company size, work arrangement, year, and company location.

SQL queries are provided to reproduce the primary aggregations. Their outputs should be validated against the source dataset and Tableau dashboard before claiming exact reconciliation.

## 7. Analytical Limitations

- The dataset covers 2020–2022 and does not represent current salary conditions.
- The 607 records are a sample, not the complete global data science labor market.
- Salary differences may reflect experience, location, job title, and company characteristics.
- Small geographic samples may produce unstable median estimates.
- Descriptive associations should not be interpreted as causal relationships.
- The analysis does not adjust historical salaries for inflation or differences in purchasing power.
- Record counts should not be interpreted as market-wide hiring activity.

## 8. Validation Checklist

- Confirm the dataset contains 607 records.
- Reconcile median and average salary calculations with Tableau.
- Validate fully remote record counts and percentages.
- Confirm experience-level and company-size mappings.
- Check country-code mapping and geographic sample-size thresholds.
- Verify dashboard filters update the intended metrics and visualizations.
