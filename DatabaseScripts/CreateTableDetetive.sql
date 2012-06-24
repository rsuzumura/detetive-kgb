create table det_Logins(
	lgi_Login uniqueidentifier not null,
	lgi_Username varchar(100) not null,
	lgi_ApplicationName varchar(100) not null,
	lgi_Email varchar(100) not null,
	lgi_Notes varchar(250) null,
	lgi_Password varchar(100) not null,
	lgi_PasswordQuestion varchar(250) null,
	lgi_PasswordAnswer varchar(100) null,
	lgi_IsApproved bit null,
	lgi_LastActivityDate datetime null,
	lgi_LastLoginDate datetime null,
	lgi_LastPasswordChangeDate datetime null,
	lgi_CreationDate datetime null,
	lgi_IsLockedOut bit null,
	lgi_LastLockedOutDate datetime null,
	lgi_FailedAttemptCount int null,
	lgi_FailedAttemptWindow datetime null,
	lgi_FailedAnswerAttemptCount int null,
	lgi_FailedAnswerAttemptWindow datetime null,
	constraint lgi_Login primary key (lgi_Login),
	constraint lgi_Username unique(lgi_Username,lgi_ApplicationName)
);
go

create table det_Roles(
	rol_Rolename varchar(100) not null,
	rol_ApplicationName varchar(100) not null,
	constraint rol_roles primary key(rol_Rolename,rol_ApplicationName)
);
go

create table det_Logins_Roles(
	lro_Username varchar(100) not null,
	lro_Rolename varchar(100) not null,
	lro_ApplicationName varchar(100) not null,
	constraint lro_login_role primary key(lro_Username,lro_Rolename,lro_ApplicationName),
	constraint lro_role foreign key(lro_Rolename,lro_ApplicationName) references det_Roles(rol_Rolename,rol_ApplicationName)
);
go

create table det_Weapons (
	wea_Weapon int identity(1,1),
	wea_Name varchar(100),
	wea_Description	varchar(2000),
	wea_Enabled bit,
	wea_Image varbinary(max),
	wea_ImageName varchar(100),
	constraint wea_weapon primary key(wea_Weapon)
);
go

create table det_Actors (
	act_Actor int identity(1,1),
	act_Name varchar(100) not null,
	act_Description	varchar(2000),
	act_Enabled bit not null,
	act_Image varbinary(max),
	act_ImageName varchar(100),
	act_Color int not null,
	constraint act_actor primary key(act_Actor)
);
go

create table det_Rooms (
	roo_Room int identity(1,1),
	roo_Name varchar(100) not null,
	roo_Description	varchar(2000),
	roo_Enabled bit not null,
	roo_ImageName varchar(100),	
	constraint roo_Room primary key(roo_Room)
);
go

drop table det_Games;
create table det_Games (
	gam_Game int identity(1,1),
	gam_Enabled bit not null,
	gam_Started bit not null,
	gam_Player int,
	gam_Actor int,
	gam_Weapon int,
	gam_Room int,
	gam_ShowColor int,
	gam_Type int,
	gam_Subtype int,
	constraint gam_game primary key(gam_Game),
	constraint gam_actor foreign key(gam_Actor) references det_Actors(act_Actor),
	constraint gam_weapon foreign key(gam_Weapon) references det_Weapons(wea_Weapon),
	constraint gam_room foreign key(gam_Room) references det_Rooms(roo_Room)
);
drop table det_GamePlayers;
create table det_GamePlayers (
	gap_GamePlayer int identity(1,1),
	gap_Game int not null,
	gap_Username varchar(100) not null,
	gap_Actor int not null,
	gap_Enabled bit not null,
	gap_Position varchar(10),
	gap_Status int not null,
	gap_AccuseActor int,
	gap_AccuseWeapon int,
	gap_AccuseRoom int,
	constraint gap_gameplayer primary key(gap_GamePlayer),
	constraint gap_game foreign key(gap_Game) references det_Games(gam_Game),
	constraint gap_actor foreign key(gap_Actor) references det_Actors(act_Actor),
	constraint gap_accuseactor foreign key(gap_AccuseActor) references det_Actors(act_Actor),
	constraint gap_accuseweapon foreign key(gap_AccuseWeapon) references det_Weapons(wea_Weapon),
	constraint gap_accuseroom foreign key(gap_AccuseRoom) references det_Rooms(roo_Room),
	constraint gap_UsernameUnique unique(gap_Username)
);
drop table det_GamePlayerCards;
create table det_GamePlayerCards (
	gpc_GamePlayer int,
	gpc_Type int,
	gpc_Subtype int,
	constraint fk_gameplayer foreign key(gpc_GamePlayer) references det_GamePlayers(gap_GamePlayer)
);