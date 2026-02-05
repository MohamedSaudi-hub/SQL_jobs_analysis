--1.What are the top paying jobs for my role ('Data analyst')
--2. What are the skills required for these top-paying roles?
--3.What are the most in-demand skills for my role?
--4.What are the top skills based on salary for my role?
--5.What are the most optimal skills to learn?
--a. Optimal: High Demand AND High Paying
/*
--1.1.What are the top paying jobs for my role ('Data analyst')
-Identify the top 10 highest-paying data analyst jobs?
-Focuses on jobo postings with specified salaries (remove nulls)
-Why? Highlight the top-paying opportunities for Data Analysts, offering insights into


*/
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

LIMIT 10;

