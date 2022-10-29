CREATE table if not exists genrer(
	genrer_id SERIAL primary KEY,
	name VARCHAR (60) not null,
	discription VARCHAR(80) not null,
	popularity INTEGER not null
);

insert into genrer (name, discription, popularity)
values ('Хип хоп','Молодежный жанр','8'),('Рок', 'Нет возраста', '10'),('Панк рок', 'Горшок жив', '10'),
('Рэп', 'На любителя', '5'),('Поп', 'Их большинство', '7');

create table if not exists artist_genres(
	genrer_id INTEGER references genrer(genrer_id),
	executor_id INTEGER references  executor(executor_id),
	constraint pk primary key (genrer_id, executor_id)
);

insert into artist_genres(genrer_id, executor_id)
values ('5','1'),('4','2'),('1','3'),('5','4'),('5','5'),('5','6'),('7','7'),('3','8');

create table if not exists executor(
	executor_id SERIAL primary key,
	age INTEGER not null,
	name VARCH5AR(60) not null
);

insert into executor(age, name)
values('99', 'Лепс'),('50', 'Баста'),('18', 'Милохин'),('51', 'Ласковый Май'),('18', 'Сергей'),('56', 'Филип'),('66', 'Боря'),('18', 'Горшенёв');

create table if not exists album(
	album_id SERIAL primary key,
	title VARCHAR(50) not null,
	year INTEGER not null
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
values('1','3'),('2','7'),('3','8'),('4','4'),('5','5'),('6','6'),
('7','2'),('8','1');



create table if not exists musik(
	musik_id SERIAL primary key,
	duration INTEGER not null,
	rating INTEGER not null,
	album_id INTEGER not null references album(album_id)
);

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
	age INTEGER not null
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

insert into music_collection(musik_id,compilation_id)
values('1','6'),('2','6'),('3','3'),('4','1'),('5','1'),('6','1'),('7','1'),('8','4'),
('9','3'),('10','2'),('11','8'),('12','5'),('13','3'),('14','3'),('15','7');
