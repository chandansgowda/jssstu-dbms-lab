DROP DATABASE IF EXISTS insurance;
CREATE DATABASE insurance;
USE insurance;

CREATE TABLE IF NOT EXISTS person (
driver_id VARCHAR(255) NOT NULL,
driver_name TEXT NOT NULL,
address TEXT NOT NULL,
PRIMARY KEY (driver_id)
);

CREATE TABLE IF NOT EXISTS car (
reg_no VARCHAR(255) NOT NULL,
model TEXT NOT NULL,
c_year INTEGER,
PRIMARY KEY (reg_no)
);

CREATE TABLE IF NOT EXISTS accident (
report_no INTEGER NOT NULL,
accident_date DATE,
location TEXT,
PRIMARY KEY (report_no)
);

CREATE TABLE IF NOT EXISTS owns (
driver_id VARCHAR(255) NOT NULL,
reg_no VARCHAR(255) NOT NULL,
FOREIGN KEY (driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
FOREIGN KEY (reg_no) REFERENCES car(reg_no) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS participated (
driver_id VARCHAR(255) NOT NULL,
reg_no VARCHAR(255) NOT NULL,
report_no INTEGER NOT NULL,
damage_amount FLOAT NOT NULL,
FOREIGN KEY (driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
FOREIGN KEY (reg_no) REFERENCES car(reg_no) ON DELETE CASCADE,
FOREIGN KEY (report_no) REFERENCES accident(report_no)
);

INSERT INTO person VALUES
("D111", "Driver_1", "Kuvempunagar, Mysuru"),
("D222", "Smith", "JP Nagar, Mysuru"),
("D333", "Driver_3", "Udaygiri, Mysuru"),
("D444", "Driver_4", "Rajivnagar, Mysuru"),
("D555", "Driver_5", "Vijayanagar, Mysore");

INSERT INTO car VALUES
("KA-20-AB-4223", "Swift", 2020),
("KA-20-BC-5674", "Mazda", 2017),
("KA-21-AC-5473", "Alto", 2015),
("KA-21-BD-4728", "Triber", 2019),
("KA-09-MA-1234", "Tiago", 2018);

INSERT INTO accident VALUES
(43627, "2020-04-05", "Nazarbad, Mysuru"),
(56345, "2019-12-16", "Gokulam, Mysuru"),
(63744, "2020-05-14", "Vijaynagar, Mysuru"),
(54634, "2019-08-30", "Kuvempunagar, Mysuru"),
(65738, "2021-01-21", "JSS Layout, Mysuru"),
(66666, "2021-01-21", "JSS Layout, Mysuru");

INSERT INTO owns VALUES
("D111", "KA-20-AB-4223"),
("D222", "KA-20-BC-5674"),
("D333", "KA-21-AC-5473"),
("D444", "KA-21-BD-4728"),
("D222", "KA-09-MA-1234");

INSERT INTO participated VALUES
("D111", "KA-20-AB-4223", 43627, 20000),
("D222", "KA-20-BC-5674", 56345, 49500),
("D333", "KA-21-AC-5473", 63744, 15000),
("D444", "KA-21-BD-4728", 54634, 5000),
("D222", "KA-09-MA-1234", 65738, 25000);



-- Find the total number of people who owned a car that were involved in accidents in 2021

select COUNT(driver_id)
from participated p, accident a
where p.report_no=a.report_no and a.accident_date like "2021%";

-- Find the number of accident in which cars belonging to smith were involved

select COUNT(distinct a.report_no)
from accident a
where exists 
(select * from person p, participated ptd where p.driver_id=ptd.driver_id and p.driver_name="Smith" and a.report_no=ptd.report_no);

-- Add a new accident to the database

insert into accident values
(45562, "2024-04-05", "Mandya");

insert into participated values
("D222", "KA-21-BD-4728", 45562, 50000);


-- Delete the Mazda belonging to Smith

delete from car
where model="Mazda" and reg_no in
(select car.reg_no from person p, owns o where p.driver_id=o.driver_id and o.reg_no=car.reg_no and p.driver_name="Smith");


-- Update the damage amount for the car with reg_no of KA-09-MA-1234 in the accident with report_no 65738

update participated set damage_amount=10000 where report_no=65738 and reg_no="KA-09-MA-1234";

-- View that shows models and years of car that are involved in accident

create view CarsInAccident as
select distinct model, c_year
from car c, participated p
where c.reg_no=p.reg_no;

select * from CarsInAccident;

-- Create a view that shows name and address of drivers who own a car.

create view DriversWithCar as
select driver_name, address
from person p, owns o
where p.driver_id=o.driver_id;

select * from DriversWithCar;


-- Create a view that shows the names of the drivers who a participated in a accident in a specific place.

create view DriversWithAccidentInPlace as
select driver_name
from person p, accident a, participated ptd
where p.driver_id = ptd.driver_id and a.report_no = ptd.report_no and a.location="Vijaynagar, Mysuru";

select * from DriversWithAccidentInPlace;

-- Trigger that prevents a driver with total_damage_amount greater than Rs. 50,000 from owning a car

delimiter //
create or replace trigger PreventOwnership 
before insert on owns 
for each row
begin
	if new.driver_id in (select driver_id from participated group by driver_id
having sum(damage_amount) >= 50000) then
	signal sqlstate '45000' set message_text = 'Damage Greater than Rs.50,000';
	end if;
end;//

delimiter ;

insert into owns VALUES
("D222", "KA-21-AC-5473"); -- Will give error since total damage amount of D222 exceeds 50k

-- A trigger that prevents a driver from participating in more than 2 accidents in a given year.

DELIMITER //
create trigger PreventParticipation
before insert on participated
for each row
BEGIN
	IF 2<=(select count(*) from participated where driver_id=new.driver_id) THEN
		signal sqlstate '45000' set message_text='Driver has already participated in 2 accidents';
	END IF;
END;//
DELIMITER ;

INSERT INTO participated VALUES
("D222", "KA-20-AB-4223", 66666, 20000);















