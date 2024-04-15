create table campaign (
    campaignID serial primary key,
    name varchar(20),
    startDate date,
    endDate date
);

insert into campaign(name, startDate, endDate) values ('Green for All', '2024-05-09', '2024-06-18');
insert into campaign(name, startDate, endDate) values ('Forest Fun', '2024-03-19', '2024-07-13');
insert into campaign(name, startDate, endDate) values ('Jungle Jam', '2024-05-09', '2024-06-18');
insert into campaign(name, startDate, endDate) values ('Island Fest', '2024-06-27', '2024-11-01');
insert into campaign(name, startDate, endDate) values ('Dessert Days', '2024-03-23', '2024-12-25');
insert into campaign(name, startDate, endDate) values ('Snow Show', '2024-12-01', '2025-01-25');
insert into campaign(name, startDate, endDate) values ('Rain Dance', '2024-08-30', '2024-09-29');

create table volunteer (
    volunteerID serial primary key,
    name varchar(30),
    tier int
);

insert into volunteer(name, tier) values ('Barry White', 1);
insert into volunteer(name, tier) values ('Herby Hancock', 2);
insert into volunteer(name, tier) values ('Mary Jane', 1);
insert into volunteer(name, tier) values ('Gary Nevile', 1);
insert into volunteer(name, tier) values ('Michael Ballack', 2);
insert into volunteer(name, tier) values ('Bruce Wayne', 2);
insert into volunteer(name, tier) values ('Alan Davies', 2);
insert into volunteer(name, tier) values ('Sandi Toksvig', 1);
insert into volunteer(name, tier) values ('John Wayne', 2);
insert into volunteer(name, tier) values ('Clint Eastwood', 2);
insert into volunteer(name, tier) values ('Marilyn Monroe', 1);
insert into volunteer(name, tier) values ('Ebeniser Scrooge', 2);
insert into volunteer(name, tier) values ('Thomas Muller', 2);
insert into volunteer(name, tier) values ('Jane Goodall', 2); 

create table office (
    address char(40) primary key,
    rent real
);

insert into office values ('3953 Gordon Head road', 535.35);

create table event (
    campaignID serial,
    date date,
    location char(30),
    startTime time,
    endTime time,
    primary key (date, location),
    foreign key (campaignID) references campaign(campaignID),
    check (endTime >= startTime)
);

insert into event values (3, '2024-05-27', 'Stanley Park', '08:00:00', '17:00:00');
insert into event values (2, '2024-04-06', 'Times Square', '07:00:00', '12:00:00');
insert into event values (6, '2025-01-01', 'Mount Washington', '09:00:00', '16:00:00');
insert into event values (5, '2024-05-20', 'The Sahara', '01:00:00', '07:00:00');
insert into event values (1, '2024-06-01', 'The Amazon', '07:00:00', '12:00:00');
insert into event values (4, '2024-07-06', 'Haida Gwaii', '12:00:00', '18:00:00');
insert into event values (7, '2024-09-22', 'Times Square', '06:00:00', '11:00:00');
insert into event values (1, '2024-06-17', 'The Thames', '04:00:00', '13:00:00');
insert into event values (2, '2024-05-22', 'Rio Grande', '00:00:00', '02:00:00');


create table participates (
    volunteer serial,
    campaignID serial,
    date date,
    location char(30),
    foreign key (volunteer) references volunteer(volunteerID),
    foreign key (date, location, campaignID) references event(date, location, campaignID)
);

insert into participates values ( 1, 3, '2024-05-27', 'Stanley Park');
insert into participates values ( 1, 7, '2024-09-22', 'Times Square');
insert into participates values ( 2, 4, '2024-07-06', 'Haida Gwaii');
insert into participates values ( 2, 1, '2024-06-17', 'The Thames');
insert into participates values ( 4, 2, '2024-05-22', 'Rio Grande');
insert into participates values ( 5, 6, '2025-01-01', 'Mount Washington');
insert into participates values ( 6, 2, '2024-04-06', 'Times Square');
insert into participates values ( 7, 5, '2024-05-20', 'The Sahara');
insert into participates values ( 8, 5, '2024-05-20', 'The Sahara');
insert into participates values ( 13, 4, '2024-07-06', 'Haida Gwaii');
insert into participates values ( 12, 3, '2024-05-27', 'Stanley Park');


