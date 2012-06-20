declare @o varchar(100); set @o = 'det_p_ListWeapons';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListWeapons
as
begin
	select
		[Weapon].*
	from (
		select
			wea_Weapon [WeaponId],
			wea_Name [Name],
			wea_Description [Description],
			wea_Enabled [Enabled],
			wea_ImageName [ImageName]
		from
			det_Weapons
	) [Weapon]
	for xml auto, elements, root('Weapons');
end
go

declare @o varchar(100); set @o = 'det_p_AddWeapon';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_AddWeapon(
	@xml xml,
	@weapon int output
) as
begin
	insert into det_Weapons (
		wea_Name,
		wea_Description,
		wea_Enabled,
		wea_ImageName
	) 
	select
		x.n.value('Name[1]', 'varchar(100)'),
		x.n.value('Description[1]', 'varchar(2000)'),
		x.n.value('Enabled[1]', 'bit'),
		x.n.value('ImageName[1]', 'varchar(100)')
	from
		@xml.nodes('/*[1]') x(n);

	set @weapon = scope_identity();
end;
go

declare @o varchar(100); set @o = 'det_p_SaveWeapon';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveWeapon(
	@xml xml
) as
begin
	update det_Weapons set
		wea_Name = x.n.value('Name[1]', 'varchar(100)'),
		wea_Description = x.n.value('Description[1]', 'varchar(2000)'),
		wea_Enabled = x.n.value('Enabled[1]', 'bit'),
		wea_ImageName = x.n.value('ImageName[1]', 'varchar(100)')
	from
		@xml.nodes('/*[1]') x(n)
	where
		wea_Weapon = x.n.value('WeaponId[1]', 'int');
end;
go

declare @o varchar(100); set @o = 'det_p_GetWeapon';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetWeapon(
	@weapon int
) as
begin
	select
		[Weapon].*
	from (
		select
			wea_Weapon [WeaponId],
			wea_Name [Name],
			wea_Description [Description],
			wea_Enabled [Enabled],
			wea_ImageName [ImageName]
		from
			det_Weapons
		where
			wea_Weapon = @weapon
	) [Weapon]
	for xml auto, elements
end;
go

declare @o varchar(100); set @o = 'det_p_DeleteWeapon';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_DeleteWeapon(
	@weapon int
) as
begin
	delete from
		det_Weapons
	where
		wea_Weapon = @weapon;
end;
go

declare @o varchar(100); set @o = 'det_p_GetWeaponPhoto';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetWeaponPhoto(
	@weapon int
) as
begin
	select
		wea_Image
	from
		det_Weapons
	where
		wea_Weapon = @weapon;
end;
go

declare @o varchar(100); set @o = 'det_p_SaveWeaponPhoto';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveWeaponPhoto(
	@weapon int,
	@value varbinary(8000)
) with encryption as
begin

	if @value is null
		update det_Weapons set
			wea_Image = 0x
		where
			wea_Weapon = @weapon;
	else
		update det_Weapons set
			wea_Image.write(@value, null, null)
		where
			wea_Weapon = @weapon;

end
go

declare @o varchar(100); set @o = 'det_p_ListActors';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListActors
as
begin
	select
		[Actor].*
	from (
		select
			act_Actor [ActorId],
			act_Name [Name],
			act_Description [Description],
			act_Enabled [Enabled],
			act_ImageName [ImageName],
			act_Color [Color]
		from
			det_Actors
	) [Actor]
	for xml auto, elements, root('Actors');
end
go

declare @o varchar(100); set @o = 'det_p_ListUnusedActors';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListUnusedActors (
	@game int
)
as
begin
	select
		[Actor].*
	from (
		select
			act_Actor [ActorId],
			act_Name [Name],
			act_Description [Description],
			act_Enabled [Enabled],
			act_ImageName [ImageName],
			act_Color [Color]
		from
			det_Actors
		where
			act_Actor not in (select gap_Actor from det_GamePlayers where gap_Game = @game)
	) [Actor]
	for xml auto, elements, root('Actors');
end
go

