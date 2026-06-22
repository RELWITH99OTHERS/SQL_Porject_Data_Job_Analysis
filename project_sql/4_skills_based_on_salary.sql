-- top skills based on salary for my role
WITH cte AS (
    SELECT job_id,
        company_id,
        salary_year_avg,
        job_title
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
)
SELECT skills,
    ROUND(avg(salary_year_avg),0) AS salary_avg,
    count(cte.job_id) AS job_count
FROM skills_dim
    INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_JOB_dim.skill_id
    INNER JOIN cte ON skills_job_dim.job_id = cte.job_id
WHERE salary_year_avg IS NOT NULL
GROUP BY skills --HAVING avg(salary_year_avg) > 80000
ORDER BY salary_avg desc
LIMIT 10;