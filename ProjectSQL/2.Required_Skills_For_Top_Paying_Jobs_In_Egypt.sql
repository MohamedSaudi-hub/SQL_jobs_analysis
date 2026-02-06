--1.What are the top paying jobs for my role ('Data analyst')
--2. What are the skills required for these top-paying roles?
--3.What are the most in-demand skills for my role?
--4.What are the top skills based on salary for my role?
--5.What are the most optimal skills to learn?
--a. Optimal: High Demand AND High Paying

/* 2. What are the skills required for these top-paying roles?
- Use The top 10 highest-paying Data analyst jobs demand certain skills,
-Why? it provides a detalied look at which high-paying jobs demand certain skills, helping job seekers 
understand which skills to develop that align with top salaries
*/
WITH Top_paying_jobs AS( 
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    companies.name AS Company_name,
    job_posted_date::TIMESTAMP
FROM job_postings_fact

LEFT JOIN company_dim AS companies
ON job_postings_fact.company_id = companies.company_id

WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE

ORDER BY
    salary_year_avg DESC
)
SELECT Top_paying_jobs.job_id,
    job_title,
    salary_year_avg,
    job_location,
    Top_paying_jobs.Company_name,
    job_schedule_type,
    skills_dim.skills
FROM Top_paying_jobs

INNER JOIN skills_job_dim
ON skills_job_dim.job_id= Top_paying_jobs.job_id
INNER JOIN skills_dim 
ON skills_dim.skill_id = skills_job_dim.skill_id
    ORDER BY
        salary_year_avg DESC
LIMIT 25;