declare @o varchar(100); set @o = 'det_p_AddActor';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_AddActor(
	@xml xml,
	@actor int output
) as
begin
	insert into det_Actors (
		act_Name,
		act_Description,
		act_Enabled,
		act_ImageName,
		act_Color
	) 
	select
		x.n.value('Name[1]', 'varchar(100)'),
		x.n.value('Description[1]', 'varchar(2000)'),
		x.n.value('Enabled[1]', 'bit'),
		x.n.value('ImageName[1]', 'varchar(100)'),
		x.n.value('Color[1]', 'int')
	from
		@xml.nodes('/*[1]') x(n);

	set @actor = scope_identity();
end;
go

declare @o varchar(100); set @o = 'det_p_SaveActor';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveActor(
	@xml xml
) as
begin
	update det_Actors set
		act_Name = x.n.value('Name[1]', 'varchar(100)'),
		act_Description = x.n.value('Description[1]', 'varchar(2000)'),
		act_Enabled = x.n.value('Enabled[1]', 'bit'),
		act_ImageName = x.n.value('ImageName[1]', 'varchar(100)'),
		act_Color = x.n.value('Color[1]', 'int')
	from
		@xml.nodes('/*[1]') x(n)
	where
		act_Actor = x.n.value('ActorId[1]', 'int');
end;
go

declare @o varchar(100); set @o = 'det_p_GetActor';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetActor(
	@actor int
) as
begin
	select
		[Actor].*
	from (
		select
			act_Actor [ActorId],
			act_Name [Name],
			act_Description [Description],
			act_Enabled [Enabled],
			act_ImageName [ImageName],
			act_Color [Color]
		from
			det_Actors
		where
			act_Actor = @actor
	) [Actor]
	for xml auto, elements
end;
go

declare @o varchar(100); set @o = 'det_p_DeleteActor';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_DeleteActor(
	@actor int
) as
begin
	delete from
		det_Actors
	where
		act_Actor = @actor;
end;
go

declare @o varchar(100); set @o = 'det_p_GetActorPhoto';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetActorPhoto(
	@actor int
) as
begin
	select
		act_Actor
	from
		det_Actors
	where
		act_Actor = @actor;
end;
go

declare @o varchar(100); set @o = 'det_p_SaveActorPhoto';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveActorPhoto(
	@actor int,
	@value varbinary(8000)
) with encryption as
begin

	if @value is null
		update det_Actors set
			act_Image = 0x
		where
			act_Actor = @actor;
	else
		update det_Actors set
			act_Image.write(@value, null, null)
		where
			act_Actor = @actor;

end
go

declare @o varchar(100); set @o = 'det_p_ListRooms';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListRooms
as
begin
	select
		[Room].*
	from (
		select
			roo_Room [RoomId],
			roo_Name [Name],
			roo_Description [Description],
			roo_Enabled [Enabled],
			roo_ImageName [ImageName]
		from
			det_Rooms
	) [Room]
	for xml auto, elements, root('Rooms');
end
go

declare @o varchar(100); set @o = 'det_p_AddRoom';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_AddRoom(
	@xml xml,
	@room int output
) as
begin
	insert into det_Rooms (
		roo_Name,
		roo_Description,
		roo_Enabled,
		roo_ImageName
	) 
	select
		x.n.value('Name[1]', 'varchar(100)'),
		x.n.value('Description[1]', 'varchar(2000)'),
		x.n.value('Enabled[1]', 'bit'),
		x.n.value('ImageName[1]', 'varchar(100)')
	from
		@xml.nodes('/*[1]') x(n);

	set @room = scope_identity();
end;
go

declare @o varchar(100); set @o = 'det_p_SaveRoom';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveRoom(
	@xml xml
) as
begin
	update det_Rooms set
		roo_Name = x.n.value('Name[1]', 'varchar(100)'),
		roo_Description = x.n.value('Description[1]', 'varchar(2000)'),
		roo_Enabled = x.n.value('Enabled[1]', 'bit'),
		roo_ImageName = x.n.value('ImageName[1]', 'varchar(100)')
	from
		@xml.nodes('/*[1]') x(n)
	where
		roo_Room = x.n.value('RoomId[1]', 'int');
end;
go

declare @o varchar(100); set @o = 'det_p_GetRoom';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetRoom(
	@room int
) as
begin
	select
		[Room].*
	from (
		select
			roo_Room [RoomId],
			roo_Name [Name],
			roo_Description [Description],
			roo_Enabled [Enabled],
			roo_ImageName [ImageName]
		from
			det_Rooms
		where
			roo_Room = @room
	) [Room]
	for xml auto, elements
end;
go

