insert into guest(first_name, last_name, member_since)
values ('Oleksandr', 'Bohatyrov', '2022-05-01');
insert into guest(first_name, last_name, member_since)
values ('Maksym', 'Loh', '2022-05-12');
insert into guest(first_name, last_name, member_since)
values ('Luca', 'Gluhhov', '2022-01-01');
insert into guest(first_name, last_name, member_since)
values ('Mama', 'Papa', '2022-05-01');
insert into guest(first_name, last_name, member_since)
values ('Yaroslav', 'Yekasov', '2022-05-01');


insert into room_type(description, max_capacity)
values ('5', 20);
insert into room_type(description, max_capacity)
values ('4', 50);
insert into room_type(description, max_capacity)
values ('3', 100);
insert into room_type(description, max_capacity)
values ('2', 200);
insert into room_type(description, max_capacity)
values ('1', 300);

insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-01-02', '2023-01-04', 'Oleksandr', 1);
insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-01-02', '2023-01-04', 'Maksym', 2);
insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-02-12', '2023-02-14', 'Luca', 3);
insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-02-16', '2023-02-18', 'Mama', 4 );
insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-02-22', '2023-02-25', 'Yaroslav', 5);

insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values (455, 1, 1, 'OK');
insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values (345, 2, 2, 'OK');
insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values (700, 3, 3, 'NO');
insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values (690, 4, 4, 'OK');
insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values (689, 5, 5, 'NO');

insert into room(number, name, status, smoke, room_type_id)
values (23, 'Oleksandr', 'OK', 1, 1);
insert into room(number, name, status, smoke, room_type_id)
values (11, 'Maksym', 'NO', 0, 2);
insert into room(number, name, status, smoke, room_type_id)
values (256, 'Luca', 'OK', 0, 3);
insert into room(number, name, status, smoke, room_type_id)
values (295, 'Mama', 'NO', 1, 4);
insert into room(number, name, status, smoke, room_type_id)
values (294, 'Papa', 'NO', 0, 5);

insert into occupied_room(check_in, check_out, room_id, reservation_id)
values ('2023-03-22', '2023-03-26', 1, 1);
insert into occupied_room(check_in, check_out, room_id, reservation_id)
values ('2023-04-01', '2023-04-03', 2, 2);
insert into occupied_room(check_in, check_out, room_id, reservation_id)
values ('2023-04-03', '2023-04-06', 3, 3);
insert into occupied_room(check_in, check_out, room_id, reservation_id)
values ('2023-02-22', '2023-02-26', 4, 4);
insert into occupied_room(check_in, check_out, room_id, reservation_id)
values ('2023-06-12', '2023-06-14', 5, 5);

insert into hosted_at(guest_id, occupied_room_id)
values(1, 1);
insert into hosted_at(guest_id, occupied_room_id)
values(2, 2);
insert into hosted_at(guest_id, occupied_room_id)
values(3, 3);
insert into hosted_at(guest_id, occupied_room_id)
values(4, 4);
insert into hosted_at(guest_id, occupied_room_id)
values(5, 5);
