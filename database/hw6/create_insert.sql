-- Jimmy Bowens
-- COSC Database
-- Homework #6

drop schema if exists hw6;
create schema hw6;
use hw6;

-- create

create table if not exists J(
	j_num varchar(10) not null,
    j_name varchar(45) not null,
    city varchar(45) not null,
    primary key(j_num)
);

create table if not exists P(
	p_num varchar(10) not null,
    p_name varchar(45) not null,
    color varchar(45) not null,
    weight int not null,
    city varchar(45) not null,
    primary key(p_num)
);

create table if not exists S(
	s_num varchar(10) not null,
    s_name varchar(45) not null,
    status int not null,
    city varchar(45) not null,
    primary key(s_num,status)
);

create table if not exists SPJ(
	s_num varchar(10) not null,
    p_num varchar(10) not null,
    j_num varchar(10) not null,
    primary key(s_num, p_num, j_num),
    qty int not null,
    constraint `SPJ_to_S`
		foreign key(s_num)
        references S(s_num)
        on delete cascade
        on update cascade,
	
    constraint `SPJ_to_P`
		foreign key(p_num)
        references P(p_num)
        on delete cascade
        on update cascade,
        
	constraint `SPJ_to_J`
		foreign key(j_num)
        references J(j_num)
        on delete cascade
        on update cascade
);

-- insert 
insert into J(j_num, j_name, city)values
('j1','Sorter', 'Paris'),
('j2','Punch', 'Rome'),
('j3','Reader','Athens'),
('j4','Console','Athens'),
('j5','Collator','London'),
('j6','Terminal','Oslo'),
('j7','Tape','London');

insert into P(p_num, p_name, color, weight, city)values 
('p1','Nut','Red',12,'London'),
('p2','Bolt','Green',17,'Paris'),
('p3','Screw','Blue',17,'Rome'),
('p4','Screw','Red',14,'London'),
('p5','Cam','Blue',12,'Paris'),
('p6','Cog','Red',19,'London');

insert into S(s_num, s_name, status, city) values
('s1','Smith', 20, 'London'),
('s2','Jones', 10, 'Paris'),
('s3','Blake', 30, 'Paris'),
('s4','Clark', 20, 'London'),
('s5','Adams', 30, 'Athens');

insert into SPJ(s_num, p_num, j_num, qty) values
('s1','p1','j1',200),

('s1','p1','j4',700),

('s2','p3','j1',400),

('s2','p3','j2',200),

('s2','p3','j3',200),

('s2','p3','j4',500),

('s2','p3','j5',600),

('s2','p3','j6',400),

('s2','p3','j7',800),

('s2','p5','j2',100),

('s3','p3','j1',200),

('s3','p4','j2',500),

('s4','p6','j3',300),



('s4','p6','j7',300),

('s5','p1','j4',100),

('s5','p2','j2',200),

('s5','p2','j4',100),

('s5','p3','j4',200),

('s5','p4','j4',800),

('s5','p5','j4',400),

('s5','p5','j5',500),

('s5','p5','j7',100),

('s5','p6','j2',200),

('s5','p6','j4',500);
