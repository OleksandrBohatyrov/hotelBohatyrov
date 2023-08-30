create table guest(
	id int primary key identity,
	first_name varchar(80),
	last_name varchar(80) NULL,
	member_since date)

create table room_type(
	id int primary key identity,
	description varchar(80),
	max_capacity int)

create table reservation(
	id int primary key identity,
	date_in date,
	date_out date,
	made_by varchar(20),
	guest_id int)

Alter table reservation
add foreign key (guest_id) REFERENCES guest(id);
	
create table reserved_room(
	id int not null primary key identity(1,1),
	number_of_rooms int,
	room_type_id int,
	foreign key (room_type_id) references room_type(id));

create table room(
	id int not null primary key identity(1,1),
	number varchar(10),
	name varchar(40),
	status varchar(10),
	smoke bit,
	room_type_id int,
	foreign key (room_type_id) references room_type(id));

create table occupied_room(
	id int not null primary key identity(1,1),
	check_in datetime,
	check_out datetime,
	room_id int,
	reservation_id int,
	foreign key (room_id) references room(id),
	foreign key (reservation_id) references reservation(id));

create table hosted_at(
	id int not null primary key identity(1,1),
	guest_id int,
	occupied_room_id int,
	foreign key (guest_id) references guest(id),
	foreign key (occupied_room_id) references occupied_room(id));