create table fund (
    fundID serial primary key,
    date date,
    time time,
    amount real
);

insert into fund(date, time, amount) values ( '2024-03-01', '12:00:00', -535.35);
insert into fund(date, time, amount) values ( '2024-02-01', '09:00:00', -535.35);
insert into fund(date, time, amount) values ( '2024-01-01', '13:00:00', -535.35);
insert into fund(date, time, amount) values ( '2023-12-01', '14:00:00', -535.35);
insert into fund(date, time, amount) values ( '2024-01-01', '09:00:00', -50000.00);
insert into fund(date, time, amount) values ( '2024-01-01', '09:00:00', -20000.00);
insert into fund(date, time, amount) values ( '2024-01-01', '09:00:00', -30000.00);
insert into fund(date, time, amount) values ( '2024-01-01', '09:00:00', -10000.00);
insert into fund(date, time, amount) values ( '2024-06-18', '17:00:00', 5000.00);
insert into fund(date, time, amount) values ( '2024-07-13', '17:00:00', 7000.00);
insert into fund(date, time, amount) values ( '2024-06-18', '17:00:00', 3000.00);
insert into fund(date, time, amount) values ( '2024-11-01', '17:00:00', 10000.00);
insert into fund(date, time, amount) values ( '2024-12-25', '17:00:00', 1000.00);
insert into fund(date, time, amount) values ( '2025-01-25', '17:00:00', 6000.00);
insert into fund(date, time, amount) values ( '2024-09-29', '17:00:00', 1000.00);
insert into fund(date, time, amount) values ( '2024-05-09', '09:00:00', -500.00);
insert into fund(date, time, amount) values ( '2024-03-19', '09:00:00', -100.00);
insert into fund(date, time, amount) values ( '2024-05-09', '09:00:00', -200.00);
insert into fund(date, time, amount) values ( '2024-06-27', '09:00:00', -400.00);
insert into fund(date, time, amount) values ( '2024-03-23', '09:00:00', -600.00);
insert into fund(date, time, amount) values ( '2024-12-01', '09:00:00', -700.00);
insert into fund(date, time, amount) values ( '2024-08-30', '09:00:00', -200.00);
insert into fund(date, time, amount) values ( '2023-05-09', '12:00:00', 10000.00);
insert into fund(date, time, amount) values ( '2024-01-30', '13:00:00', 50000.00);
insert into fund(date, time, amount) values ( '2023-12-25', '09:00:00', 100000.00);
insert into fund(date, time, amount) values ( '2024-02-17', '17:00:00', 70000.00);
insert into fund(date, time, amount) values ( '2023-10-20', '14:00:00', 30000.00);
insert into fund(date, time, amount) values ( '2023-11-02', '12:00:00', 80000.00);
insert into fund(date, time, amount) values ( '2024-04-03', '08:00:00', 20000.00);



create table fundraised (
    fund serial,
    campaign serial,
    foreign key (fund) references fund(fundID),
    foreign key (campaign) references campaign(campaignID)
);

insert into fundraised values ( 9, 1);
insert into fundraised values ( 10, 2);
insert into fundraised values ( 11, 3);
insert into fundraised values ( 12, 4);
insert into fundraised values ( 13, 5);
insert into fundraised values (14, 6);
insert into fundraised values (15, 7);



create table cost (
    fund serial,
    campaign serial,
    foreign key (fund) references fund(fundID),
    foreign key (campaign) references campaign(campaignID)
);

insert into cost values (16, 1);
insert into cost values (17, 2);
insert into cost values (18, 3);
insert into cost values (19, 4);
insert into cost values (20, 5);
insert into cost values (21, 6);
insert into cost values (22, 7);

create table RentPayement (
    office char(40),
    fund serial,
    foreign key (fund) references fund(fundID),
    foreign key (office) references office(address)
);

insert into RentPayement values('3953 Gordon Head road', 1);
insert into RentPayement values('3953 Gordon Head road', 2);
insert into RentPayement values('3953 Gordon Head road', 3);
insert into RentPayement values('3953 Gordon Head road', 4);


