CREATE table if not exists genrer(
	genrer_id SERIAL primary KEY,
	name VARCHAR (60) not null,
	discription VARCHAR(80) not null,
	popularity VARCHAR(120) not null
);

insert into genrer (name, discription, popularity)
values ('Хип хоп','Молодежный жанр','8/10'),('Рок', 'Нет возраста', '10/10'),('Панк рок', 'Горшок жив', '20/10'),
('Рэп', 'На любителя', '5/10'),('Поп', 'Их большинство', '7/10'));

delete from genrer  
where genrer_id = 6;

create table if not exists artist_genres(
	genrer_id INTEGER references genrer(genrer_id),
	executor_id INTEGER references  executor(executor_id),
	constraint pk primary key (genrer_id, executor_id)
);

insert into artist_genres(genrer_id, executor_id)
values ('7','8'),('5','9'),('2','10'),('7','11'),('7','13'),('7','14'),('3','15'),('4','16');

create table if not exists executor(
	executor_id SERIAL primary key,
	age VARCHAR(10) not null,
	name VARCHAR(60) not null
);

insert into executor(age, name)
values('18', 'Горшенёв');

delete from executor  
where executor_id = 12;

create table if not exists album(
	album_id SERIAL primary key,
	title VARCHAR(50) not null,
	year INTEGER(10) not null
);

insert into album (title, year)
values('Корль и шут','1996'),('Бунт на корабле','2004'),('Лаберин','2006'),
('Водопад','2009'),('Я','2016'),('Маскарад','1990'),('40','2020'),('БУМ','2021');

create table if not exists album_tupe(
	executor_id INTEGER references executor(executor_id),
	album_id INTEGER references album(album_id),
	constraint daf primary key (executor_id,album_id)
);

insert into album_tupe(executor_id, album_id) 
values('16','1'),('10','8'),('8','4'),('14','5'),('12','7'),('9','7'),('11','6'),
('13','3'),('15','2');



create table if not exists musik(
	musik_id SERIAL primary key,
	duration VARCHAR(100),
	rating VARCHAR(10)
	album_id INTEGER not null references album(album_id)
);
alter table musik
add name VARCHAR(30) null;

insert into musik(duration, rating, album_id, name)
values('03:44', '6','3', 'Зеркала'),('03:29', '8','3', 'Орлы или Вороны'),('03:58', '7','3', 'Я счастливый'),
('03:13', '10','1', 'Прыгну со скалы'),('02:15', '7','1', 'Два друга'), ('02:31', '7','2','Охотник'),
('03:08', '7','2', 'Хозяин леса'),('03:10', '6','5', 'Цвет настроения черный'),
('03:20', '5','8', 'Башня'),('03:24', '7','4', 'лето'),
('06:56:', '8','6', 'Седая ночь'),('01:00', '5','7', 'Звонки на мобильный'),('04:05', '9','4', '18 мне уже'),
('04:33', '9','4', 'Когда мы были молодыми'),('03:41', '7','7', 'Маленький');

create table if not exists compilation(
	compilation_id SERIAL primary key,
	name VARCHAR(60) not null,
	age VARCHAR(10) not null
);

insert into compilation(name, age) 
values('КиШ лучшие 50 песен','2019'),('Русские хиты 90-х','2021'),('Хит Нон стоп','2020'),
('Филип Киркоров топ-20','2018'),('Баста топ 10','2017'),('Григорий Лепс - 10','2021'),
('Навеки ваш 2004','2017'),('Белые розы','2009');

create table if not exists music_collection(
	compilation_id INTEGER references compilation(compilation_id),
	musik_id INTEGER references musik(musik_id),
	constraint dar primary key (compilation_id,musik_id)
);

insert into music_collection(compilation_id, musik_id)
values('1','7'),('2','12'),('3','3'),('4','10'),('5','14'),('6','4'),('7','12'),('8','13'),('1','6'),('2','15'),('2','16'),('3','17'),('6','5'),('3','11'),('1','8');

