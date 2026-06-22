/*What is the average salary of fully remote 
Data Analysts compared by seniority 
(Senior vs. Junior/Standard)*/

SELECT
        round(avg(salary_year_avg),0) as salary_avg,
        CASE 
            WHEN job_title LIKE '%Senior%' THEN 'Senior-Level'
            ELSE 'Standard/Junior-Level'
            END AS seniority
FROM
    job_postings_fact
WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
GROUP BY
        2
ORDER BY
        1 DESC
LIMIT 20;


SELECT
        avg(salary_year_avg) as salary_avg,
        CASE
        WHEN job_title LIKE '%Senior%' THEN 'Senior-Level'
        ELSE 'Standard/Junior-Level'
        END AS seniority
FROM
        job_postings_fact
WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
GROUP BY
        CASE
        WHEN job_title LIKE '%Senior%' THEN 'Senior-Level'
        ELSE 'Standard/Junior-Level'
        END
ORDER BY
        salary_avg DESC
LIMIT 20;