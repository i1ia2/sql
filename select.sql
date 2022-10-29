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
where name not like '% %';

select  name from musik
where name like 'мой';