declare @o varchar(100); set @o = 'det_p_DeleteRoom';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_DeleteRoom(
	@room int
) as
begin
	delete from
		det_Rooms
	where
		roo_Room = @room;
end;
go

declare @o varchar(100); set @o = 'det_p_AddGamePlayer';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_AddGamePlayer(
	@xml xml,
	@gamePlayer int output
) as
begin
	insert into det_GamePlayers (
		gap_Game,
		gap_Username,
		gap_Actor,
		gap_Enabled,
		gap_Position,
		gap_Status
	) 
	select
		x.n.value('GameId[1]', 'int'),
		x.n.value('Username[1]', 'varchar(100)'),
		x.n.value('ActorId[1]', 'int'),
		x.n.value('Enabled[1]', 'bit'),
		x.n.value('Position[1]', 'varchar(10)'),
		x.n.value('Status[1]', 'int')
	from
		@xml.nodes('/*[1]') x(n);

	set @gamePlayer = scope_identity();
end;
go

declare @o varchar(100); set @o = 'det_p_SaveGamePlayer';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveGamePlayer(
	@xml xml
) as
begin
	update det_GamePlayers set
		gap_Game = x.n.value('GameId[1]', 'int'),
		gap_Username = x.n.value('Username[1]', 'varchar(100)'),
		gap_Actor = x.n.value('ActorId[1]', 'int'),
		gap_Enabled = x.n.value('Enabled[1]', 'bit'),
		gap_Position = x.n.value('Position[1]', 'varchar(10)'),
		gap_Status = x.n.value('Status[1]', 'int')	
	from
		@xml.nodes('/*[1]') x(n)
	where
		gap_GamePlayer = x.n.value('GamePlayerId[1]', 'int');
end;
go

declare @o varchar(100); set @o = 'det_p_ListGamePlayer';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListGamePlayer(
	@game int
) as
begin
	select
		[GamePlayer].*
	from (
		select
			gap_GamePlayer [GamePlayerId],
			gap_Game [GameId],
			gap_Username [Username],
			gap_Actor [ActorId],
			gap_Enabled [Enabled],
			gap_Position [Position],
			gap_Status [Status],
			act_Color [Color]
		from
			det_GamePlayers
			inner join det_Actors on act_Actor = gap_Actor
		where
			gap_Game = @game
	) [GamePlayer]
	order by
		[Color] asc
	for xml auto, elements, root('GamePlayers');
end;
go

declare @o varchar(100); set @o = 'det_p_GetGamePlayer';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetGamePlayer(
	@gamePlayer int
) as
begin
	select
		[GamePlayer].*
	from (
		select
			gap_GamePlayer [GamePlayerId],
			gap_Game [GameId],
			gap_Username [Username],
			gap_Actor [ActorId],
			gap_Enabled [Enabled],
			gap_Position [Position],
			gap_Status [Status]
		from
			det_GamePlayers
		where
			gap_GamePlayer = @gamePlayer
	) [GamePlayer]
	for xml auto, elements;
end;
go

declare @o varchar(100); set @o = 'det_p_GetGamePlayerByUsername';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetGamePlayerByUsername(
	@game int,
	@userName varchar(100)
) as
begin
	select
		[GamePlayer].*
	from (
		select
			gap_GamePlayer [GamePlayerId],
			gap_Game [GameId],
			gap_Username [Username],
			gap_Actor [ActorId],
			gap_Enabled [Enabled],
			gap_Position [Position],
			gap_Status [Status],
			act_Color [Color]
		from
			det_GamePlayers
			inner join det_Actors on act_Actor = gap_Actor
		where
			gap_Game = @game and
			gap_Username = @userName
	) [GamePlayer]
	for xml auto, elements;
end;
go

declare @o varchar(100); set @o = 'det_p_RemoveGamePlayer';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_RemoveGamePlayer(
	@game int,
	@userName varchar(100)
) as
begin
	delete from
		det_GamePlayers
	where
		gap_Game = @game and
		gap_Username = @userName;
end;
go

declare @o varchar(100); set @o = 'det_p_ShowStartButton';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ShowStartButton(
	@userName varchar(100),
	@game int,
	@result bit output
) as
begin
	declare @id int;
	
	select
		@id = min(gap_GamePlayer)
	from
		det_GamePlayers
	where
		gap_Game = @game;
	
	if exists(select 1 from det_GamePlayers where gap_Username = @userName and gap_GamePlayer = @id)
		set @result = 1;
	else
		set @result = 0;
