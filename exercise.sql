
create table Programmer (name varchar(8) not null,
dob date not null,doj date not null,
sex varchar(1) not null,prof1 varchar(8),prof2 varchar(8),
salary int(4) not null );

insert into programmer values('somdutt','1966-04-21','1992-04-21','M','pascal','basic',3200);
insert into programmer values('devdutt','1986-01-11','1992-06-21','M','pascal','cobol',3200);
insert into programmer values('Ramesh','1986-03-21','1992-05-21','M','C','basic',4500);
insert into programmer values('Shradha','1956-01-21','1972-05-21','F','clipper','basic',3000);
insert into programmer values('Jyoti','1986-04-26','1982-05-21','F','dbase','cobol',3000);

select * from Programmer;

create table Software(name varchar(8) not null,
title varchar(20) not null,
Dev_in varchar(8) not null,
Scost float(7,2), Dcost int(5),Sold int(3) );

insert into Software values('somdutt','parachutes','basic',399.95,6000,14);
insert into Software values('Devdutt','parachute2','pascal',499.95,6500,53);
insert into Software values('Ramesh','parachute3','C',599.95,7000,63);
insert into Software values('Shradha','parachute4','basic',349.95,6300,15);
insert into Software values('Jyoti','parachute5','dbase',465.95,4600,56);

select * from software;

create table Studies(name varchar(8) not null,
splace varchar(9) not null,
course varchar(5) not null, ccost varchar(5) not null);

insert into studies values('somdutt','sabhari','pgdca',4500);
insert into studies values('devdutt','bdps','dcs',5000);
insert into studies values('Ramesh','pragathi','dcs',6500);
insert into studies values('Shradha','sabhari','dcs',3500);
insert into studies values('Jyoti','bdps','pgdca',5200);


select * from studies;
set sql_safe_updates=0;

/*1.selling cost avverage for package developed in pascal*/
select avg(Scost) from software where dev_in='pascal';

/*2.display name and ages of all programmer */
select name ,(year(current_date())-year(dob))as age from programmer;

/*3.display name and ages of all programmer undergone dcs course */
select name ,(year(current_date())-year(dob))as age from programmer 
where name in (select name from studies where course='dcs');

/*4. highest number of copies sold by a package*/
select title from software 
where sold= (select max(sold) from software);

/*5. name and dob of programmer born in january*/
select name ,dob from programmer
where month(dob)=1;

/*6. display lowest course fee*/
select min(ccost) as lowes_course_fee from Studies;

/*7.How many programmers have done pgdca course*/
select count(*) from programmer 
where name in  (select name from studies where course='pgdca');

/*8. how much revenue has bbeen earned through sales of package of c*/
Select dev_IN,(scost*sold)-dcost AS REVENUE FROM SOFTWARE where dev_in='c';

/*9. display details of software developed by ramesh*/
select * from software where name ='Ramesh';

/*10. how many programmers studied at sabhari*/
select* from studies where splace='sabhari';

/*11. display details of the packages whose sale crosses 20000 mark*/
Select *,(scost*sold) as totalsales FROM SOFTWARE where scost*sold>20000;

/*12. find out the numbers of copies to be sold for package inorder to recover dcost*/
select *,round(dcost/scost) as Minimum_to_be_sold from software;

/*13.what is the price of costliest software developed in basic*/
select title,scost from software 
where scost=(select max(scost) from software where dev_in='basic');

/*14. Display details of package for which dcost is recovered*/
select *,round(dcost/scost) as Minimum_to_be_sold from software 
group by title having sold>round(dcost/scost);

/*15. how many packages were developed in dbase*/
select count(dev_in) as No_Of_dbase_packages from software 
where dev_in='dbase';

/*16.how many programmers studied at pragathi*/
select count(*) from programmer
where name in (select name from studies where splace = 'pragathi');

/*17. how many programmers paid 5000 to 10000 for course*/
select count(*) from programmer
where name in (select name from studies where ccost between 5000 and 10000);

/*18. average course fee*/
select course,avg(ccost) as averagefee from studies
group by course;

/*19. details of programmer knowing c*/
select * from programmer where prof1='c' or prof2='c';

/*20. how many programmer know eithr cobol or pascal*/
select * from programmer 
where prof1 in ('cobol','pascal') or prof2 in ('cobol','pascal');

/*21. how many programmer dont  know eithr c and pascal*/
select * from programmer 
where prof1 not in ('c','pascal') and prof2 not in ('c','pascal');

/*22.how old is the oldest male programmer*/
select name ,(year(current_date())-year(dob))as age from programmer
where year(dob) = (select min(year(dob)) from programmer where sex='M') ;

/*23. what is the average age of female programmer*/
select avg(year(current_date())-year(dob))as Average_age from programmer
where sex='F';

/*24. calculate experience in year for each programmer , display with names in descc order*/
select name, (year(current_date())-year(doj))as Experience from programmer
order by Experience;

/*25. programmers who celebrate birthday in current month*/
select name ,dob from programmer
where month(dob) = month(current_date()) ;

/*26. how many female programmer are there*/
select count(*) from Programmer where sex='F';

/*27. what are the languages known by male */
select  count(distinct prof1)+count(distinct prof2) as M_known_lang 
from Programmer where sex='M';

/*28. average salary*/
select avg(salary) as average_salary from programmer;

/*29.how many people draw 2000 to 4000*/
select count(*) from programmer 
where salary between 2000 and 4000;

/*30. display details of thos who dont know clipper cobol or pascal*/
select * from programmer  where prof1 not in('clipper','pascal','cobol') 
and prof2 not in('clipper','pascal','cobol');

select * from Programmer;
select * from software;
select * from studies;

