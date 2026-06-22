/*What are the top most in-demand skills for 
Data Analysts, broken down and ranked by seniority
 (Senior-Level vs. Standard/Junior-Level)?*/


SELECT 
        skills_dim.skills AS name,
        count(job_postings_fact.job_id) AS job_count

FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' 
        AND job_title not like '%Senior%'
GROUP BY
        skills
HAVING 
        COUNT(job_postings_fact.job_id) 
ORDER BY job_count DESC
LIMIT 150;

--i plan to switch the '%senior%' for junior and compare. is that good?


SELECT
        CASE 
            WHEN job_title LIKE '%Senior%' THEN 'Senior-Level'
            ELSE 'Standard/Junior-Level'
        END AS seniority_tier,
        skills_dim.skills AS skill_name,
        COUNT(job_postings_fact.job_id) AS job_count
FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' 
        -- Removed the specific title filter so we grab ALL analysts to compare!
GROUP BY
        1, 2 -- Groups by seniority_tier (1) and skill_name (2)
HAVING
        COUNT(job_postings_fact.job_id)  > 500
ORDER BY
        seniority_tier, -- Keeps all Senior rows together, then all Junior rows together
        job_count      -- Puts the most in-demand skills at the top of each group
LIMIT 100;