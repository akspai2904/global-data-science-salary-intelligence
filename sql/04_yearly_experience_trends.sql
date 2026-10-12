
-- Global Data Science Salary Intelligence
-- Yearly Trends by Experience Level
-- PostgreSQL

-- Analyze the distribution of salary records
-- across work years and experience levels.

WITH yearly_experience AS (
    SELECT
        work_year,

        CASE experience_level
            WHEN 'EN' THEN 'Entry Level'
            WHEN 'MI' THEN 'Intermediate'
            WHEN 'SE' THEN 'Senior'
            WHEN 'EX' THEN 'Expert'
            ELSE 'Unknown'
        END AS experience_level,

        COUNT(*) AS salary_records

    FROM ds_salaries

    GROUP BY
        work_year,
        experience_level
)

SELECT
    work_year,
    experience_level,
    salary_records,

    SUM(salary_records) OVER (
        PARTITION BY work_year
    ) AS total_records_per_year,

    ROUND(
        100.0 * salary_records
        / NULLIF(
            SUM(salary_records) OVER (
                PARTITION BY work_year
            ),
            0
        ),
        2
    ) AS percentage_within_year

FROM yearly_experience

ORDER BY
    work_year,
    CASE experience_level
        WHEN 'Entry Level' THEN 1
        WHEN 'Intermediate' THEN 2
        WHEN 'Senior' THEN 3
        WHEN 'Expert' THEN 4
        ELSE 5
    END;

