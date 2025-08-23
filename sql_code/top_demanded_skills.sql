/*
Question: What are the most in demand skils for data engineers?
THOUGHT: Join
*/

SELECT 
        skills
        ,count(sd.skill_id) as skill_count
FROM 
    job_postings_fact jpf
INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE 
    job_title_short = 'Data Engineer' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    skill_count DESC
LIMIT 5


