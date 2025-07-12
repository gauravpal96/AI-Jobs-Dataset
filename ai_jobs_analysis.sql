# CREATE DATABASE

CREATE DATABASE AI_jobs;
USE AI_jobs;
select * from ai_dataset;


# Table structure query
select column_name, data_type from
information_schema.columns
where table_name = "ai_dataset";

                           ==========================  Solve SQL Querys  ================================               

-- 1. Top 10 Highest Paying Job Titles
create view Top_10_Highest_Paying_Job as
select job_title, salary_usd from ai_dataset
group by job_title, salary_usd
order by salary_usd desc
limit 10;
select * from Top_10_Highest_Paying_Job;


-- 2. Average Salary by Experience Level
create view Average_Salary_by_Experience as
select experience_level, round(avg(salary_usd),2)as avg_salary from ai_dataset
group by experience_level
order by avg_salary;
select * from Average_Salary_by_Experience;


-- 3. Remote Jobs Percentage by Industry
create view Remote_Job_Percentage_by_Industry as
select industry,
round(100.0 * sum(case when remote_ratio = "100" then 1 else 0 end)/count(*), 2) as remote_percentage
from ai_dataset
group by industry
order by remote_percentage desc;
select * from Remote_Job_Percentage_by_Industry;


-- 4. Job Distribution by Company Size
create view Job_Distribution_company as
select company_size, count(job_title)as count_job_title from ai_dataset
group by company_size;
select * from Job_Distribution_company;


-- 5. Average Years of Experience Required by Job Title
create view avg_experience_required as
select job_title, round(avg(years_experience),2) as avg_experience from ai_dataset
group by job_title;
select * from avg_experience_required;


-- 6. Industries with Highest Benefits Score
create view Highest_Benefits_industry as
select industry, benefits_score from ai_dataset
group by industry, benefits_score
order by benefits_score desc
limit 1;
select * from Highest_Benefits_industry;


-- 7. Top 5 Countries Hiring for Remote Jobs
create view remote_jobs_hiring_countries as
SELECT company_location, remote_ratio AS remote_jobs
FROM ai_dataset
WHERE remote_ratio = 100
group by company_location, remote_ratio
ORDER BY remote_jobs DESC
LIMIT 5;
select * from remote_jobs_hiring_countries;


-- 8. Education Requirement Distribution
create view Education_distribution as
select education_required, count(education_required) as education_count from ai_dataset
group by education_required;
select * from Education_distribution;


-- 9. Top 3 Employers with Highest Average Salary
create view Highest_Average_Salary_Employers as 
select company_name, round(avg(salary_usd),2) as avg_salary from ai_dataset
group by company_name
order by avg_salary desc
limit 3;
select * from Highest_Average_Salary_Employers;


-- 10. Average Salary by Employment Type
create view Average_Salary_by_Employment as 
select employment_type, round(avg(salary_usd),2)as avg_salary from ai_dataset
group by employment_type;
select * from Average_Salary_by_Employment;