end;
go

declare @o varchar(100); set @o = 'det_p_EnableStartButton';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_EnableStartButton(
	@game int,
	@result bit output
) as
begin
	declare @count int;
	
	select
		@count = count(1)
	from
		det_GamePlayers
	where
		gap_Game = @game;
	
	if @count > 2
		set @result = 1;
	else
		set @result = 0;
end;
go

declare @o varchar(100); set @o = 'det_p_GetGame';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetGame(
	@game int
) as
begin
	select
		[Game].*
	from (
		select
			gam_Game [GameId],
			gam_Enabled [Enabled],
			gam_Started [Started],
			gam_Player [Player],
			gam_Actor [ActorId],
			gam_Weapon [WeaponId],
			gam_Room [RoomId]
		from
			det_Games
		where
			gam_Game = @game
	) [Game]
	for xml auto, elements;
end;
go

declare @o varchar(100); set @o = 'det_p_SaveGameResult';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SaveGameResult(
	@game int,
	@actor int,
	@weapon int,
	@room int
) as
begin
	update det_Games set
		gam_Actor = @actor,
		gam_Weapon = @weapon,
		gam_Room = @room
	where
		gam_Game = @game;
end;
go

declare @o varchar(100); set @o = 'det_p_StartGame';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_StartGame(
	@game int
) as
begin
	update det_Games set
		gam_Started = 1
	where
		gam_Game = @game;
end;
go

declare @o varchar(100); set @o = 'det_p_GetCards';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_GetCards(
	@game int
) as
begin
	select
		[Card].*
	from (
		select
			act_Actor [Subtype],
			1 [Type]
		from
			det_Actors
		where
			act_Actor <> (select gam_Actor from det_Games where gam_Game = @game)
		union all
		select
			wea_Weapon [Subtype],
			2 [Type]
		from
			det_Weapons
		where
			wea_Weapon <> (select gam_Weapon from det_Games where gam_Game = @game)
		union all
		select
			roo_Room [Subtype],
			3 [Type]
		from
			det_Rooms
		where
			roo_room <> (select gam_Room from det_Games where gam_Game = @game)
	) [Card]
	for xml auto, elements, root('Cards')
end;
go

declare @o varchar(100); set @o = 'det_p_AddGamePlayerCards';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_AddGamePlayerCards(
	@xml xml
) as
begin
	insert into det_GamePlayerCards (
		gpc_GamePlayer,
		gpc_Type,
		gpc_Subtype
	) 
	select
		x.n.value('GamePlayerId[1]', 'int'),
		x.n.value('Type[1]', 'int'),
		x.n.value('Subtype[1]', 'int')
	from
		@xml.nodes('/*[1]') x(n);
end;
go

declare @o varchar(100); set @o = 'det_p_SetPlayerTime';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_SetPlayerTime(
	@game int
) as
begin
	declare @color int;
	declare @newColor int;

	select
		@color = gam_Player
	from
		det_Games
	where
		gam_Game = @game;

	select top 1
		@newColor = act_Color
	from
		det_GamePlayers
		inner join det_Actors on act_Actor = gap_Actor
	where
		gap_Game = @game and
		act_Color > @color
	order by
		act_Color;

	if @newColor is null
	begin
		select top 1
			@newColor = act_Color
		from
			det_GamePlayers
			inner join det_Actors on act_Actor = gap_Actor
		where
			gap_Game = @game
		order by
			act_Color asc;
	end

	update det_Games set
		gam_Player = @newColor
	where
		gam_Game = @game;
end;
go

declare @o varchar(100); set @o = 'det_p_ListGameCards';
if object_id(@o, 'P') is not null begin
	declare @d nvarchar(250); set @d = 'drop procedure ' + @o;
	execute sp_executesql @d;
end;
go
create procedure det_p_ListGameCards(
	@userName varchar(100)
) as
begin
	select
		[Card].*
	from (
		select
			gpc_GamePlayer [GamePlayerId],
			gpc_Type [Type],
			gpc_Subtype [Subtype]
		from
			det_GamePlayerCards
			inner join det_GamePlayers on gap_GamePlayer = gpc_GamePlayer
		where
			gap_Username = @userName
	) [Card]
	for xml auto, elements, root('Cards');
end;
go

select * from det_GamePlayerCards order by gpc_GamePlayer