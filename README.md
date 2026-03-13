# HR Employee Attrition Analysis (SQL)
## Project Overview

• This project performs HR Employee Attrition Analysis using SQL to understand workforce trends and identify factors that influence employee turnover.

• The analysis focuses on exploring employee data such as department, job role, salary, age group, work experience, and job satisfaction. The goal is to generate insights that help organizations improve employee retention and HR decision making.

## Objectives

The main objectives of this project are:

• Analyze employee attrition patterns

• Identify departments with high employee turnover

• Study the relationship between salary and experience

• Understand employee distribution across different job roles

• Generate insights to support HR decision making

## Dataset Description

The dataset contains HR related employee information such as:

• Employee ID

• Age

• Age Group

• Gender

• Department

• Job Role

• Education Field

• Monthly Income

• Salary Slab

• Total Working Years

• Work Life Balance

• Job Satisfaction

• Attrition Status

This dataset helps analyze workforce behavior and identify patterns in employee attrition.

## Technologies Used

The following tools and technologies were used in this project:

• MySQL

• SQL Queries

• Data Analysis using SQL

## Database Structure

The project begins by creating a database and a table to store employee information.

  CREATE DATABASE HR_Analysis;
  
  USE HR_Analysis;
  
  CREATE TABLE employee_attrition (

  EmpID VARCHAR(10),
  
  Age INT,
  
  AgeGroup VARCHAR(10),
  
  Attrition VARCHAR(5),
  
  Department VARCHAR(50),
  
  JobRole VARCHAR(50),
  
  MonthlyIncome INT,
  
  TotalWorkingYears INT,
  
  WorkLifeBalance INT
  
  );

The employee data is then imported from a CSV file into the table.

## Analysis Performed

Several SQL queries were used to analyze employee data, including:

• Total number of employees

• Attrition count and attrition rate

• Department wise employee distribution

• Department wise attrition analysis

• Job role wise attrition

• Age group distribution

• Salary distribution

• Gender distribution

• Overtime vs attrition analysis

• Work life balance analysis

• Experience vs salary analysis

## Example SQL Queries

Example query to calculate total employees:

SELECT COUNT(*) AS Total_employee 

FROM employee_attrition;

Example query to analyze department wise attrition:

  SELECT Department, Attrition, COUNT(*) AS Department_wise_attrition
  
  FROM employee_attrition
  
  GROUP BY Department, Attrition;

Example query to find job roles with highest attrition:

  SELECT JobRole, COUNT(*) AS Attrition_Count
  
  FROM employee_attrition
  
  WHERE Attrition = 'Yes'
  
  GROUP BY JobRole
  
  ORDER BY Attrition_Count DESC;
  
  ## Key Insights

Some insights obtained from the analysis include:

• Certain departments show higher employee attrition

• Job roles with lower job satisfaction tend to have higher attrition

• Salary levels influence employee retention

• Employees working overtime show higher chances of leaving

• Experience and income show a strong relationship

## Project Structure
HR-Employee-Attrition-Analysis

│

├── HR Employee Attrition.sql

├── HR_Analytics.csv

├── README.md

## How to Run the Project
1 Clone the repository git clone

    https://github.com/RitikDevrani/HR-Employee-Attrition-Analysis.git

2 Open MySQL

Start MySQL and create the database.

3 Run the SQL script

Execute the SQL file to:

• Create the database

• Create the table

• Import the dataset

• Run analysis queries

## Future Improvements

Possible improvements for this project include:

• Creating HR dashboards using Power BI or Tableau

• Adding more advanced SQL queries for deeper analysis

• Performing predictive attrition analysis using machine learning

## Author

Ritik Devrani

• Diploma in Computer Science

• BCA (IGNOU)
