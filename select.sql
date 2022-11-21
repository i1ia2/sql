select  title, year from album
where year = 2018;

select name, duration from musik 
order by duration desc
limit 1;

select  name, duration from musik
where duration >= '3:50';

select  name, age from compilation
where age between 2018 and 2020;

select name from executor
where name not like  '% %';

select  name from musik
where name like 'мой';

--

select genrer_id  , count(executor_id) from artist_genres 
group by genrer_id 
order by count(executor_id); 


select name, a.album_id from musik m 
join album a on m.album_id = a.album_id 
where year between 2019 and 2020
group by name , a.album_id;

select album_id  , avg(duration) from musik  
group by album_id  
order by avg(duration) desc ;

select name, album_id from album a
join executor e on e.executor_id = e.executor_id 
where year !=  2020
group by  name, album_id  ; 

select  compilation_id , e.name ,executor_id from executor e  
join compilation c on c.compilation_id = c.compilation_id 
where e.name like '%Горшенёв%'
group by executor_id ,e.name, c.compilation_id;

select m.name from musik m 
left join music_collection mc on m.musik_id = mc.musik_id 
where duration = null;

select e.name, min(duration) from musik m 
left join executor e on m.name = e.name
group by e.name;

select title, name from album a 
join musik m on a.album_id = m.album_id 
group by title , name;
