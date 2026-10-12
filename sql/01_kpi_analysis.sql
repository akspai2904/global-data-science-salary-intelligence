-- Global Data Science Salary Intelligence
-- KPI Analysis | PostgreSQL
-- Dataset: ds_salaries (2020–2022)

-- 1. Total salary records
SELECT COUNT(*) AS total_salary_records
FROM ds_salaries;

-- 2. Median and average annual salary (USD)
SELECT
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY salary_in_usd)::numeric,
        0
    ) AS median_annual_salary,
    ROUND(AVG(salary_in_usd), 0) AS average_annual_salary
FROM ds_salaries;

-- 3. Fully remote share (%)
-- remote_ratio: 100 = fully remote
SELECT
    COUNT(*) FILTER (WHERE remote_ratio = 100)
        AS fully_remote_records,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE remote_ratio = 100)
        / NULLIF(COUNT(*), 0),
        2
    ) AS fully_remote_share_pct
FROM ds_salaries;
