
USE PublicCarParkNetworkDB;

--1. lists the car parks ordered by their total number of parking places not assigned permanently to citizens,

select c.CarPark_Name, count(p.ParkingPlace_Id) as total_numberofParking,p.AllotmentType from ParkingPlace p
join Decks d on p.Deck_Id = d.Deck_Id
join CarPark c on d.CarPark_Id = c.CarPark_Id
where p.AllotmentType = 'free'
group by c.CarPark_Name,p.AllotmentType
order by count(p.ParkingPlace_Id) asc;

--2. lists the car parks ordered by the number of currently available (i.e. free & not-citizen) parking places,

select c.CarPark_Name, count(p.IsAvailable) as numberofavailable_parkingplace from ParkingPlace p
join Decks d on p.Deck_Id = d.Deck_Id
join CarPark c on d.CarPark_Id = c.CarPark_Id
where p.IsAvailable = 'yes' and p.Allotmenttype = 'free'
group by c.CarPark_Name
order by count(p.IsAvailable) asc;

--3. lists the car parks ordered by the overall popularity in the last month (consider the guest places only
--hint: compare car-hours used to the total number of car-hours available during the month)

select c.CarPark_Name from CarPark c
join Decks d on d.CarPark_Id =c.CarPark_Id
join ParkingPlace p on d.Deck_Id = p.Deck_Id 
where exists( select * from CarStay cs 
	where cs.ParkingPlace_Id = p.ParkingPlace_Id and p.AllotmentType = 'free'
	and DATEPART(MM,CS.Arrival_Time) = '04' 
	and DATEDIFF(day, cs.Arrival_Time,cs.Departure_Time) >=0 ) 
group by CarPark_Name
order by c.CarPark_Name desc;


--4. display the 10 longest overall car stays,

select top 10 cs.Car_NumberPlate, DATEDIFF(day, cs.Arrival_Time,cs.Departure_Time) as numberofdaystayed from CarStay cs
order by numberofdaystayed desc; 
 
--5. display all currently pending, continuous car stays exceeding 2 days (consider the guest places only);

select cs.Car_NumberPlate, DATEDIFF(day, cs.Arrival_Time,SYSDATETIME()) as numberofdaysstaying from CarStay cs
join ParkingPlace p on p.ParkingPlace_Id =cs.ParkingPlace_Id
where cs.Departure_Time = '' or cs.Departure_Time is null
and DATEDIFF(day, cs.Arrival_Time,SYSDATETIME()) > 2
and p.AllotmentType = 'free'
group by cs.Car_NumberPlate,cs.Arrival_Time,cs.Departure_Time
order by numberofdaysstaying desc; 


