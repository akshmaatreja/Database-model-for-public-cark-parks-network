DROP PROCEDURE IF EXISTS MoveToTheNearestPlace;
GO

CREATE PROCEDURE MoveToTheNearestPlace
		@carpark_id varchar(50)
AS
DECLARE
		@isslotavail varchar(50),
		@deckid int,
		@parkingplace varchar(50),
		@carparkname varchar(50)

		SELECT @carparkname = CarPark_Name FROM CarPark WHERE  CarPark_Id = @carpark_id 

		PRINT @carparkname+'('+@carpark_id+') is closed'
		PRINT ''

DECLARE k CURSOR LOCAL FOR
		SELECT ParkingPlace_Id FROM ParkingPlace P JOIN DECKS D ON D.Deck_Id = P.Deck_Id WHERE D.CarPark_Id = @carpark_id AND P.AllotmentType = 'PERMANENT'

OPEN k
FETCH NEXT FROM k INTO @parkingplace
WHILE(@@FETCH_STATUS = 0)

BEGIN
		SELECT @isslotavail =IsSlotAvailable FROM CarPark WHERE @carpark_id = CarPark_Id 

		SET @isslotavail = 'NO'

		SELECT @parkingplace = P.ParkingPlace_Id FROM ParkingPlace P
		WHERE P.Deck_Id = @deckid and p.AllotmentType = 'permanent'

		PRINT 'Parking place reserved for citizens : '+@parkingplace
		
		IF @isslotavail = 'NO'  
		BEGIN
			
			PRINT 'The parking place is allocated in nearby parking place' 
			UPDATE ParkingPlace SET  IsAvailable = 'no' 
			WHERE AllotmentType = 'permanent' 
			and ParkingPlace_Id != @parkingplace 
			
			PRINT ''
		
		END
					

FETCH NEXT FROM k INTO @parkingplace
END
CLOSE k
DEALLOCATE k
GO

EXEC  MoveToTheNearestPlace 'MW';