# Pewlett-Hackard-Analysis


## Overview 
Pewlett Hackard is trying to track its employees who are reaching retirement age and whose positions will need to be filled. 

For this analysis, we see how many people would be retiring by title and current employees eligible for mentorship program. 

## Resources
### Data 
Following data was provided through six csv files added in the Data folder: 

- departments 
- dept_emp 
- dept_manager 
- employees 
- salaries 
- titles 

### Establishing relationships 
An ERD was created to highlight the data available in each file and their relationships. 
![](https://github.com/madihajaved/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png)

## Results 
### Deliverable 1
To find the number of people retiring by title the following steps were taken: 
- Data from employees and titles databased was joined together into one table using employee number as the primary key (unique id)
- Retiring employees were defined as those born between Jan 1, 1952 to Dec 31, 1955. 
- To remove duplicate records of employees who had been promoted and therefore came in multiple rows with different titles, DISTINCT ON function was used using employee number as the unique key and keeping only their latest title by ordering the data on title to_date column on a descending basis. 
- Based on this info, a new table was created which counted employees by title and sorted them based on employee number. The output is given below:

![](https://github.com/madihajaved/Pewlett-Hackard-Analysis/blob/main/Employees_retiring_by_title.png)
 
### Deliverable 2
To find the current employees eligible for the mentorship program, the following steps were taken: 
- Data was combined from the dept_emp, employees and titles files 
- The data was joined using left join with employee number being the unique key 
- Eligibility was based on age and defined as birth dates between Jan 1, 1965 to Dec 31, 1965
- Employees had to be currently in the company 
- The data was sorted by latest title as well as employee id

![](https://github.com/madihajaved/Pewlett-Hackard-Analysis/blob/main/Mentorship_eligibility.png)

## Summary 
Based on the analysis, it can be seen that the company is expecting a high number of employees to retire soon, specifically Senior Engineer and Engineers. The data was also used successfully who see who would be eligible for mentorship. 

For further analysis, it would be helpful to see how many vacancies can be filled internally and how many would need to be fulfilled from external sources. Secondly, the company can also use the mentorship data and see how many available and relevant mentors are there and can use that information to formally assign mentors. 