create table employee(
    employeeID serial primary key,
    name char(30),
    title char(30),
    salary real
        check (salary >= 0)
);

insert into employee(name, title, salary) values ('Jim Brown', 'Chief Executive Offficer', 50000.00);
insert into employee(name, title, salary) values ('King Ghidorah', 'Accountant', 20000.00);
insert into employee(name, title, salary) values ('Victor Von Doom', 'Lawyer', 30000.00);
insert into employee(name, title, salary) values ('Noel Fielding', 'Cook', 10000.00);

create table paid(
    fund serial,
    employee serial,
    foreign key (fund) references fund(fundID),
    foreign key (employee) references employee(employeeID)
);

insert into paid values (5, 1);
insert into paid values (6, 2);
insert into paid values (7, 3);
insert into paid values (8, 4);

create table worksAt(
    employee serial,
    office char(40),
    foreign key (office) references office(address),
    foreign key (employee) references employee(employeeID)
);

insert into worksAt values (1, '3953 Gordon Head road');
insert into worksAt values (2, '3953 Gordon Head road');
insert into worksAt values (3, '3953 Gordon Head road');
insert into worksAt values (4, '3953 Gordon Head road');

create table donor(
    donorID serial primary key,
    name char(40)
);

insert into donor(name) values ('Micah Richards');
insert into donor(name) values ('Jamie Carragher');
insert into donor(name) values ('Thierry Henry');
insert into donor(name) values ('Kate Abdo');
insert into donor(name) values ('Gary Lineke');
insert into donor(name) values ('Alan Shearer');

create table givesTo(
    donor serial,
    fund serial,
    foreign key (donor) references donor(donorID),
    foreign key (fund) references fund(fundID)
);

insert into givesTo values (1, 23);
insert into givesTo values (2, 24);
insert into givesTo values (3, 25);
insert into givesTo values (4, 26);
insert into givesTo values (5, 27);
insert into givesTo values (6, 28);
insert into givesTo values (1, 29);

create table member(
    memberID serial primary key,
    name char(40)
);

insert into member(name) values ('Harry Nilsson');
insert into member(name) values ('David Bowie');
insert into member(name) values ('Nathanial Merriweather');
insert into member(name) values ('Joe Shmoe');
insert into member(name) values ('Sisyphus');
insert into member(name) values ('Diogenes');
insert into member(name) values ('Marcus Aurelius');
insert into member(name) values ('Friedrich Nietzsche');
insert into member(name) values ('Lou Reed');
insert into member(name) values ('Daniel Dumile');

create table supports(
    member serial,
    campaign serial,
    foreign key (member) references member(memberID),
    foreign key (campaign) references campaign(campaignID)
);

insert into supports values(1, 1);
insert into supports values(1, 5);
insert into supports values(2, 4);
insert into supports values(3, 2);
insert into supports values(3, 7);
insert into supports values(3, 5);
insert into supports values(4, 3);
insert into supports values(5, 6);
insert into supports values(7, 2);
insert into supports values(7, 3);
insert into supports values(8, 5);
insert into supports values(9, 6);
insert into supports values(10, 1);

create table websitePosting(
    campaignID serial,
    date date,
    time time,
    author char(30),
    primary key ( date, time),
    foreign key (campaignID) references campaign(campaignID)
);

insert into websitePosting values (1, '2024-05-09', '09:00:00', 'Margaret Atwood');
insert into websitePosting values (2, '2024-03-20', '12:00:00', 'George Orwell');
insert into websitePosting values (2, '2024-04-20', '15:00:00', 'George Orwell');
insert into websitePosting values (3, '2024-06-01', '03:00:00', 'Mother Theresa');
insert into websitePosting values (4, '2024-11-01', '09:00:00', 'Margaret Atwood');
insert into websitePosting values (5, '2024-06-20', '18:00:00', 'Stephen King');
insert into websitePosting values (6, '2024-12-25', '09:00:00', 'JRR Tolkien');
insert into websitePosting values (7, '2024-09-09', '09:00:00', 'George Orwell');