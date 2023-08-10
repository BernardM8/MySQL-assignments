create schema if not exists Bellevue_College;
use Bellevue_College;

create table if not exists Faculty_Advisor
(
Bellevue_College_ID_number int not null primary key,
email_address varchar(45) not null,
last_name varchar(45),
first_name varchar(45),
department varchar(45),
office_building_name varchar(45),
office_building_room_num varchar(45),
office_number varchar(45)
);

create table if not exists Mentors
(
Mentors_email_address varchar(45) not null,
last_name varchar(45),
first_name varchar(45),
company_name varchar(45),
Mentors_company_address varchar(45) not null,
company_city varchar(45),
company_state varchar(45),
company_ZIP_code varchar(45),
Mentors_company_phone_number varchar(45) not null,
Faculty_Advisor_College_ID_number int not null,
date_Advisor_assigned_work varchar(45),
date_Advisor_assignment_work_ended varchar(45),
primary key (Mentors_email_address, Mentors_company_address, Mentors_company_phone_number),
foreign key (Faculty_Advisor_College_ID_number) references Faculty_Advisor(Bellevue_College_ID_number)
on delete cascade on update cascade
);

ALTER TABLE Mentors ADD INDEX Mentors_company_address_idx (Mentors_company_address);
ALTER TABLE Mentors ADD INDEX Mentors_company_phone_number_idx (Mentors_company_phone_number);

create table if not exists Alumnus
(
Bellevue_College_ID_number int not null primary key,
email_address varchar(45) not null,
last_name varchar(45),
first_name varchar(45),
home_address varchar(45),
home_city varchar(45),
home_state varchar(45),
home_ZIP_code varchar(45),
phone_number varchar(45),
Mentors_email_address varchar(45) not null,
Mentors_company_address varchar(45) not null,
Mentors_company_phone_number varchar(45) not null,
foreign key (Mentors_email_address) references Mentors(Mentors_email_address)
on delete cascade on update cascade,
foreign key (Mentors_company_address) references Mentors(Mentors_company_address)
on delete cascade on update cascade,
foreign key (Mentors_company_phone_number) references Mentors(Mentors_company_phone_number)
on delete cascade on update cascade
);

create table if not exists Student
(
Bellevue_College_ID_number int not null primary key,
email_address varchar(45) not null,
last_name varchar(45),
first_name varchar(45),
dorm_name varchar(45),
dorm_room_number varchar(45),
offcampus_address varchar(45),
date_of_enrollment varchar(45),
date_of_graduation varchar(45),
degree_recieved varchar(45),
Faculty_college_ID_number int not null,
Mentors_email_address varchar(45),
Mentors_company_address varchar(45),
Mentors_company_phone_number varchar(45),
date_Advisor_assigned varchar(45),
date_Advisor_assignment_ended varchar(45),
date_Mentor_assigned varchar(45),
date_Mentor_assignment_ended varchar(45),
foreign key (Faculty_college_ID_number) references Faculty_Advisor(Bellevue_College_ID_number)
on delete cascade on update cascade,
foreign key (Mentors_email_address) references Mentors(Mentors_email_address)
on delete cascade on update cascade,
foreign key (Mentors_company_address) references Mentors(Mentors_company_address)
on delete cascade on update cascade,
foreign key (Mentors_company_phone_number) references Mentors(Mentors_company_phone_number)
on delete cascade on update cascade,
foreign key (Bellevue_College_ID_number) references Alumnus(Bellevue_College_ID_number)
on delete cascade on update cascade
);


drop table Student cascade;
drop table Alumnus cascade;
drop table Mentors cascade;
drop table Faculty_Advisor cascade;
drop schema Bellevue_College;
