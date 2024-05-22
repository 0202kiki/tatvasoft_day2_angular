--Country table
create table Country(CountryId int Primary Key,
	CountryName varchar(100)
	);
insert into Country(CountryId,CountryName)values
(1,'India'),(2,'USA');

select * from Country;

update Country
set CountryName='United States'
where CountryId=1;

update Country
set CountryName='Canada'
where CountryId=2;

--City table
create table City(CityId int Primary Key,
	CountryId int, 
	CityName varchar(100),
	Foreign key (CountryId) references Country(CountryId)
	);
insert into City(CityId,CountryId,CityName)values
(1,1,'Los Angeles'),
(2,1,'New York'),
(3,2,'Toranto');

select * from City;

-- User table
create table "User"(UserId int Primary Key,
	FirstName varchar(100),
	LastName varchar(100),
	PhoneNumber varchar(100),
	EmailAddress varchar(100),
	UserType varchar(100),
	"Password" varchar (100)
	);

insert into "User"(UserId,FirstName, LastName,PhoneNumber,EmailAddress,UserType,"Password")values
	(1,'kirthika','mudaliar',2349382719,'kirthi2@gmail.com','kirthi','secure123'),
(2,'swathi','patel',9349354319,'swathipatel@gmail.com','swathip','password123');

select * from "User";

update "User"
set UserType='Volunteer'
where UserId=2;

update "User"
set UserType='Volunteer'
where UserId=1;

--UserDetail
create table UserDetail(UserDetailId int Primary Key,
	UserId int,
	"Name" varchar(100),
	Surname varchar(100),
	EmployeeId varchar(100),
	Manager varchar(100),
	Title varchar(100),
	Department varchar(100),
	MyProfile varchar(100),
	WhyIVolunteer varchar(100),
	CountryId int,
	CityId int,
	Availiability varchar(100),
	LinkdInUrl varchar(100),
	MySkills varchar(100),
	UserImage varchar(100),
	Status boolean,
	Foreign key (CountryId) references Country(CountryId),
	Foreign key (CityId) references City(CityId),
	Foreign key (UserId) references "User"(UserId)
	);
insert into UserDetail(UserDetailId,UserId,"Name",Surname,EmployeeId,Manager,Title,Department,MyProfile,WhyIVolunteer,CountryId,CityId,Availiability,LinkdInUrl,MySkills,UserImage,Status)values
	(1,1,'kirthika','mudaliar','EMP001','swathi patel','Software Engineer','IT','Passionate about technology and helping others.', 'I volunteer to give back to the community.',1,1,'Weekends','https://linkdin.com/kirthi.mudaliar','Problem solving','kirthika_mudaliar.jpg',true);

select * from UserDetail;

--UserSkills table
create table UserSkills(
	UserSkillsId int Primary Key,
	Skill varchar(100),
	UserId int,
	Foreign key (UserId) references "User"(UserId)
);

insert into UserSkills(UserSkillsId,Skill,UserId)values
	(1,'Problem solving', 1);

select * from UserSkills;

--MissionApplivcation
create table MissionApplication(
	MissionApplicationId int Primary key,
	MissionId int,
	UserId int,
	AppliedDate timestamp,
	Status boolean,
	Sheet int
);
insert into MissionApplication(MissionApplicationId,MissionId,UserId,AppliedDate,Status,Sheet)values
(1,1,1,'2023-05-15 10:30:00',true,1),
(2,2,2,'2023-05-18 14:45:00',false,2);

select * from MissionApplication;

--Missions table
create table Missions(
	MissionsId int Primary key,
	MissionTitle varchar(100),
	MissionDescription varchar(100),
	MissionOrganisationName varchar(100),
	MissionOrganisationDetail varchar(100),
	CountryId int,
	CityId int,
	StartDate date,
	EndDate date,
	MissionType varchar(100),
	TotalSheets int,
	RegistrationDeadLine date,
	MissionThemeId varchar(100),
	MissionSkillId varchar(100),
	MissionImages varchar(100),
	MissionDocuments varchar(100),
	MissionAvailiability varchar(100),
	MissionVideoUrl varchar(100),
	Foreign key (CountryId) references Country(CountryId),
	Foreign key (CityId) references City(CityId)
	);
insert into Missions(MissionsId,MissionTitle,MissionDescription,MissionOrganisationName,MissionOrganisationDetail,CountryId,CityId,StartDate,EndDate,MissionType,TotalSheets,RegistrationDeadLine,MissionThemeId,MissionSkillId,MissionImages,MissionDocuments,MissionAvailiability,MissionVideoUrl)values
    (1, 'Beach Cleanup', 'Help clean up the local beach', 'Ocean Conservancy', 'Non-profit organization focused on ocean conservation', 1, 1, '2023-06-01', '2023-06-15', 'Environmental', 10, '2023-05-25', '1', '1', 'beach_cleanup.jpg', 'cleanup_guidelines.pdf', 'Weekends', 'https://example.com/beach_cleanup');

select * from Missions;
--MissionSkill
create table MissionSkill(
	MissionSkillId int Primary key,
	SkillName varchar(100),
	Status varchar(100)
);

insert into MissionSkill(MissionSkillId,SkillName,Status)values
(1,'Physical Labor','Active'),
(2,'Environmental Awareness','Active');

select * from MissionSkill;

--MissionTheme table
create table MissionTheme(
	MissionThemeId int Primary key,
	ThemeName varchar(100),
	Status varchar(100)
);

insert into MissionTheme(MissionThemeId,ThemeName,Status)values
(1,'Clean Water','Active'),
(2,'Green World','Active');

select * from MissionTheme;