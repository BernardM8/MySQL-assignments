create schema if not exists Allstar_Team; 
use Allstar_Team; 

create table if not exists Coach( 
ssn int not null primary key, 
coach_name varchar(45), 
address varchar(45), 
birth_date date, 
uni_name varchar(45), 
uni_coach_years int, 
total_coach_years int, 
championships int, 
times_at_semis int 
); 
 
create table if not exists Assistant_coach( 
ssn int not null primary key, 
assist_name varchar(45), 
address varchar(45), 
birth_date date, 
uni_name varchar(45), 
uni_assist_years int, 
total_assist_years int, 
specialization varchar(45) 
); 

create table if not exists Players( 
ssn int not null primary key, 
player_name varchar(45), 
address varchar(45), 
birth_date date,
uni_name varchar(45),
team_years int, 
uni_years int, 
times_allstar int
); 

create table if not exists Championship_teams( 
id_no int not null primary key, 
team_name varchar(45), 
coach_name varchar(45), 
uni_name varchar(45), 
ranking int, 
wins int, 
losses int, 
Coach_ssn int, 
Assist_coach_ssn int, 
foreign key (Coach_ssn) references Coach(ssn) 
on delete cascade, 
foreign key (Assist_coach_ssn) references Assistant_coach(ssn) 
on delete cascade 
); 

 create table if not exists Allstar_team_nominees( 
ssn int not null primary key, 
player_name varchar(45), 
address varchar(45), 
birth_date date, 
position varchar(45), 
uni_name varchar(45), 
team_years int, 
uni_years int, 
times_allstar int, 
Players_ssn int, 
teams_id_no int, 
score int,
foreign key (Players_ssn) references Players(ssn) 
on delete cascade, 
foreign key (teams_id_no) references Championship_teams(id_no) 
on delete cascade 
); 
 
 create table if not exists Allstar_game( 
game_date date not null primary key, 
place varchar(45), 
winning_team varchar(45), 
winning_coach varchar(45), 
winning_players varchar(255), 
score int 
); 
 
 create table if not exists Allstar_game_has_Championship_teams(
 game_date date not null,
 id_no int not null,
 primary key (game_date, id_no),
foreign key (game_date) references Allstar_game(game_date) 
on delete cascade, 
foreign key (id_no) references Championship_teams(id_no) 
on delete cascade 
 );

Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (578261987,'Mike Douglas','12345 SE 51st Compton CA 90151','1972-08-13','USDSU',4,5,0,0);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (948657124,'John Smith','19791 NE 22nd St Seattle WA 98462','1962-09-22','UW',3,5,1,1);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (314569184,'Chris Lange','92785 SE 43rd Ave Missouri MS 67891','1975-01-15','MSU',4,2,0,0);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (915327648,'Sarah Johnson','35733 W 45th CT Dallas TX 23457','2000-12-29','UT',2,5,1,3);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (794853197,'May Jane','73888 E 41st Miami FL 024591','1998-06-25','UM',7,2,0,0);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (129753187,'Kelly Jean','43557 NE Collons ST Newyork NY 23415','1982-03-05','UNY',4,5,1,2);
Insert into Coach (ssn,coach_name,address,birth_date,uni_name,uni_coach_years,total_coach_years,championships,times_at_semis) values (195576321,'Kim Flear','35435 Crenshaw Blvd Denver CO 78162','1992-02-09','UD',3,9,1,1);
select* from Coach;


Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (476280184,'Terry Tank','12345 SE 42nd Blvd Compton CA 90151','1975-08-29','USDSU',3,5,'Athletic Trainer');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (221594876,'Sasha Minx','73547 NE 36th Ave Seattle WA 98462','1972-12-29','UW',3,3,'Quarterback');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (234589182,'Mike Withrow','92702 SE 15th St Missouri MS 67891','1964-05-29','MSU',2,10,'Strength Trainer');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (298476215,'John Manden','43563 E 18th St Dallas TX 23457','1985-11-16','UT',5,12,'Offensive Line');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (398112212,'Mark Thompson','35646 W Collins Blvd Miami FL 024591','1982-01-06','UM',7,8,'Mental and Physical Trainer');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (484941549,'Shawn Cook','98181 E 1st Ave Newyork NY 23415','1999-06-14','UNY',1,6,'Defensive Line');
Insert into Assistant_coach (ssn,assist_name,address,birth_date,uni_name,uni_assist_years,total_assist_years,specialization) values (788134888,'Sarah Mores','75689 N 12th Ct Denver CO 78162','1997-08-20','UD',5,5,'Linebacker');
select* from Assistant_coach;


Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1123,'USDSU Team','Mike Douglas','USDSU',3,8,3,578261987,476280184); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1124,'UW Team','John Smith','UW',7,9,3,948657124,221594876); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1125,'MSU Team','Chris Lange','MSU',6,8,3,314569184,234589182); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1126,'UT Team','Sarah Johnson','UT',1,8,3,915327648,298476215); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1127,'UM Team','May Jane','UM',5,8,3,794853197,398112212); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1128,'UNY Team','Kelly Jean','UNY',4,8,3,129753187,484941549); 
Insert into Championship_teams (id_no,team_name,coach_name,uni_name,ranking,wins,losses,Coach_ssn,Assist_coach_ssn) values (1129,'UD Team','Kim Flear','UD',2,8,3,195576321,788134888);  
select* from Championship_teams;


Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (123456789,'Mike Hunt','54321 SE 32nd Blvd Compton CA 90151','1989-09-29','USDSU',3,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (159481819,'Chris Hunt','15644 NE 12TH AVE Compton CA 90151','1987-08-12','USDSU',2,1,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (338489118,'John Hunt','53787 E Crenshaw Blvd Compton CA 90151','1992-01-09','USDSU',1,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (591538759,'Jeff Hunt','38738 W 6TH Blvd Compton CA 90151','1995-07-25','USDSU',1,0,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (159778632,'Sal Hunt','83736 E 8TH PL Compton CA 90151','1989-12-09','USDSU',5,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (891851561,'Brian Hunt','36673 N 9TH AVE Compton CA 90151','1987-09-18','USDSU',4,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (573792244,'Rob Hunt','34335 W 23RD Blvd Compton CA 90151','1988-09-14','USDSU',6,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (722723739,'Mark Hunt','54354 SE 15TH Blvd Seattle WA 98462','1990-10-06','UW',2,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (287728333,'Shawn Hunt','91106 W 22nd PL Seattle WA 98462','1991-09-30','UW',4,4,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (373554323,'Bruno Hunt','98732 N 16th Blvd Seattle WA 98462','1989-11-29','UW',3,3,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (786435457,'Tank Hunt','13398 E 18th AVE Seattle WA 98462','1988-07-06','UW',3,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (123453783,'Kim Hunt','93837 N 19th ST Seattle WA 98462','1989-02-17','UW',3,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (443557229,'Sue Hunt','39739 SE Martin ST Seattle WA 98462','1991-08-18','UW',2,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (225435357,'Harry Hunt','35973 SE 32nd AVE Seattle WA 98462','1990-01-08','UW',4,1,3);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (435537974,'Bubba Smith','7733 E 32nd PL St Missouri MS 67891','1992-08-22','MSU',2,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (354353758,'Tim Hunt','37937 SE 32nd Blvd St Missouri MS 67891','1988-09-11','MSU',1,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (353573557,'Jack Hunt','46346 N Juan ST St Missouri MS 67891','1996-08-04','MSU',1,0,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (355737939,'Don Hunt','67966 SE 32nd PL St Missouri MS 67891','1985-06-25','MSU',2,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (235793383,'Kelly Hunt','54321 SE 34th St Missouri MS 67891','1986-09-01','MSU',2,1,3);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (321232778,'Mike Hunt','6467 SE 32nd PL St Missouri MS 67891','1987-01-28','MSU',3,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (583369783,'Sean Hunt','3737 W 56th St St Missouri MS 67891','1988-06-22','MSU',3,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (349856245,'Lawrence Reid','4217 Ashton Lane Austin TX 78744','1988-02-18','UT',2,1,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (483214687,'Dennis Lahey','4663 Brentwood Drive Austin TX 78701','1990-05-25','UT',2,2,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (675941236,'Harry Bishop','1719 Brentwood Drive Austin TX 78723','1989-03-14','UT',3,2,0);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (854267913,'Bob Builder','748 Short Street Austin TX 78701','1988-11-11','UT',2,1,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (345795963,'Johnny Wallace','2380 Short Street Austin TX 78701','1991-12-01','UT',1,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (353647898,'Fredrick Amaral','736 Ashton Lane Austin TX 78759','1990-10-30','UT',3,3,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (345621787,'Marcus Williams','3064 Brentwood Drive Austin TX 78758','1989-09-07','UT',3,2,2);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (735321489,'Marvin Martinez','4345 Arbutus Drive Miami FL 33169','1989-07-20','UM',1,1,0);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (378345347,'Mike Wazowski','1034 Poplar Lane Miami FL 33131','1990-06-29','UM',1,1,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (945613454,'Thomas Mason','2359 Poplar Lane Miami FL 33139','1989-01-04','UM',2,2,1);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (343478454,'Pete Olson','4948 Ridenour Street Miama FL 33169','1987-03-26','UM',4,3,3);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (987513475,'Anthony Simpson','4506 Lamberts Branch Road Miami FL 33128','1991-01-22','UM',1,1,0);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (123476428,'Richard Fannin','4206 Mulberry Lane Miami FL 33169','1990-02-07','UM',2,2,0);
Insert into Players (ssn,player_name,address,birth_date,uni_name,team_years,uni_years,times_allstar) values (436376541,'Meyton Panning','571 Poplar Lane Miami FL 33165','1989-05-14','UM',2,1,1);
#14 more lines of players to be added
select* from Players;

Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (353573557,'Jack Hunt','46346 N Juan ST St Missouri MS 67891','1996-08-04','quarterback','UM',4,1,1,353573557,1127,95);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (123476428,'Richard Fannin','7733 E 32nd PL St Missouri MS 67891','1992-08-22','center player','UM',2,1,1,123476428,1125,48);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (987513475,'Anthony Simpson','3064 Brentwood Drive Austin TX 78758','1989-09-07','tackle','UM',3,2,2,987513475,1126,75);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (343478454,'Pete Olson','571 Poplar Lane Miami FL 33165','1989-05-14','running back','UM',2,1,1,343478454,1127,77);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (945613454,'Thomas Mason','91106 W 22nd PL Seattle WA 98462','1991-09-30','inside receiver','UM',4,4,2,945613454,1124,89);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (378345347,'Mike Wazowski','4663 Brentwood Drive Austin TX 78701','1990-05-25','quarterback','UM',2,2,2,378345347,1126,42);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (735321489,'Marvin Martinez','4345 Arbutus Drive Miami FL 33169','1989-07-20','tackle','UM',3,3,2,735321489,1124,64);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (891851561,'Brian Hunt','36673 N 9TH AVE Compton CA 90151','1987-09-18','quarterback','USDSU',4,1,1,891851561,1123,98);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (435537974,'Bubba Smith','7733 E 32nd PL St Missouri MS 67891','1992-08-22','center player','MSU',2,1,1,435537974,1125,78);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (345621787,'Marcus Williams','3064 Brentwood Drive Austin TX 78758','1989-09-07','tackle','UT',3,2,2,345621787,1126,75);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (436376541,'Meyton Panning','571 Poplar Lane Miami FL 33165','1989-05-14','running back','UM',2,1,1,436376541,1127,67);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (287728333,'Shawn Hunt','91106 W 22nd PL Seattle WA 98462','1991-09-30','inside receiver','UW',4,4,2,287728333,1124,99);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (483214687,'Dennis Lahey','4663 Brentwood Drive Austin TX 78701','1990-05-25','guard','UT',2,2,2,483214687,1126,82);
Insert into Allstar_team_nominees (ssn,player_name,address,birth_date,position,uni_name,team_years,uni_years,times_allstar,Players_ssn,teams_id_no,score) values (373554323,'Bruno Hunt','98732 N 16th Blvd Seattle WA 98462','1989-11-29','wide receiver','UW',3,3,2,373554323,1124,84);
select* from Allstar_team_nominees;

Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2012-06-23','Cowboys Stadium North Texas','UW Team','John Smith','Bruno Hunt, Shawn Hunt',27);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2014-07-13','Cowboys Stadium North Texas','UW Team','John Smith','Bruno Hunt, Shawn Hunt',22);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2016-07-28','Cowboys Stadium North Texas','UM Team','May Jane','Meyton Panning',31);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2017-06-23','Superdome New Orleans Louisiana','UT Team','Sarah Johnson','Dennis Lahey, Marcus Williams',24);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2020-07-14','Superdome New Orleans Louisiana','UT Team','Sarah Johnson','Dennis Lahey, Marcus Williams',36);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2018-06-16','Lucas Oil Stadium Indianapolis Indiana','USDSU Team','Mike Douglas','Brian Hunt',17);
Insert into Allstar_game (game_date,place,winning_team,winning_coach,winning_players,score) values ('2019-07-07','Lucas Oil Stadium Indianapolis Indiana','MSU Team','Chris Lange','Bubba Smith',23);
select* from Allstar_game;


Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2012-06-23',1124);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2014-07-13',1124);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2016-07-28',1127);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2017-06-23',1126);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2020-07-14',1126);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2018-06-16',1123);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2019-07-07',1125);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2012-06-23',1125);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2014-07-13',1123);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2016-07-28',1126);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2017-06-23',1124);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2020-07-14',1124);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2018-06-16',1128);
Insert into Allstar_game_has_Championship_teams (game_date,id_no) values ('2019-07-07',1129);
select* from Allstar_game_has_Championship_teams;


/*
#drop table Allstar_team_nominees cascade;
#drop table Allstar_game cascade;
#drop table Players cascade;
#drop table Championship_teams cascade;
#drop table Assistant_coach cascade;
#drop table Coach cascade;
#drop schema Allstar_Team;
*/