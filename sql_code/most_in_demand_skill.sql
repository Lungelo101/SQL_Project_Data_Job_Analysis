WITH top_paying_jobs AS(
            SELECT 
                job_id
                ,job_title
                ,job_schedule_type
                ,salary_year_avg
            FROM 
                job_postings_fact
            WHERE
                job_title_short = 'Data Engineer' AND 
                --job_location = 'Anywhere' AND 
                salary_year_avg IS NOT NULL
            ORDER BY    
                salary_year_avg DESC
            LIMIT
                10
)
SELECT 
        tp.*,
        sd.skills
FROM top_paying_jobs tp
INNER JOIN skills_job_dim sjd
ON tp.job_id = sjd.job_id
INNER JOIN skills_dim sd
 ON sd.skill_id  = sjd.skill_id