-- Using https://www.db-fiddle.com/f/ogAiTgZPjwvDxwVHiVK3Ek/0
-- Using Statements called Query to give commands to the Data Base

Task 1
--Original Data:
CREATE TABLE "User" (
  id varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  dob date NOT NULL,
  sex varchar(1) NOT NULL,
  role varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO "User"
VALUES ('u1', 'George', 'Jacobson', '1992-01-01', 'm', 'manager');

INSERT INTO "User"
VALUES ('u2', 'Macy', 'Waterson', '1992-01-01', 'f', 'employee');

INSERT INTO "User"
VALUES ('u3', 'Bill', 'Peters', '1992-01-01', 'm', 'employee');


INSERT INTO "User"
VALUES ('u4','Janine', 'Wilson', '1992-01-01', 'f', 'manager');


INSERT INTO "User"
VALUES ('u5', 'Jason', 'Lipton', '1992-01-01', 'm', 'manager');


CODE

--  Select evrth from Users
SELECT * FROM "User"

--  Select evrth from Users with role "Manager"
select "name"
from "User"
where role = 'manager';

Task 2
--Original Data:
CREATE TABLE Class (
  id character(255),
  year integer NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Student (
  id varchar(255) NOT NULL,
  class varchar(255) NOT NULL,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  dob date NOT NULL,
  sex varchar(1) NOT NULL,
  FOREIGN KEY (class) REFERENCES Class(id),
  PRIMARY KEY (id)
);

INSERT INTO Class(id, year) VALUES('c1', 1);
INSERT INTO Class(id, year) VALUES('c2', 2);
INSERT INTO Class(id, year) VALUES('c2a', 2);

INSERT INTO Student
VALUES ('s1', 'c1', 'George', 'Jacobson', '1992-01-01', 'm');

INSERT INTO Student
VALUES ('s2', 'c2', 'Macy', 'Waterson', '1992-01-01', 'f');

INSERT INTO Student
VALUES ('s3', 'c1', 'Bill', 'Peters', '1992-01-01', 'm');


INSERT INTO Student
VALUES ('s4', 'c1', 'Janine', 'Wilson', '1992-01-01', 'f');


INSERT INTO Student
VALUES ('s5', 'c2', 'Jason', 'Lipton', '1992-01-01', 'm');

CODE:
* Alright so we just saw how queries are made
* Try to complete the following query by adding in the appropriate identifier where we have added comments
*/

--SELECT /* get the students id and name here */
--FROM Student;

select id, firstName, lastName
from Student

--SELECT /* get all of students info here */
--FROM Student;

select *
from Student

