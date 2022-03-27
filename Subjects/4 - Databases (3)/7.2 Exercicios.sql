create table table01 (
	ID SERIAL NOT NULL PRIMARY KEY
);

create table table02 (
	ID SERIAL NOT NULL PRIMARY KEY
);

create table table03 (
	ID SERIAL NOT NULL PRIMARY KEY
);

create user tester1;
create user tester2;

alter table table01 owner to tester1;
alter table table02 owner to tester1;
alter table table03 owner to tester1;

drop role table02;

reassign owned by tester2 to tester1;

drop owned by tester1;