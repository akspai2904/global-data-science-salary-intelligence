
-- Global Data Science Salary Intelligence
-- Salary Analysis by Experience Level and Company Size
-- PostgreSQL

-- Experience levels:
-- EN = Entry Level
-- MI = Intermediate
-- SE = Senior
-- EX = Expert

-- Company sizes:
-- S = Small
-- M = Medium
-- L = Large

SELECT
    CASE experience_level
        WHEN 'EN' THEN 'Entry Level'
        WHEN 'MI' THEN 'Intermediate'
        WHEN 'SE' THEN 'Senior'
        WHEN 'EX' THEN 'Expert'
    END AS experience_level,

    CASE company_size
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
    END AS company_size,

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

GROUP BY
    experience_level,
    company_size

ORDER BY
    CASE experience_level
        WHEN 'EN' THEN 1
        WHEN 'MI' THEN 2
        WHEN 'SE' THEN 3
        WHEN 'EX' THEN 4
    END,
    CASE company_size
        WHEN 'S' THEN 1
        WHEN 'M' THEN 2
        WHEN 'L' THEN 3
    END;

