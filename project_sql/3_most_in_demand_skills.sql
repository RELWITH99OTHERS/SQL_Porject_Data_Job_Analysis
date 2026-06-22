WITH cte AS (SELECT 
        job_id,
        company_id,
        job_title
FROM
        job_postings_fact
WHERE
        job_title_short = 'Data Analyst' 
        AND job_location = 'Anywhere'
)

SELECT 
        skills,
        count(cte.job_id) AS job_count
FROM skills_dim
        INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        INNER JOIN cte ON skills_job_dim.job_id = cte.job_id
GROUP BY skills
ORDER BY job_count desc

does this answer the question for the most in-demand skill for data analyst