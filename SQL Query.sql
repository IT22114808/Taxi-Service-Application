CREATE table Admin(
A_Id int(10) Not Null,
A_name varchar(50),
Post varchar (30),
CONSTRAINT Admin_Pk PRIMARY KEY(A_Id));

CREATE table Account(
Acc_Id int(10) Not Null,
username varchar(50),
password varchar(50),
Acc_Type varchar(50),
A_Id int (10),
CONSTRAINT Account_PK PRIMARY KEY (Acc_Id),
CONSTRAINT Account_Admin_FK FOREIGN KEY (A_Id) REFERENCES Admin(A_Id));

CREATE table Driver(
D_Id int(10) Not Null,
D_name  varchar(50),
A_Id int(10),
CONSTRAINT Driver_Pk PRIMARY KEY(D_Id),
CONSTRAINT Driver_Admin_Fk  FOREIGN KEY (A_Id) REFERENCES Admin(A_Id));

CREATE table Driver_TP(
D_Id int(10)  Not Null,
D_Tp char(15) NOt Null,
CONSTRAINT Driver_TP_Pk PRIMARY KEY (D_Id,D_Tp),
CONSTRAINT Driver_Driver_TP_FK FOREIGN KEY (D_Id) REFERENCES Driver (D_Id));
 
CREATE table Vehicle(
V_Id int(10) Not Null,
V_Type char(10),
A_Id int(10),
D_Id int(10),
CONSTRAINT Vehicle_PK PRIMARY KEY (V_Id),
CONSTRAINT Vehicle_Admin_FK FOREIGN KEY (A_Id) REFERENCES Admin(A_Id),
CONSTRAINT Vehicle_Driver_FK FOREIGN KEY (D_Id) REFERENCES Driver(D_Id));

CREATE table Member(
M_Id int(10) Not Null,
Firstname varchar(50),
Lastname varchar(50),
M_dob date,
M_email varchar(50),
A_Id int(10),
Acc_Id int(10),
CONSTRAINT Member_PK PRIMARY KEY (M_Id),
CONSTRAINT Member_Account_FK FOREIGN KEY (Acc_Id) REFERENCES Account(Acc_Id),
CONSTRAINT Member_Admin_FK FOREIGN KEY (A_Id) REFERENCES Admin(A_Id));

CREATE table Member_TP(
M_Id int(10)  Not Null,
M_Tp char(15) NOt Null,
CONSTRAINT Member_TP_Pk PRIMARY KEY (M_Id,M_Tp),
CONSTRAINT Member_Member_TP_FK FOREIGN KEY (M_Id) REFERENCES Member (M_Id));

CREATE table Review(
R_Id int(10) Not Null,
Ratting varchar(500),
M_Id int(10),
CONSTRAINT Review_PK PRIMARY KEY (R_Id),
CONSTRAINT Review_Member_FK FOREIGN KEY (M_Id) REFERENCES Member(M_Id));

CREATE table Booking(
B_Id int(10) Not Null,
Start varchar(50),
Destination varchar(50),
Date date,
Time time(6),
CONSTRAINT Booking_PK PRIMARY KEY (B_Id));

CREATE table Payment(
P_Id int(10) Not Null,
A_Id int(10) Not Null,
B_Id int(10) Not Null,
P_Type char(10),
Amount float,
CONSTRAINT Payment_PK PRIMARY KEY (P_Id,A_Id,B_Id),
CONSTRAINT Payment_Admin_FK FOREIGN KEY (A_Id) REFERENCES Admin(A_Id),
CONSTRAINT Payment_Booking_FK FOREIGN KEY (B_Id) REFERENCES Booking(B_Id));

CREATE table Handle(
B_Id int(10) Not Null,
A_Id int(10) Not NUll,
CONSTRAINT Handle_PK PRIMARY KEY (B_Id,A_Id),
CONSTRAINT Handle_Booking_FK FOREIGN KEY (B_Id) REFERENCES Booking (B_Id),
CONSTRAINT Handle_Admin_FK FOREIGN KEY (A_Id) REFERENCES Admin(A_Id));

CREATE table View_V (
V_Id int(10) Not Null,
M_Id int(10) Not Null,
CONSTRAINT View_V_PK PRIMARY KEY (V_Id,M_Id),
CONSTRAINT View_V_Member_FK FOREIGN KEY (M_Id) REFERENCES Member(M_Id),
CONSTRAINT View_V_Vehicle_FK FOREIGN KEY (V_Id) REFERENCES Vehicle(V_Id));

