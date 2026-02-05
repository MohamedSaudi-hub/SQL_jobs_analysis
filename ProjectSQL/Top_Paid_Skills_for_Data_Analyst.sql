--4. What are the top skills based on salary for my role?
/*
-Look at the average salary associated with each skill for data Analyst positions
-Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Analysts and
    helps idnetify the most financially rewarding skills to acquire or improve
*/
SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS Salary_Average
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
    job_location ='Egypt'

GROUP BY
skills
ORDER BY
Salary_Average DESC
LIMIT 25;

/*
1. The "Enterprise & BI" Tier ($75,550)

Skills: Azure, DAX, SAP, Flow, Power BI

Insight: The highest earners here are tools deeply integrated into the Microsoft ecosystem (Azure, Power BI, DAX, Flow) or large enterprise systems (SAP). This suggests that specialized knowledge in corporate cloud infrastructure and business intelligence is commanding the highest premium.

2. The "Core Data" Tier ($63,282)

Skills: Python, SQL

Insight: These are the foundational languages of data science and analysis. While essential, they are "middle of the pack" in this specific list, likely because they are so widely known compared to the more specialized enterprise tools above.

3. The "Analyst & Visualization" Tier ($51,014)

Skills: Excel, Tableau, R, Spark

Insight: Traditional spreadsheet tools (Excel) and pure visualization tools (Tableau) are at the lower end. Interestingly, Spark (usually a high-paying big data tool) is in this lower tier, which might indicate this specific dataset focuses more on entry-level or analyst roles rather than data engineering.

Summary: If you are looking to maximize salary based on this specific dataset, focusing on Cloud (Azure) and Advanced BI implementation (Power BI + DAX) yields a significantly higher return (~48% more) than sticking strictly to traditional analysis tools like Excel or Tableau.

[
  {
    "skills": "azure",
    "salary_average": "75550"
  },
  {
    "skills": "dax",
    "salary_average": "75550"
  },
  {
    "skills": "sap",
    "salary_average": "75550"
  },
  {
    "skills": "flow",
    "salary_average": "75550"
  },
  {
    "skills": "power bi",
    "salary_average": "75550"
  },
  {
    "skills": "python",
    "salary_average": "63282"
  },
  {
    "skills": "sql",
    "salary_average": "63282"
  },
  {
    "skills": "excel",
    "salary_average": "51014"
  },
  {
    "skills": "spark",
    "salary_average": "51014"
  },
  {
    "skills": "tableau",
    "salary_average": "51014"
  },
  {
    "skills": "r",
    "salary_average": "51014"
  }
]
*/

