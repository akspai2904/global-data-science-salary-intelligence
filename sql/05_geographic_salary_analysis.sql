
-- Global Data Science Salary Intelligence
-- Geographic Salary Analysis
-- PostgreSQL

-- Geographic dimension: company_location
-- Bubble size: number of salary records
-- Bubble color: median annual salary (USD)
--
-- Retain countries with at least 6 salary records
-- to reduce the influence of very small samples.

WITH country_salary AS (
    SELECT
        company_location AS country_code,
        COUNT(*) AS salary_records,

        ROUND(
            PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY salary_in_usd)::numeric,
            0
        ) AS median_salary_usd,

        ROUND(
            AVG(salary_in_usd),
            0
        ) AS average_salary_usd

    FROM ds_salaries

    WHERE company_location IS NOT NULL

    GROUP BY company_location

    HAVING COUNT(*) >= 6
)

SELECT
    country_code,
    salary_records,
    median_salary_usd,
    average_salary_usd,

    DENSE_RANK() OVER (
        ORDER BY median_salary_usd DESC
    ) AS salary_rank

FROM country_salary

ORDER BY
    median_salary_usd DESC,
    country_code;

