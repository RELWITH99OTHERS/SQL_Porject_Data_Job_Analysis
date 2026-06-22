SELECT 
        job_postings_fact.job_id,
        job_postings_fact.job_title,
        job_postings_fact.job_location,
        job_postings_fact.job_schedule_type,
        job_postings_fact.salary_year_avg,
        job_postings_fact.job_posted_date :: DATE,
        company_dim.name as company_name,
        skills_dim.skills as skill_name
FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_postings_fact.job_title_short = 'Data Analyst' 
        AND job_postings_fact.job_location = 'Anywhere'
        AND job_postings_fact.salary_year_avg IS NOT NULL
ORDER BY
        job_postings_fact.salary_year_avg DESC
LIMIT 10;


WITH CTE AS
    (SELECT 
            job_id,
            job_title,
            job_location,
            job_schedule_type,
            salary_year_avg,
            job_posted_date :: DATE,
            name as company_name
    FROM
            job_postings_fact
            LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
            job_title_short = 'Data Analyst' 
            AND job_location = 'Anywhere'
            AND salary_year_avg IS NOT NULL
    ORDER BY
            salary_year_avg DESC
    LIMIT 10
    )

SELECT 
        CTE.*,
        skills
FROM 
        CTE
        INNER JOIN skills_job_dim ON CTE.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
salary_year_avg DESC    
LIMIT 10;    







[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "company_name": "AT&T",
    "skill_name": "excel"
  }
]