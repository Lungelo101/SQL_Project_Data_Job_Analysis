/*
Question: What are the top paying skils for data engineers?
THOUGHT: Look at the average salary associated with each skill
*/

SELECT 
        skills
        ,ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM 
    job_postings_fact jpf
INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE 
    job_title_short = 'Data Engineer' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25


