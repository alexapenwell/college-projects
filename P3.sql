Insert into Client values (123456789, 'Ben', 'Husul', 9193724859, '126 Mable Street Cary NC 27513');
Insert into Client values (284937568, 'Cat', 'Powers', 7169035478, '534 Tailgate Circle Chapel Hill NC 27514');
Insert into Client values (683400289, 'Bria', 'Buchanan', 9847358800, '16 Ocean Avenue, New York NY 10001');
Insert into Client values (834659702, 'Chris', 'Husul', 8456792015, '4412 East Becker Road Collins NY 14034');

Insert into Contractor values (345869025, 'Michael', 'Henry', 9230571123, 'michael.henry@gmail.com', 'Flooring', 'Available MWF; Not Available:TTHSS');
Insert into Contractor values (830009758, 'John', 'Maurer', 5038847596, 'john.maurer@gmail.com', 'Painting', 'Available all weekdays');
Insert into Contractor values (807359024, 'Melissa', 'Kowae', 5823647085, 'melissa.kowae@gmail.com', 'Plumbing', 'Available only on weekends');
Insert into Contractor values (302576982, 'Raina', 'Powell', 7368205424, 'raina.powell@gmail.com', 'General Construction', 'Always available');

Insert into Designer values (730229591, 'Taylor', 'Penwell', 9194857624);
Insert into	Designer values (740589678, 'Kimberly', 'Alexander', 7158347989);
Insert into Designer values (562800279, 'Ryan', 'Bullock', 8029537845);

Insert into Job values (859670243, 123456789, 730229591, 'remodel kitchen', '126 Mable Street Cary NC 27513', 'Approved', 05122019, 05152019, 05142019, 05172019, 11650, 10000);
Insert into Job values (683452071, 123456789, 730229591, 'upgrade master bathroom', '126 Mable Street Cary NC 27513', 'Awaiting Approval', 11182020, null, 11302020, null, 5000, null);
Insert into Job values (111122223, 284937568, 740589678, 'build deck', '534 Tailgate Circle Chapel Hill NC 27514', 'Approved', 08252020, 08252020, 09012020, 09012020, 7500, 8000);
Insert into Job values (777586458, 683400289, 562800279, 'remodel floors', '16 Ocean Avenue, New York NY 10001', 'Approved', 01212020, 01222020, 02022020, 02022020, 12000, 15000);

Insert into Task values (987654321, 859670243, 'replace countertops');
Insert into Task values (134679852, 859670243, 'paint walls');
Insert into Task values (306972841, 859670243, 'upgrade appliances');
Insert into Task values (857621095, 683452071, 'paint walls');
Insert into Task values (302165323, 683452071, 'fix plumbing');
Insert into Task values (999998786, 111122223, 'construct deck');
Insert into Task values (333546257, 111122223, 'paint deck');
Insert into Task values (455566552, 777586458, 'rip up old floors');
Insert into Task values (114488756, 777586458, 'put in new floors');

Insert into works values (302576982, 859670243);
Insert into works values (830009758, 859670243);
Insert into works values (830009758, 683452071);
Insert into works values (807359024, 683452071);
Insert into works values (302576982, 111122223);
Insert into works values (830009758, 111122223);
Insert into works values (345869025, 777586458);

Insert into Inspection values (653786888, 111122223, 'inspect deck', 09012020);
Insert into Inspection values (333335788, 859670243, 'check appliances', 05172019);
Insert into Inspection values (669880212, 777586458, 'check floors', 02022020);

Insert into IDate values (653786888, 09012020);
Insert into IDate values (333335788, 05172019);
Insert into IDate values (669880212, 02022020);

## Questions

Select count(C_ID)
From Job, Designer
Where Designer.D_ID = Job.D_ID AND Designer.DFname = "Ryan" AND Designer.DLname = "Bullock";

Select avg(Task_Average) As AverageNumberTasks FROM 
(Select count(T_ID) as Task_Average
FROM Task
Group by J_ID);

Select Job.J_ID, CFname, CLname, CPhone
From Job inner join Client on Job.C_ID = Client.C_ID
Where Approval_Status = "Awaiting Approval";

Select IDate
From Job inner join Inspection on Job.J_ID = Inspection.J_ID
inner join IDate on Inspection.I_ID = IDate.I_ID
Where Location = '16 Ocean Avenue, New York NY 10001';

Select DFname, DLname, Designer.D_ID
From Client inner join Job on Client.C_ID = Job.C_ID
inner join Designer on Job.D_ID = Designer.D_ID
Where Client.CFname = "Cat" AND Client.CLname = "Powers";

Select Distinct CoFname, CoLname
From Contractor inner join works on Contractor.Co_ID = works.Co_ID
inner join Job on works.J_ID = Job.J_ID
inner join Designer on Job.D_ID = Designer.D_ID
Where DFname = "Taylor" AND DLname = "Penwell"
UNION
Select Distinct CoFname, CoLname
From Contractor inner join works on Contractor.Co_ID = works.Co_ID
inner join Job on works.J_ID = Job.J_ID
inner join Designer on Job.D_ID = Designer.D_ID
Where DFname = "Ryan" AND DLname = "Bullock";

Select sum(Acost)
From Job;

Select CoFname, CoLname, CoPhone, WorkType, Schedule
From Job inner join works on Job.J_ID = works.J_ID
inner join Contractor on works.Co_ID = Contractor.Co_ID
where Job.J_ID = "777586458";

Select DFname, DLname, count(j_ID)
From Designer inner join Job on Designer.D_ID = Job.D_ID
Group by Designer.D_ID
Having count(Job.J_ID) >=1
Order by count(Job.J_ID) DESC;

Select ECompletedDate, ACompletedDate
From Job inner join Designer on Job.D_ID = Designer.D_ID
where DFname = "Kimberly" AND DLname = "Alexander";

Select  CFname as FirstName, CLname as LastName
From Job inner join Client on Job.C_ID = Client.C_ID
where Job.J_ID = "859670243"
UNION
Select DFname, DLname
From Job inner join Designer on Job.D_ID = Designer.D_ID
where Job.J_ID = "859670243"
UNION
Select CoFname, CoLname
From Job inner join works on Job.J_ID = works.J_ID
inner join Contractor on works.Co_ID = Contractor.Co_ID
where Job.J_ID = "859670243";

Select CFname, CLname, CPhone, Description, ECost, ECompletedDate
From Job inner join Designer on Job.D_ID = Designer.D_ID
inner join Client on Job.C_ID = Client.C_ID
where DFname = "Taylor" AND DLname = "Penwell" AND ACompletedDate IS  NULL;

Select CAST(ECost AS INT) as EstimatedCost, CAST(ACost as INT) as ActualCost, ECost - ACost as Difference
From Job
where ACompletedDate is NOT NULL;

Select max(CAST(ACost AS INT) )as ActualCost
From Job
where ACompletedDate is NOT NULL
UNION
Select min(CAST(ACost AS INT) )as ActualCost
From Job
where ACompletedDate is NOT NULL;

Select J_ID, Description, CFname, CLname
From Job inner join Client on Job.C_ID = Client.C_ID
Where ACompletedDate is NOT NULL
EXCEPT
Select J_ID, Description, CFname, CLname
From Job inner join Client on Job.C_ID = Client.C_ID
Where CFname = "Bria" AND CLname = "Buchanan";