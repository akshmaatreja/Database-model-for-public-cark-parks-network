
use PublicCarParkNetworkDB;
--Task 3 Indexes

--1 Indexing all FK columns which is used for join operations

create nonclustered index IX_CarPark_System_ID 
	on CarPark(System_ID )

create nonclustered index IX_Decks_CarPark_ID
	on Decks(CarPark_ID)

create nonclustered index IX_ParkingPlace_Deck_ID
	on ParkingPlace(Deck_ID)

create nonclustered index IX_CarStay_ParkingPlace_Id
	on CarStay(ParkingPlace_Id)

create nonclustered index IX_CarStay_Car_NumberPlate
	on CarStay(Car_NumberPlate)

--2 Indexing for all columns frequently used for SEARCH operations

create nonclustered index CX_CarPark_CarParkName
	on CarPark(carpark_name)

create nonclustered index CX_CarPark_IsSlotAvailable
	on CarPark(IsSlotAvailable)

create nonclustered index CX_ParkingPlace_IsAvailable
	on ParkingPlace(IsAvailable)

create nonclustered index CX_ParkingPlace_Allotmenttype
	on ParkingPlace(Allotmenttype)

create nonclustered index CX_CarOwnerDetails_car_numberPlate
	on CarOwnerDetails(car_numberPlate)

create nonclustered index CX_CarStay_Arrival_time
	on CarStay(Arrival_time)

create nonclustered index CX_CarStay_Departure_time
	on CarStay(Departure_time)

