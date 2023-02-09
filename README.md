# JSSSTU DBMS Lab (Database Management System)

## Sailors Database 

1. Find the colours of boats reserved by Albert 
2. Find all sailor id’s of sailors who have a rating of at least 8 or reserved boat 103 
3. Find the names of sailors who have not reserved a boat whose name contains the string “storm”. Order the names in ascending order. 
4. Find the names of sailors who have reserved all boats. 
5. Find the name and age of the oldest sailor. 
6. For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors. 
7. A view that shows names and ratings of all sailors sorted by rating in descending order. 
8. Create a view that shows the names of the sailors who have reserved a boat on a given date.
9. Create a view that shows the names and colours of all the boats that have been reserved by a sailor with a specific rating.
10. A trigger that prevents boats from being deleted If they have active reservations. 
11. A trigger that prevents sailors with rating less than 3 from reserving a boat.
12. A trigger that deletes all expired reservations.

## Insurance Database 

1. Find the total number of people who owned cars that were involved in accidents in 2021. 
2. Find the number of accidents in which the cars belonging to “Smith” were involved.  
3. Add a new accident to the database; assume any values for required attributes.  
4. Delete the Mazda belonging to “Smith”.  
5. Update the damage amount for the car with license number “KA09MA1234” in the accident with report. 
6. A view that shows models and year of cars that are involved in accident. 
7. Create a view that shows name and address of drivers who own a car.
8. Create a view that shows the names of the drivers who a participated in a accident in a specific place.
9. A trigger that prevents driver with total damage amount >rs.50,000 from owning a car. 
10. A trigger that prevents a driver from participating in more than 3 accidents in a given year.

## Order Processing Database 

1. List the Order# and Ship\_date for all orders shipped from Warehouse# "W2". 
2. List the Warehouse information from which the Customer named "Kumar" was supplied his orders. Produce a listing of Order#, Warehouse#. 
3. Produce a listing: Cname, #ofOrders, Avg\_Order\_Amt, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer. (Use aggregate functions) 
4. Delete all orders for customer named "Kumar". 
5. Find the item with the maximum unit price. 
6. A trigger that prevents warehouse details from being deleted if any item has to be shipped from that warehouse. 
7. Create a view to display orderID and shipment date of all orders shipped from a warehouse 2. 
8. A view that shows the warehouse name from where the kumar’s order is been shipped.
9. A tigger that updates order\_amount based on quantity and unit price of order\_item .

## Enrollment Database 

1. Demonstrate how you add a new text book to the database and make this book be adopted by some department.  
2. Produce a list of text books (include Course #, Book-ISBN, Book-title) in the alphabetical order for courses offered by the ‘CS’ department that use more than two books.  
3. List any department that has all its adopted books published by a specific publisher. 
4. List the students who have scored maximum marks in ‘DBMS’ course. 
5. Create a view to display all the courses opted by a student along with marks obtained.
6. Create a view to show the enrolled details of a student.
7. Create a view to display course related books from course\_adoption and text book table using book\_ISBN. 
8. Create a trigger such that it Deletes all records from enroll table when course is deleted . 
9. Create a trigger that prevents a student from enrolling in a course if the marks pre\_requisit is less than the given threshold . 

## Company Database 

1. Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project.  
2. Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent raise.  
3. Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary, the minimum salary, and the average salary in this department  
4. Retrieve the name of each employee who works on all the projects controlled by department number 5 (use NOT EXISTS operator). 
5. For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000. 
6. Create a view that shows name, dept name and location of all employees. 
7. Create a view that shows project name, location and dept.
8. A trigger that automatically updates manager’s start date when he is assigned . 
9. Create a trigger that prevents a project from being deleted if it is currently being worked by any employee.


