-- Joining employees and titles into retirement 
SELECT e.emp_no, 
		e.first_name, 
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
			first_name,
			last_name,
			title
INTO unique_titles
FROM retirement 
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(emp_no) FROM unique_titles;


-- retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (emp_no),title
INTO retiring_title
FROM unique_titles
GROUP BY title 
ORDER BY count(emp_no) DESC;

SELECT * FROM retiring_title;


-- create a mentorship-eligibility table that holds the current employees who were born between 
-- January 1, 1965 and December 31, 1965, ordered by their latest title.
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
		e.first_name, 
		e.last_name, 
		e.birth_date, 
		de.from_date, 
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC;

SELECT * FROM mentorship_eligibility;