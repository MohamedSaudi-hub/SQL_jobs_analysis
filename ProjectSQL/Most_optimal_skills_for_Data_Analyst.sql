--5.What are the most optimal skills to learn?
--a. Optimal: High Demand AND High Paying

/*
- Identify skills in high demand associated with high average salaries for Data Analyst roles
- Concetrates on remote positions with specified salaries
-Why? Targets skills that offer job security(high demand) and financial benefits (High Salaries),
    offering strategic insights for career development in data analysis
*/

SELECT
    skills_job_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS skills_count,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short ='Data Analyst'
    AND 
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home =TRUE
GROUP BY
    skills,
    skills_job_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
average_salary DESC,
skills_count DESC

LIMIT 25;