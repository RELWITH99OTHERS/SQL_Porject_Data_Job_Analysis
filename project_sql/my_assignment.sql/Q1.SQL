--locations with the highest number of Data Analyst job postings.
SELECT
        job_location,
        COUNT(job_id) AS postings_count
FROM
        job_postings_fact
WHERE
        job_title_short = 'Data Analyst'
        AND job_location != 'Anywhere'
GROUP BY
        job_location
ORDER BY 
        postings_count DESC
LIMIT 5;