CREATE table Make(
M_Id int(10) Not Null,
B_Id int(10) Not Null,
CONSTRAINT Make_PK PRIMARY KEY (B_Id,M_Id),
CONSTRAINT Make_Member_FK FOREIGN KEY (M_Id) REFERENCES Member(M_Id),
CONSTRAINT Make_Booking_FK FOREIGN KEY (B_Id) REFERENCES Booking(B_Id));

CREATE table Have(
D_Id int(10) Not Null,
M_Id int(10) Not Null,
CONSTRAINT Have_PK PRIMARY KEY (D_Id,M_Id),
CONSTRAINT Have_Member_FK FOREIGN KEY (M_Id) REFERENCES Member(M_Id),
CONSTRAINT Have_Driver_FK FOREIGN KEY (D_Id) REFERENCES Driver(D_Id));

INSERT INTO Admin(A_Id,A_name,Post)
VALUES('001','K.A.L Samarakoon','Vehicle'),
	   ('002','P.G Jayasundara','Member'),
	   ('003','T.C.L Balasooriya','Driver'),
	   ('004','D.M.P Nanayakkara','Booking'),
	   ('005','W.B.C Siriwardena','Payment'),
	   ('006','A.M Jayalath','Account');

INSERT INTO Account(Acc_Id,username,password,Acc_Type,A_Id)
VALUES('001' ,  'adminsamarakoon@gmail.com','V#Admin@123','Admin','006'),
	  ('002' ,  'adminjayasundara@gmail.com','M#Admin@123','Admin','006'),
	  ('003' ,  'adminbalasooriya@gmail.com','D#Admin@123','Admin','006'),
	  ('004' ,  'adminnanayakkara@gmail.com','B#Admin@123','Admin','006'),
	  ('005' ,  'adminsiriwardena@gmail.com','P#Admin@123','Admin','006'),
	  ('006' ,  'adminjayalath@gmail.com','A#Admin@123','Admin','006'),
	  ('007' ,  'sulakshana324@gmail.com','Sula@324','Member','006'),
	  ('008' ,  'jayasekara56@gmail.com','Kavija@56','Member','006'),
      ('009' ,  'buddhimavilochana@gmail.com','Buddhima@314','Member','006'),
	  ('010' ,  'danuddikajayasundara@gmail.com','Danu@6821','Member','006'),
	  ('011' ,   'himashihasara718@gmail.com','Himashi@718','Member','006'),
	  ('012' ,   'chamathbasnayaka@gmail.com','Chamath@319','Member','006'),
	  ('013' ,  'tharushikajayasundara@gmail.com','Tharu@2002','Member','006'),
	  ('014' ,  'naeeshasilva@gmail.com','Nadee@73','Member','006'),
	  ('015' ,   'vinukadinethmin07@gmail.com','Vinuka@310','Member','006'),
	  ('016' ,   'rithmajayasundara97@gmail.com','Rithma@103','Member','006'),
      ('017' ,   'dularinisansala01@gmail.com','dulari@01','driver','006'),
      ('018' ,   'primalfernando02@gmail.com','primal@02','driver','006'),
      ('019' ,   'ridmihansini99@gmail.com','ridmi@99','Customer Care','006'),
      ('020' ,	 'malshansameera01@gmail.com','Malshan@01','Customer Care','006');
	  

INSERT INTO Member(M_Id,Firstname,Lastname,M_dob,M_email,Acc_Id,A_Id)
VALUES ('001','Sulakshana',' K.R.K','1989-03-24','sulakshana324@gmail.com','007','002'),
	   ('002','Jayasekara',' K .A','998-05-06','jayasekara56@gmail.com','008','002'),
	   ('003', 'A.G Buddhima ','Vilochana','1979-03-14','buddhimavilochana@gmail.com','009','002'),
	   ('004 ','D.H','Jayasundara',	'1980-08-20','danuddikajayasundara@gmail.com','010','002'),
	   ('005', 'M.A ','Himashi Hasara','2000-07-18','himashihasara718@gmail.com'	,'011' ,'002'),
	   ('006 ','C.I ','Basnayaka',	'2001-09-17	','chamathbasnayaka@gmail.com'	,'012','002'),
	   ('007' ,'T.G ','Jayasundara','2002-03-21','tharushikajayasundara@gmail.com	','013','002'),
	   ('008', 'C.N.D ','Silva','1973-08-26','naeeshasilva@gmail.com','014','002'),
	   ('009','R.K.V ','Dinethmin','2002-03-10','vinukadinethmin07@gmail.com','015','002'),
	   ('010','R.A ','Jayasundara','1997-10-03','rithmajayasundara97@gmail.com','016','002');


