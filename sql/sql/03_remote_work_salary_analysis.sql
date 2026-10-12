
-- Global Data Science Salary Intelligence
-- Work Arrangement Salary Analysis
-- PostgreSQL

-- remote_ratio:
-- 100 = Fully Remote
-- 50  = Hybrid
-- 0   = Onsite

SELECT
    CASE remote_ratio
        WHEN 100 THEN 'Fully Remote'
        WHEN 50 THEN 'Hybrid'
        WHEN 0 THEN 'Onsite'
        ELSE 'Other / Unknown'
    END AS work_arrangement,

    COUNT(*) AS salary_records,

    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY salary_in_usd)::numeric,
        0
    ) AS median_salary_usd,

    ROUND(
        AVG(salary_in_usd),
        0
    ) AS average_salary_usd,

    ROUND(
        100.0 * COUNT(*)
        / NULLIF(
            (SELECT COUNT(*) FROM ds_salaries),
            0
        ),
        2
    ) AS percentage_of_records

FROM ds_salaries

GROUP BY remote_ratio

ORDER BY median_salary_usd DESC;

