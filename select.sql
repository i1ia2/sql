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


select count(a.album_id)  from musik m 
join album a on m.album_id = a.album_id 
where year   cvbetween 2019 and 2020
group by  a.album_id;

select album_id  , avg(duration) from musik  
group by album_id  
order by avg(duration) desc ;

select  e.name from executor e
where e.name not in (
	select distinct name from executor e2  
	join album_tupe at2 on e2.executor_id  = at2.executor_id 
	join album a on a.album_id = at2.album_id 
	where a.year = 2020
	)
order by e.name ;



select distinct c.name from compilation c 
join music_collection mc on c.compilation_id = mc.compilation_id 
join musik m on m.musik_id = mc.musik_id 
join album a on a.album_id = m.album_id  
join album_tupe at2 on at2.album_id  = a.album_id 
join executor e on e.executor_id = at2.executor_id 
where e.name like '%Горшенёв%'
 	 
6

select title from album a 
join album_tupe at2 on at2.album_id = a.album_id 
join executor e on e.executor_id = at2.executor_id 
join artist_genres ag on ag.executor_id = e.executor_id 
join genrer g on g.genrer_id = ag.genrer_id 
group by title 
having count(distinct g.genrer_id) > 1
order by title 

select m.name from musik m 
left join music_collection mc on m.musik_id = mc.musik_id 
where duration = null;


select e.name, m.duration from musik m
join album a on a.album_id = m.album_id 
join album_tupe at2 on at2.executor_id = a.album_id 
join executor e on e.executor_id = at2.executor_id 
group by e.name, m.duration 
having m.duration = (select min(duration)from musik m2)
order by e.name


select title from album a 
join musik m on a.album_id = m.album_id 
where m.album_id in (
	select album_id from musik m2
	group by album_id 
	having count(album_id) =(
		select count (album_id) from musik m3 
		group by album_id
		order by count limit 1
		)
	)
order by title ;

