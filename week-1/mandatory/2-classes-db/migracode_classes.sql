drop table if exists attendance;
drop table if exists classe;
drop table if exists mentor;
drop table if exists student;

CREATE TABLE mentor (
  id       		        SERIAL PRIMARY KEY,
  name     	      	  VARCHAR(30) NOT NULL,
  years_living_BCN	  INT NOT NULL,
  address  	      	  VARCHAR(120),
  favourite_language	VARCHAR(120) NOT NULL,
  city     	        	VARCHAR(30),
  postcode            VARCHAR(12)
);

CREATE TABLE student (
  id       		        SERIAL PRIMARY KEY,
  name     		        VARCHAR(30) NOT NULL,
  address  		        VARCHAR(120) NOT NULL,
  age	   		          INT NOT NULL,
  city                VARCHAR(30),
  postcode            VARCHAR(12)
);

CREATE TABLE classe (
  id       		        SERIAL PRIMARY KEY,
  mentor              VARCHAR(30) NOT NULL,
  leading_mentor_id	  INT REFERENCES MENTOR(ID),
  topic_class		      VARCHAR(30),
  date			          DATE NOT NULL,	
  location		        VARCHAR(120),
  time_to_start       	TIME,
  hours_per_day	    	TIME
);

CREATE TABLE attendance (
  student_id          INT REFERENCES STUDENT(ID),
  classe_id           INT REFERENCES CLASSE(ID)
);

INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Stefanos', '3', '11 Carrer de la Fusina', 'JS', 'Barcelona', '08001');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Antônio Miranda', '6', '01 Carrer de dOcata', 'JS','Barcelona', '2131');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Jay Nebhwani', '5', '06 Carrer del Comerç', 'JS', 'Barcelona', '12345');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Juan Camilo','4','20 Carrer dels Sombrerers','JS','Barcelona', '08024');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Yonah Forst','3','11 Carrer de la Ribera','React','Barcelona', '08029');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Carlos Sánchez','27','27 Carrer del Rec','Node, JS','Barcelona', '08789');
INSERT INTO mentor (name, years_living_BCN, address, favourite_language, city, postcode) VALUES ('Ricard More','30','11 Passeig de Picasso','SQL, JS','Barcelona', '08541');

INSERT INTO student (name, address, age, city, postcode) VALUES ('Roshan Sapkota', '5 Carrer de la Maquinista', '27', 'Glories', '333');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Shaheen AKOND', '10 Carrer de Jenebra' ,'30', 'Barcelona', '08001');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Ümit', '23 Carrer del Portal Nou', '30', 'Tarragona', '43003');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Anandamaya Arno', '12 Carrer dels Vigatans', '23', 'Cornella de Llobregat', '08940');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Rubén Adarme', '7 Carrer dels Sombreres', '25', 'Barcelona', '08037');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Gustavo Rossini' ,'8 Carrer dels Banys Vells' ,'28' , 'Barcelona', '08002' );
INSERT INTO student (name, address, age, city, postcode) VALUES ('Victoria', '02 Carrer de la Ciera', '26', 'Santa Coloma', '08921');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Joaquin Diez', '03 Carrer de Jenebra', '27','Barcelona', '0801AB');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Alejandro Sanchez', '12 Carrer dels Vigatans', '23', 'Cornella' , '08940');
INSERT INTO student (name, address, age, city, postcode) VALUES ('Thiago Luiz Pereira', 'Carrer dAvinyó' , '28', 'Barcelona', '08001');

INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('1', 'Stefanos', 'HTML, CSS', '2020-03-21', 'Barcelona', '018:00:00', '004:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('2', 'Antônio Miranda', 'JS', '2020-04-18', 'Barcelona', '015:00:00', '005:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('3', 'Jay Nebhwani', 'JS', '2020-04-22', 'Barcelona', '018:00:00', '004:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('4', 'Juan Camilo', 'JS', '2020-05-13', 'Barcelona', '015:00:00', '004:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('5', 'Yonah Forst', 'React', '2020-06-10' ,'Barcelona', '018:00:00', '005:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('6', 'Carlos Sánchez', 'Node, JS', '2020-07-01', 'Barcelona', '015:00:00', '004:00:00');
INSERT INTO classe (leading_mentor_id, mentor, topic_class, date, location, time_to_start, hours_per_day) VALUES ('7', 'Ricard More', 'SQL, JS', '2020-07-16', 'Barcelona', '018:00:00', '004:00:00');

INSERT INTO attendance VALUES (1,1);
INSERT INTO attendance VALUES (1,2);
INSERT INTO attendance VALUES (2,2);
INSERT INTO attendance VALUES (3,2);
INSERT INTO attendance VALUES (4,2);
INSERT INTO attendance VALUES (4,2);
INSERT INTO attendance VALUES (5,2);
INSERT INTO attendance VALUES (6,2);
INSERT INTO attendance VALUES (7,2);
INSERT INTO attendance VALUES (8,2);
INSERT INTO attendance VALUES (9,2);
INSERT INTO attendance VALUES (10,2);

INSERT INTO attendance VALUES (1,3);
INSERT INTO attendance VALUES (2,3);
INSERT INTO attendance VALUES (3,3);


-- Select from mentor where favorite_language is JavaScript --
SELECT * FROM mentor WHERE favourite_language = 'JS';

-- Select name from student where age is less than 18 --
SELECT * FROM student WHERE age < 25;

-- Select classe where the date is after 2020/06/01 --
SELECT * FROM classe WHERE date > '2020/06/01';

-- Select mentor where is living more than 5 years in Barcelona --
select * from mentor where years_living_bcn > 5;

-- Select classe where the topic is JavaScript --
select * from classe where topic_class = 'JS';

-- Select attendance where classe ID are 3 --
select * from attendance where classe_id = 3;

-- Select name of student where ID are 1, 2 and 3 --
select name from student where id in (1,2,3);

-- Select attendance where classe ID are 3 --
select * from attendance where classe_id  =3;

-- Provide all the students NOT living in BCN, wich postal code start with 08 --
select * from student where city != 'Barcelona' and postcode like '08%';

select * from student where city not in ('Barcelona') and postcode like '08%';

select * from student where city in ('Barcelona','Cornella');

select * from classe c join mentor m on c.leading_mentor_id  = m.id;