INSERT INTO Member_TP(M_Id,M_Tp)
VALUES('001', '0740069794'),
		('002','0764863058'),
		('003','0765831021'),
		('004','0726938643'),
		('005','0713932422'),
		('006','0784569632'),
		('007','0701537351'),
		('008','0714445516'),
		('008','0716570251'),
		('009','0760772370'),
		('010','0714578963');
	   

INSERT INTO Driver(D_ID,D_Name,A_Id)
VALUES ('001' ,'Sunil Siriwardena','003'),
	   ('002', 'Kamal Perera','003'),
	   ('003', 'Piyal Silva','003' ),
	   ('004','Rahul Sigera','003'),
	   ('005', 'Dineth Kannangara','003'),
	   ('006' , 'Praveen Egodage','003'),
	   ('007' , 'Lavan Perise','003'),
	   ('008' , 'Pramod Iddagoda','003');


INSERT INTO Driver_TP(D_Id,D_Tp)
VALUES ('001','0714445487'),
	   ('002',	'0785670215'),
	   ('003','0721896247'),
	   ('004','0704789632'),
	   ('004','0752589632'),
	   ('005',	'0712589632'),
	   ('006','0771478945'),
	   ('007',	'0723215864'),
	   ('007','0784513622'),
	   ('008','0701248732');

INSERT INTO Vehicle (V_Id,V_Type,D_Id,A_Id)
VALUES 	('001','car','001','001'),
		('002','van','008','001'),
		('003','van','007','001'),
		('004','car','003','001'),
		('005','ThreeWeel','001','001'),
		('006','ThreeWeel','006','001'),
		('007','car','002','001'),
		('008','van','007','001'),
		('009','car','004','001'),
		('010','ThreeWeel','005','001'),
		('011','car','007','001'),
		('012','van','008','001'),
		('013','van','006','001'),
		('014','car','004','001'),
		('015','car','005','001'),
		('016','car','007','001'),
		('017','ThreeWeel','002','001'),
		('018','ThreeWeel','005','001'),
		('019','van','006','001'),
		('020','car','003','001');


INSERT INTO Review(R_Id,Ratting,M_Id)
VALUES('001','The transport system website saved me time and stress with its user-friendly interface.','009'),
	  ('002','Convenient and cost-effective, a must-have tool for every traveler.','003'),
	  ('003','The transport system website exceeded my expectations, providing a smooth journey from start to finish.','008'),
	  ('004','With the transport system website, getting around has never been easier or more enjoyable!','004'),
	  ('005', 'Effortless booking process and excellent customer support, making travel planning a joy.','006');




INSERT INTO Booking(B_Id,Start,Destination,Date,Time)
VALUES('001', 'Moratuwa','Panadura','2023-04-09','08:30:00' ),
	  ('002', 'Malabe','Nugegoda','2023-04-12','10:00:00'),
	  ('003', 'Kottawa','Dehiwla',	'2023-04-15','13:00:00'),
	  ('004', 'Nugegoda','Kaduwala','2023-04-23','09:00:00'),
	  ('005', 'Kaluthara','Maharagama','2023-05-07','15:00:00'),
	  ('006', 'Dehiwala','Malabe','2023-05-14','10:45:00'),
	  ('007', 'Maharagama','Baththaramilla','2023-05-20','16:20:00'),
	  ('008', 'Rathmalana','Panadura','2023-05-23','11:10:00');



INSERT INTO Payment(P_Id,A_Id,P_Type,Amount,B_Id)
VALUES('001','005','Cash', 900,'001' ),
	  ('002','005', 'Card', 1000,'003'),
	  ('003','005', 'Cash', 1100,'002 '),
	  ('004','005', 'Card', 650,'007'),
	  ('005','005', 'Card', 1500 ,'005');


INSERT INTO Handle(B_Id,A_Id)
VALUES('001','004'),
	  ('002','004'),
	  ('003','004'),
	  ('004','004'),
	  ('005','004'),
	  ('006','004'),
	  ('007','004'),
	  ('008','004');

INSERT INTO View_V(V_Id,M_Id)
VALUES('001','001'),
	   ('002','003'),
	   ('005','001'),
	   ('008','004'),
	   ('012','009'),
	   ('018','010');


INSERT INTO Have(D_Id,M_Id)
VALUES ('001','002'),
	   ('004','003'),
	   ('005','004'),
	   ('007','009'),
	   ('008','010');


INSERT INTO Make(B_Id,M_Id)
VALUES ('001','002'),
	   ('004','003'),
	   ('005','004'),
	   ('007','009'),
	   ('008','010');
