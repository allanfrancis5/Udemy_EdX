 --Loading EdX table
SELECT *
  FROM [PortfolioProject].[dbo].[edx_courses$]

--Creating a function to extract numbers from the 'price' column
create function Numbers 
(
  @input varchar(255)
) 
returns float 
as 
begin 
	declare @alphaindex int = Patindex('%[^0-9,.]%', @input) 
	begin 
		while @alphaindex > 0 
			begin
			set @input = STUFF(@input, @alphaindex, 1, '') 
			set @alphaindex = PATINDEX('%[^0-9,.]%', @input) 
			end
	end 
	return @input 
end

select price, [PortfolioProject].dbo.Numbers(price) as pricenew
from [PortfolioProject].[dbo].[edx_courses$]


--Udemy table
SELECT [course_id]
      ,[course_title]
      ,[price]
      ,[num_subscribers]
      ,[num_lectures]
      ,[level]
      ,[content_duration]
      ,[subject]
FROM [PortfolioProject].[dbo].[udemy_courses$]
order by num_subscribers desc


--Number of edX courses
select count( distinct title)
from [PortfolioProject].[dbo].[edx_courses$]

--Number of Udemy courses
select count( distinct course_title)
from [PortfolioProject].[dbo].udemy_courses$


--Average Price for all EdX courses
select avg(dbo.Numbers(price)) as EdX_avg
from [PortfolioProject].[dbo].[edx_courses$]

--Average Price for all Udemy courses
select AVG(price) as Udemy_avg
from [PortfolioProject].[dbo].udemy_courses$


--Difficulty Level of the courses on EdX
select count(*), Level
from [PortfolioProject].[dbo].[edx_courses$]
group by Level

--Difficulty Level of the courses on EdX
select count(*), Level
from [PortfolioProject].[dbo].udemy_courses$
group by Level

