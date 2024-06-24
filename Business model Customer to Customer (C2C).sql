#1Create new schema as ecommerce
create database ecommerces;
use ecommerces;

#3 Run SQL command to see the structure of table
select * from users_data;
desc users_data;

#4 Run SQL command to select first 100 rows of the database
select * from users_data limit 100;


#5 How many distinct values exist in table for field country and language
select language,country from users_data;
select count(distinct country),count(distinct language) from users_data;

 

#6Check whether male users are having maximum followers or female users.
select socialNbFollowers,socialNbFollows from users_data;

select gender,max(socialNbFollowers) from users_data group by gender;

 

#7
#Calculate the total users those
#Uses Profile Picture in their Profile
#Uses Application for Ecommerce platform
#Uses Android app
#Uses ios app

select * from users_data ;
select 'Profile Picture',count(hasProfilePicture) from users_data where hasProfilePicture='True'
union
select 'ios app',count(hasIosApp) from users_data where hasIosApp='True'
union
select 'Android app',count(hasAndroidApp) from users_data where hasAndroidApp='True'
union
select 'Application for Ecommerce platform',count(hasAnyApp) from users_data where hasAnyApp='True';

#8
#Calculate the total number of buyers for each country and
#sort the result in descending order of total number of buyers.

select country,sum(productsBought) total_number_of_buyer from users_data group by country
order by total_number_of_buyer desc ;


#9
#Calculate the average number of sellers for each country and sort the result in ascending
#order of total number of sellers.

select country,avg(productsSold) total_number_of_sellers from users_data group by country
order by sum(productsSold) asc;

#select country,avg(productsSold) total_number_of_sellers from users_data group by country
#order by total_number_of_sellers asc;


#10
#Display name of top 10 countries having maximum products pass rate.
select country,sum(productsPassRate) top from users_data group by country order by sum(productsPassRate) desc limit 10;


#11
#Calculate the number of users on an ecommerce platform for different language choices.
select * from users_data;
select language ,count(type) users from users_data group by language;

#12
#Check the choice of female users about putting the product in a wishlist or to like
#socially on an ecommerce platform.
select * from users_data;

select gender,sum(productsWished), sum(socialProductsLiked) from users_data where gender='F' and hasAnyApp='True';

#13
#Check the choice of male users about being seller or buyer.
select gender,sum(productsBought),sum(productsSold) from users_data where gender='M';

#14
#Which country is having maximum number of buyers?
select country,sum(productsBought) buyer from users_data group by country order by sum(productsBought) desc limit 1;

#15
#List the name of 10 countries having zero number of sellers.
select * from users_data;
select country,sum(productsSold) sellers from users_data group by country order by sum(productsSold) limit 10;


#16
#Display record of top 110 users who have used ecommerce platform recently.
select * from users_data order by daysSinceLastLogin limit 110;


#17
#Calculate the number of female users those who have not logged in since last 100 days.
select count(gender) from users_data where gender='F' and daysSinceLastLogin>100;

#18
#Display the number of female users of each country at ecommerce platform.

select country,count(gender) female from users_data where gender='F' group by country;

#19
#Display the number of male users of each country at ecommerce platform.
select country,count(gender) mail from users_data where gender='M' group by country;

#20
#Calculate the average number of products sold and bought on ecommerce platform by male users
#for each country.

select * from users_data;
select avg(productsSold),avg(productsBought),gender,country from users_data where gender='M' group by country ;

 