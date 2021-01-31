Create table Contractor
(Co_ID char(9) NOT NULL,
CoFname varchar(15) NOT NULL,
CoLname varchar(15) NOT NULL,
CoPhone varchar(12) NOT NULL,
CoEmail varchar(35) NOT NULL,
WorkType varchar(20) NOT NULL,
Schedule varchar(35) NOT NULL,
Primary Key (Co_ID));

Create table Designer
(D_ID char(9) NOT NULL,
DFname varchar(15) NOT NULL,
DLname varchar(15) NOT NULL,
DPhone varchar(15) NOT NULL,
Primary Key (D_ID));

Create table Client
(C_ID char(9) NOT NULL,
CFname varchar(15) NOT NULL,
CLname varchar(15) NOT NULL,
CPhone varchar(15) NOT NULL,
Address varchar(35) NOT NULL,
Primary Key (C_ID));

Create table Job
(J_ID char(9) NOT NULL,
C_ID char(9) NOT NULL,
D_ID char(9) NOT NULL,
Description varchar(30) NOT NULL,
Location varchar(30) NOT NULL,
Approval_Status varchar(17) NOT NULL,
EStartDate char(8) NOT NULL,
AStartDate char(8),
ECompletedDate char(8) NOT NULL,
ACompletedDate char(8),
ECost varchar(9) NOT NULL,
ACost varchar(9),
Primary Key (J_ID),
Foreign Key (C_ID) references Client(C_ID),
Foreign key (D_ID) references Designer(D_ID));

Create table Inspection
(I_ID char(9) NOT NULL,
J_ID char(9) NOT NULL,
IType varchar(20) NOT NULL,
Approval_Date char(8),
Primary key (I_ID),
Foreign key (J_ID) references Job(J_ID));

Create table IDate
(I_ID char(9) NOT NULL,
IDate char(8),
Primary key (I_ID, IDate),
Foreign key (I_ID) references Inspection(I_ID));

Create table Task
(T_ID char(9) NOT NULL,
J_ID char(9) NOT NULL,
T_Desc varchar(30) NOT NULL,
Primary key (T_ID),
Foreign key (J_ID) references Job(J_ID));

Create table works
(Co_ID char(9) NOT NULL,
J_ID char(9) NOT NULL,
Primary key (Co_ID, J_ID),
Foreign key (Co_ID) references Contractor(Co_ID),
Foreign key (J_ID) references Job(J_ID));
