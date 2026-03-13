CREATE DATABASE HR_Analysis;
USE HR_Analysis;
CREATE TABLE employee_attrition (
    EmpID VARCHAR(10),
    Age INT,
    AgeGroup VARCHAR(10),
    Attrition VARCHAR(5),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT ,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    SalarySlab VARCHAR(20),
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 CHAR(1),
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

LOAD DATA INFILE"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/HR_Analytics.csv"
INTO TABLE employee_attrition
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
(EmpID,Age,AgeGroup,Attrition,BusinessTravel,DailyRate,Department,DistanceFromHome,Education,EducationField,EmployeeCount,EmployeeNumber,EnvironmentSatisfaction,Gender,
HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, SalarySlab, MonthlyRate, NumCompaniesWorked, Over18, OverTime, 
PercentSalaryHike, PerformanceRating, RelationshipSatisfaction, StandardHours, StockOptionLevel, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, 
YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager);

SELECT*FROM employee_attrition;

-- Total Employees
SELECT COUNT(*) AS Total_employee FROM employee_attrition;

-- Attrition Count
SELECT Attrition, COUNT(*) AS Total_attrition FROM employee_attrition GROUP BY Attrition;

-- Department Wise Employees
SELECT Department, COUNT(*) AS Department_wise_total_employee FROM employee_attrition GROUP BY Department;

-- Department Wise Attrition
SELECT Department, Attrition, COUNT(*) AS Department_wise_attrition FROM employee_attrition GROUP BY Department, Attrition;

-- Job Role Wise Attrition
SELECT JobRole, COUNT(*) AS Attrition_Count FROM employee_attrition WHERE Attrition='Yes' GROUP BY JobRole ORDER BY Attrition_Count DESC;

-- Average Salary by Department
SELECT Department, AVG(MonthlyIncome) AS avg_salary_department_wise FROM employee_attrition GROUP BY Department;

-- Age Group Distribution
SELECT AgeGroup, COUNT(*) AS Employee_age_group FROM employee_attrition GROUP BY AgeGroup;

-- Attrition by Age Group
SELECT AgeGroup, COUNT(*) AS attrition_by_age_group FROM employee_attrition WHERE Attrition = "Yes" GROUP BY AgeGroup;

-- Overtime vs Attrition
SELECT OverTime, Attrition, COUNT(*) AS Total FROM employee_attrition GROUP BY OverTime, Attrition;

-- Work Life Balance Analysis
SELECT WorkLifeBalance, COUNT(*) AS Employees FROM employee_attrition GROUP BY WorkLifeBalance;

-- Salary Slab Distribution
SELECT SalarySlab, COUNT(*) AS Employees FROM employee_attrition GROUP BY SalarySlab;

-- Experience vs Salary
SELECT TotalWorkingYears, AVG(MonthlyIncome) AS Avg_Salary FROM employee_attrition GROUP BY TotalWorkingYears ORDER BY TotalWorkingYears;

-- Gender Distribution
SELECT Gender, COUNT(*) AS Total_employee_gen FROM employee_attrition GROUP BY Gender;

-- Business Travel Analysis
SELECT BusinessTravel, COUNT(*) AS Employees FROM employee_attrition GROUP BY BusinessTravel;

-- Employees by Marital Status
SELECT MaritalStatus, COUNT(*) AS TotalEmployees FROM employee_attrition GROUP BY MaritalStatus;

-- Attrition by Marital Status
SELECT MaritalStatus, COUNT(*) AS Attrition_by_marital_status FROM employee_attrition WHERE Attrition = "Yes" GROUP BY MaritalStatus;

-- Average Salary by Job Role
SELECT JobRole, AVG(MonthlyIncome) AS avg_salary_by_jobrole FROM employee_attrition GROUP BY JobRole ORDER BY AVG(MonthlyIncome) DESC;

-- Highest Paid Employees
SELECT EmpID, Department, EmployeeNumber, JobRole,MonthlyIncome FROM employee_attrition ORDER BY MonthlyIncome DESC LIMIT 10;

-- Lowest Paid Employees
SELECT EmpID, JobRole, MonthlyIncome FROM employee_attrition ORDER BY MonthlyIncome LIMIT 10;

-- Employees with Most Experience
SELECT EmpID, TotalWorkingYears FROM employee_attrition ORDER BY TotalWorkingYears DESC LIMIT 10;

-- Employees by Education Field
SELECT EducationField, COUNT(*) AS Emp_by_eduction FROM employee_attrition GROUP BY EducationField;

-- Attrition by Education Field
SELECT EducationField, COUNT(*) AS attrition_by_education_field FROM employee_attrition WHERE Attrition = "Yes" GROUP BY EducationField;

-- Job Satisfaction Distribution
SELECT JobSatisfaction, COUNT(*) AS employee_job_satisfaction FROM employee_attrition GROUP BY JobSatisfaction;

-- Environment Satisfaction Distribution
SELECT EnvironmentSatisfaction, COUNT(*) AS Employees FROM employee_attrition GROUP BY EnvironmentSatisfaction;

-- Average Salary by Gender
SELECT Gender, AVG(MonthlyIncome) AS AvgSalary FROM employee_attrition GROUP BY Gender;

-- Attrition by Gender
SELECT Gender, COUNT(*) AS AttritionCount FROM employee_attrition WHERE Attrition='Yes' GROUP BY Gender;

-- Employees with Overtime
SELECT OverTime, COUNT(*) AS Employees FROM employee_attrition GROUP BY OverTime;

-- Average Salary by Age Group
SELECT AgeGroup, AVG(MonthlyIncome) AS AvgSalary FROM employee_attrition GROUP BY AgeGroup;

-- Attrition by Salary Slab
SELECT SalarySlab, COUNT(*) AS AttritionCount FROM employee_attrition WHERE Attrition='Yes' GROUP BY SalarySlab;

-- Average Working Years by Department
SELECT Department, AVG(TotalWorkingYears) AS AvgExperience FROM employee_attrition GROUP BY Department;

-- Employees by Job Level
SELECT JobLevel, COUNT(*) AS Employees FROM employee_attrition GROUP BY JobLevel;

-- Attrition by Job Level
SELECT JobLevel, COUNT(*) AS AttritionCount FROM employee_attrition WHERE Attrition='Yes' GROUP BY JobLevel;

-- Average Years at Company
SELECT AVG(YearsAtCompany) AS AvgYearsInCompany FROM employee_attrition;

-- Employees with Promotion Delay
SELECT EmpID, YearsSinceLastPromotion FROM employee_attrition ORDER BY YearsSinceLastPromotion DESC LIMIT 10;

-- Training Analysis
SELECT TrainingTimesLastYear, COUNT(*) AS Employees FROM employee_attrition GROUP BY TrainingTimesLastYear;

-- Relationship Satisfaction Analysis
SELECT RelationshipSatisfaction, COUNT(*) AS Employees FROM employee_attrition GROUP BY RelationshipSatisfaction;