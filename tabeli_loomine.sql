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
