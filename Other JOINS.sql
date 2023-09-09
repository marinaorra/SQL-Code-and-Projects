/*
1. Cross Join:
Create a combination of every row from tables (combination of evrth with evrth)

Function called: cartesian 
*/

--create table "cartesianA" (id INT);
--create table "cartesianB" (id INT);

--once the tables were created we want to insert data in them
--insert into "cartesianA" VALUES(1);
--insert into "cartesianA" VALUES(2);
--insert into "cartesianA" VALUES(3);

--insert into "cartesianB" VALUES(1);
--insert into "cartesianB" VALUES(2);

select* from "cartesianA"
cross join "cartesianB";
--So will be created every possible variation on combination from tab A to tabB

/*
2. Full Outer Join:
Return results from both whether they match or not
*/
--create table "cartesianA" (id INT);
--create table "cartesianB" (id INT);

--once the tables were created we want to insert data in them
--insert into "cartesianA" VALUES(1);
--insert into "cartesianA" VALUES(2);
--insert into "cartesianA" VALUES(3);

--insert into "cartesianB" VALUES(1);
--insert into "cartesianB" VALUES(2);

select* from "cartesianA" as a
full join "cartesianB" as b on a.id=b.id;

--In this case 3d number will be as NULL, as 2d tab only has 2 numbers"
--so all data will be returned despite the fact if they match a.id=b.id;

