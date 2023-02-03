## Drop any pre-existing tables

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS classSize;
DROP TABLE IF EXISTS disposal;
DROP TABLE IF EXISTS boat;
DROP TABLE IF EXISTS rental_Reservation;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS orders; 
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS sell;

SET FOREIGN_KEY_CHECKS = 1;

## Create the tables

CREATE TABLE customer (
    customerID INT,
    customerFName VARCHAR(32),
    customerSName VARCHAR(32),
    customerNum VARCHAR(32),
    customerAdd VARCHAR(64),
    customerEmail VARCHAR(32)
	);
    
CREATE TABLE supplier (
	supplierID INT,
    manufName VARCHAR(64),
    manufNum VARCHAR(32),
    manufAdd VARCHAR(64),
    manufEmail VARCHAR(32),
    partinStock VARCHAR(32), 
    partQuantity INT,
    boatSpecs VARCHAR(32),
    boatPrice INT,
    deliveryStatus VARCHAR(32),
    PRIMARY KEY (supplierID)
	);
    
    CREATE TABLE boat (
	boatID INT,
    modelName VARCHAR(32),
    manufID INT,
    purchaseDate VARCHAR(32),
    boatCost INT,
    boatType VARCHAR(32),
    reservationCards VARCHAR(32),
    lastService VARCHAR(32),
    PRIMARY KEY (boatID),
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES supplier(supplierID)
	);
    
    CREATE TABLE maintenance (
    boatID INT,
    refNo INT,
    faultDetails VARCHAR(32),
    faultDate VARCHAR(32),
    actionTaken VARCHAR(32),
    actionDate VARCHAR(32),
    boatPriority INT,
	spareParts  VARCHAR(32) REFERENCES stock(spareParts)
	);
    
	CREATE TABLE classSize (
    `priceFull` INT,
    `priceHalf` INT,
    `boatType` VARCHAR(32)
	);
    
	CREATE TABLE rental_Reservation (
    custNo INT REFERENCES customer(customerID),
	resNo INT,
    paid VARCHAR(32),
    rentalDate VARCHAR(32),
    boatType VARCHAR(32) REFERENCES boat(boatType),
    days VARCHAR(32),
    hirePrice INT,
    boatID INT REFERENCES boat(boatID),
    dueDate VARCHAR(32),
    returnDate VARCHAR(32),
    cName VARCHAR(32),
    email VARCHAR(32),
    postcode VARCHAR(32),
    tel VARCHAR(32)
	);
    
    CREATE TABLE disposal (
    dealerID INT,
    dealerName VARCHAR(64),
    dealerNum VARCHAR(32),
    dealerAdd VARCHAR(64),
    dealerEmail VARCHAR(32)
	);
    
    CREATE TABLE sell ( 
    DealerID INT,
    boatID INT ,
    sellDate VARCHAR(32),
    sellPrice INT
    );
    
CREATE TABLE stock (
	spareParts  VARCHAR(32) PRIMARY KEY,
    partID INT,
    partinStock VARCHAR(32), 
    partQuantity INT
	);
    
CREATE TABLE orders (
	supplierID NUMERIC,
    spareParts VARCHAR(32),
    PRIMARY KEY (supplierID,spareParts),
    customerEmail VARCHAR(32)
	);
    
## Insert data into the tables

 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	1, 'Explorer', 1, '22-Nov-10', 3910, 'Std_MBoat', '22-oct-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	2, 'TurboSail ', 2, '12-Oct-09', 840, 'VLrg_SBoat', '8-Oct-19' 
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	3, 'MasterSail ', 2, '12-Oct-15', 3240, 'Lrg_SBoat', '12-Oct-20'
	);

 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	4, 'SmallSailor', 3, '12-Nov-15', 2040, 'Sml_SBoat', '14-Oct-20' 
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	5, 'SmallSailor', 3, '12-Nov-15', 2040, 'Sml_SBoat', '13-Oct-20' 
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	6, 'Grande', 5, '14-Jan-15', 5440, 'Lrg_MBoat', '15-Oct-20'
	);
    
INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	7, 'Grande', 5, '14-Jan-15', 5440, 'Lrg_MBoat', '13-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	8, 'Turbo Mid ', 2, '14-Jan-15', 5440, 'Std_MBoat', '13-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	9, 'RowStream', 3, '12-Jan-15', 440, 'Lrg_RBoat', '10-Aug-20' 
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	10, 'RowerX', 4, '12-Jan-15', 320, 'Std_RBoat', '22-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	11, 'Explorer', 1, '10-Jan-16', 3320, 'Lrg_SBoat', '3-Mar-20'
	);
    
INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	12, 'Navigator', 1, '10-Jan-16', 3320, 'Std_SBoat', '3-Apr-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	13, 'Turbo Mid', 2, '14-Feb-18', 4440, 'Std_MBoat', '14-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	14, 'Turbo Mid', 2, '14-Feb-18', 4440, 'Std_MBoat', '13-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	15, 'MasterBlaster', 7, '14-Jan-18', 5440, 'Lrg_MBoat', '14-Oct-19'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	16, 'HappyRower', 8, '10-Jan-18', 340, 'Lrg_RBoat', '2-oct-20'
	);
    
INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	17, 'HappyRower', 8, '10-Jan-18', 340, 'Sml_RBoat', '2-oct-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	18, 'Streamer', 3, '9-Jan-17', 640, 'VLrg_RBoat', '7-oct-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	19, 'Great Row', 4, '19-Jan-19', 650, 'VLrg_RBoat', '12-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	20, 'SuperBlaster', 7, '14-Jan-18', 7440, 'VLrg_MBoat', '7-Aug-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	21, 'Lizard', 6, '9-Jan-17', 340, 'Std_RBoat', '4-Oct-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	22, 'Grande', 5, '14-Feb-18', 5440, 'Lrg_MBoat', '13-Sep-20'
	);
    
 INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
 VALUES (
 	23, 'MasterSail', 2, '12-Oct-15', 3240, 'Lrg_SBoat', '27-Jan-20'
	);
    
INSERT INTO boat (boatID, modelName, manufID, purchaseDate, boatCost, boatType, lastService)
VALUES 
(24, 'SigMan', 14, '12-Dec-15', 5440, 'Lrg_MBoat', '27-Jan-20'),
(25, 'Chad', 4, '11-Oct-13', 3240, 'Lrg_SBoat', '21-Feb-21'),
(26, 'Josiah', 1, '22-Jan-15', 340, 'Std_RBoat', '24-Mar-22'),
(27, 'Xah', 17, '15-Apr-14', 7440, 'VLrg_MBoat', '25-Apr-19'),
(28, 'Sup Catch', 22, '17-Mar-18', 650, 'VLrg_RBoat', '20-May-20');

    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 1, 'Dion', 'Brodnecke', '07174826351', '9 Oak Street, Liverpool, L34 8DY', 'dbroes1d@who.int'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 2, 'Scarlett', 'Galley', '03260476982', '886 Northport Parkway, Liverpool, L3 6DF', 'scargr1c@imgur.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 3, 'Sissy', 'Gadson', '04924556740', '95 Putney Road, Liverpool, L2 7YG', 'sgadson1b@ucoz.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 4, 'Tabby', 'Minichi', '07795213673', '6 Amoth Court, Warrington, WT6 8UY', 'minitabc@imgur.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 5, 'Nellie', 'Greenmon', '03816078215', '40 Graceland Crossing, Liverpool, L23 8FY', 'nelliegreen12@patch.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 6, 'Hanny', 'Marsters', '07075576685', '2 Almo Trail, Liverpool, L21 9FY', 'hmarsters@netlog.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 7, 'Oswell', 'Aspinell', '09931348133', '64 Jackson Road, Liverpool, L5 6FH', 'OsAspinell@digg.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 8, 'Florance', 'Baston', '07315082134', '40 Magdeline Lane, Warrington, WT5 8WK', 'FloBar@dirtg.com'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 9, 'Candice', 'Tumilson', '01639824657', '1 Farragut Parkway, Liverpool, L75 8GJ', 'canditum15@bloomberg.com'
	);

INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES (
 	 10, 'Clair', 'Bavin', '06245985897', '87 Toban Drive, Liverpool, L26 8GH', 'clairBav@sprog.it'
	);
    
INSERT INTO customer (customerID, customerFName, customerSName, customerNum, customerAdd, customerEmail)
VALUES 
(11, 'Cram', 'Bones', '0567475477897', '47 Grob Drive, Rochdale, G34 6SD', 'CBones@italia.it'),
(12, 'Core', 'Booney', '057457547897', '67 Tan Lane, Liverpool, F45 2SF', 'CBooney@america.com'),
(13, 'Cathy', 'Booms', '046547547497', '77 Tob Street, Oldham, O24 3DF', 'CBooms@jean.co.uk'),
(14, 'Clarence', 'Band', '046624574797', '84 Ton Close, Liverpool, F24 3HG', 'CBand@lore.it'),
(15, 'Cat', 'Baba', '0547254757475897', '83 Ten Drive, London, W03 3FS', 'CBaba@boom.jp');

INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
 VALUES (
 	 1, 'Dalis Vannoort', '07574137463', '77 A828, Appin, AP7 6GU', 'dvannoort0@salon.com'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 2, 'Joe’s Junk', '07365534221', '15 Back Lane, Buxton, BX7 5FY ', 'JoesJunk@zdnet.com'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 3, ' Hoebart Kubera', '07874051869', '4 Finedon House, Marine Parade, Littlestone, LS4 6GU', 'hkubera2@who.int'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 4, 'Eva Iacomettii', '07880072148', '9 Hartlands, Onslow Road, Newent, NW5 8TU', 'eiacomettii3@admin.ch'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 5, 'Alley Pate', '07822040557', '07610 Arizona Alley, A67 8GU', 'apate4@gnu.org'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 6, ' Korrie Legge', '07380018233', '1076 Evesham Road, Astwood Bank, DT5 8JO', 'klegge5@reference.com'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 7, ' Minne Hinkens', '07978390430', '53 Balby Road, Balby, B7 8HK', 'mhinkens6@smh.com.au'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 8, 'Inigo MacAllaster', '07893419552', '1910 Farwell Plaza, G56 9FT', 'imacallaster7@blogspot.com'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 9, 'Linell Skeeles', '07532931207', '57 Great Russell Street, London, NW1 8TU', 'lskeeles8@goo.gl'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES (
 	 10, 'Sioux Drogan', '07417098738', '75 Thomas Parsons Square, Ely, EL6 9GU', 'sdrogan9@dropbox.com'
	);
    
INSERT INTO disposal (dealerID, dealerName, dealerNum, dealerAdd, dealerEmail)
VALUES 
(11, 'Sam Bones', '07417098738', 'Exeter St Thomas, Exeter, EX4 1RA', 'samB@dropbox.com'),
(12, 'Bob Boorgir', '07453657658', '25 Thomas Street, Birmingham, BS7 6KD', 'BobbyBoy@Gmail.com'),
(13, 'Timmy Tamtam', '074767575675', '424 Bob Ross Square, London, EG1 3YU', 'Timmeh23@Hotmail.com'),
(14, 'Hamza Ali Rakesh Bin Suleman Ul Saeed', '074453566758', '93 Dog Road, Oldham, OL5 8SF', 'Businessman@Gmail.com'),
(15, 'Olajide Olatunji', '0645332348', '24 Hat Close, Manchester, MF6 2FK', 'KSI@Yahoo.co.uk');
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	1,' SuperBoat', '01772459666', 'Unit 7 Centurion Court, Leyland, LE10 2DJ', 'admin@superboat.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	2, 'Explorer Boats UK', '01704807654', 'Meadow Lane, Burscough, BU56 8GH', 'admin@explorerboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	3, 'The Northwich Boat Company', '01270160160', 'Unit 1 Kings Lock Boatyard Booth Lane, Middlewich, MW67 7GY', 'admin@northwichboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	4, 'Collingwood Boat Builders', '01513742985', '29 Townsend Street, Collingwood, CL27 2DU', 'admin@collingwoodboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	5, 'Elton Moss Boat Builders', '01270760160', 'Unit 4 Kings Lock Boatyard Booth Lane, Middlewich, MW63 8TY', 'admin@eltonmossboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	6, 'Aintree Boat Company Ltd', '01515239000', 'Brookfield Drive, Liverpool, L1 6GU', 'admin@aintreeboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	7, 'Braidbar Boats Ltd', '01625873471', 'Lord Vernons Wharf Lyme Road Higher, Poynton, PY12 9TS', 'admin@braidbarboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	8, 'Bourne Boat Builders Ltd', '01785714692', 'Teddesley Road, Penkridge, PE8 7SU', 'admin@bourneboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	9, 'Stoke on Trent Boat Building Co Ltd', '01782813831', 'Longport Wharf Station Street, Stoke-on-Trent, ST6 9GU', 'admin@stokeboats.co.uk' 
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES ( 
	10, 'MGM Boats Narrowboat Builders', '01162640009', '27 Mill Lane, Leicester, LE6 9FY', 'admin@mgmboats.co.uk'
	); 
    
INSERT INTO supplier (supplierID, manufName, manufNum, manufAdd, manufEmail) 
VALUES 
(11, 'Bobs Boats', '0154389475', '27 Mill Close, Leicester, LE7 8FY', 'Bob@Bobboats.com'),
(12, 'Tims Boats', '0154389475', '24 Grab Street, Leicester, LR3 1PZ', 'Tim@Timboats.com'),
(13, 'Cats Boats', '0453782427', '17 London Road, London, LO5 8FH', 'Cat@Catboats.com'),
(14, 'Robs Boats', '0353454366', '42 Toad Lane, Rochdale, OL12 9BJ', 'Rob@Robboats.com'),
(15, 'Stacys Boats', '05477547745', '69 Broken Dream Boulevard, New York, NY1 8ID', 'Stacy@Stacyboats.com'); 
    
INSERT INTO classSize (`priceFull`, `priceHalf`, `boatType`)
VALUES 
(240, 170, 'VLrg_SBoat'),
(180, 120, 'Lrg_SBoat'),
(160, 100, 'Std_SBoat'),
(140, 90, 'Sml_SBoat'),
(280, 175, 'VLrg_MBoat'),
(240, 150,'Lrg_MBoat'),
(200, 125, 'Std_MBoat'),
(170, 110, 'Sml_MBoat'),
(160, 100, 'VLrg_RBoat'),
(140, 90, 'Lrg_RBoat'),
(120, 80, 'Std_RBoat'),
(110, 70, 'Sml_RBoat');

INSERT INTO sell (DealerID, boatID, sellDate, sellPrice)
VALUES
(2, 1, '02-Jan-2020', 1500),
(2, 2, '10-Oct-2019', 1600);

INSERT INTO sell (DealerID, boatID, sellDate, sellPrice)
VALUES
(1, 3, '02-Jan-2020', 1500),
(1, 4, '04-Dec-2021', 1500),
(1, 5, '25-Jul-2022', 1500),
(1, 6, '28-Feb-2021', 1500),
(1, 7, '10-Oct-2019', 1600);

INSERT INTO maintenance (boatID, refNo, faultDetails, faultDate, actionTaken, actionDate, boatPriority)
VALUES
(1, 1, 'Chipped propeller', '15feb15', 'Replace Propeller', '27feb15', 3),
(1, 2, 'Bilge pumps gone', '10jul15', 'New bilge pumps', '27aug15', 1),
(1, 3, '', '', 'New head pumps', '15aug15', 2),
(1, 4, '', '', 'Normal Service', '20mar16', 2),
(1, 5, 'Cutless bearing worn through', '02dec16', 'Fit new bearing ', '27jan17', 2);

INSERT INTO maintenance (boatID, refNo, faultDetails, faultDate, actionTaken, actionDate, boatPriority)
VALUES
(3, 1, 'Damaged mast', '17apr16 ', 'Repair Mast', '27apr16', 1),
(3, 2, 'Bent Forestay', '10jul17', 'Replace Forestay', '22aug17', 2),
(3, 3, 'Shot Boom', '07may18', 'Replace Boom', '06june18', 1),
(3, 4, 'Rudderstock Chipped', '07jul19', 'Replace Rudderstock', '08jul19', 2),
(3, 5, '', '', 'Normal Service', '27jan20', 2),
(3, 6, 'Rudderblade busted ', '19oct20', '', '', 1);

INSERT INTO maintenance (boatID, refNo, faultDetails, faultDate, actionTaken, actionDate, boatPriority)
VALUES
(5, 1, 'Hole in deck', '13feb16', 'Patch up hole', '15feb16', 1),
(5, 2, 'Bilge pumps gone', '10jul15', 'New bilge pumps', '27aug15', 1),
(5, 3, 'Torn sail', '1feb15', 'Replace Sail', '10feb15', 1),
(5, 4, 'Broken Propeller', '25feb15', 'Replace Propeller', '27feb15', 1),
(5, 5, 'Rusted bearing', '02dec16', 'Fit new bearing ', '27jan17', 2);

INSERT INTO rental_Reservation (custNo, resNo, paid, rentalDate, boatType, Days, hirePrice, boatID) 
VALUES 
(1, 5344, 'Y', '20-10-2020', 'Lrg Rboat', 1, 280, 9), 
(2, 5345, 'Y', '20-10-2020', ' Sml Rboat', 1, 220, 16),  
(9, 5347, 'Y', '20-10-2020', 'Lrg Mboat', 1, 240, 7), 
(4, 5346, 'Y', '20-10-2020', 'Lrg Mboat', 1, 240, 6), 
(7, 5349, 'Y', '20-10-2020', 'Lrg Rboat', 1, 140, 9), 
(6, 5348, 'Y', '20-10-2020', 'Lrg Mboat', 1, 240, 15), 
(2, 5350, 'Y', '20-10-2020', 'Lrg Sboat', 1, 180, 9), 
(5, 5352, 'Y', '20-10-2020', 'Lrg Rboat', 1, 110, 16), 
(5, 5353, 'Y', '20-10-2020', 'Sml Rboat', 1, 110, 17), 
(9, 5354, 'Y', '20-10-2020', 'Std Mboat', 2, 400, 14), 
(2, 5351, 'Y', '20-10-2020', 'Lrg Sboat', 1, 180, 11), 
(8, 5364, 'Y', '20-10-2020', 'Sml Sboat', 1, 110, 4), 
(9, 5355, 'Y', '20-10-2020', 'Std Mboat', 2, 400, 13), 
(1, 5356, 'Y', '20-10-2020', 'Std Mboat', 1, 200, 8), 
(6, 5357, 'Y', '20-10-2020', 'Std Mboat', 1, 120, 1), 
(7, 5358, 'Y', '20-10-2020', 'Std RBoat', 1, 280, 10),  
(10, 5366, 'Y', '20-10-2020', 'Std Rboat', 0.5, 80, 21), 
(4, 5360, 'Y', '20-10-2020', 'VLrg Mboat', 1, 280, 20),  
(8, 5361, 'Y', '20-10-2020', 'VLrg Sboat', 1, 240, 2),  
(10, 5359, ' ', '20-10-2020', 'Std Sboat', 1, 160, NULL), 
(3, 5362, ' ', '20-10-2020', 'VLrg Rboat', 1, 100, NULL), 
(3, 5365, ' ', '20-10-2020', 'Std Rboat', 1, 120, NULL), 
(3, 5363, ' ', '20-10-2020', 'VLrg Rboat', 1, 100, NULL), 
(1, 5342, 'Y', '27-04-2020', 'Lrg Sboat', 1, 180, 16), 
(4, 5341, ' ', '20-10-2019', 'Lrg Mboat', 1, 240, 6), 
(2, 5343, 'Y', '09-12-2019', 'Lrg Mboat', 1, 240, 6),
(1, 5673, ' ', '24-10-2019', 'Lrg Sboat', 1, 180, 1),
(2, 5972, ' ', '25-10-2019', 'Lrg Mboat', 1, 240, 6),
(3, 5353, 'Y', '26-10-2019', 'Lrg Sboat', 1, 180, 9),
(4, 5835, ' ', '27-10-2019', 'Lrg Rboat', 1, 110, 5),
(5, 5856, 'Y', '28-10-2019', 'Std Rboat', 1, 120, 1); 

INSERT INTO rental_Reservation (resNo, rentalDate, Days, hirePrice, dueDate, returnDate, cName, email, postcode, tel) 
VALUES 
(4734, '02may19', 0.5, 125, '02may', '02may', 'John Terry', 'Terry2D@ok.com', 'SE10 1NH', '0201772227'),
(4745, '03may19', 0.5, 125, '03may', '03may', 'Justin Bieber', 'Beiber@pop.com', 'LABC564', '0167756413'),
(4812, '04may19', 2, 400, '05may', '06may', 'David Hockney', 'hockers@gall.com', 'N1 1XY', '0154326412'),
(4875, '06may19', 1, 200, '06may', '06may', 'David Blaine', 'blaine@magic.org', 'N1 1XY', '0154326412'),
(NULL, '', NULL, NULL, '', '', '', '', '', '');

INSERT INTO stock (spareParts, partID, partInStock, partQuantity)
VALUES
('Propeller',1, 'Y', 2),
('Sail',2, 'Y', 6),
('Bearings',3, 'Y', 20),
('Bilge pumps',4, 'N', 0),
('Rudder blade',5, 'N', 0);

INSERT INTO orders (supplierID, spareParts, customerEmail)
VALUES
 (1, 'Propeller', 'CBones@italia.it'),
 (2, 'Sail', 'CBooney@america.com'),
 (3, 'Bearings', 'CBooms@jean.co.uk'),
 (4, 'Bilge pumps', 'CBand@lore.it'),
 (5, 'Rudder blade', 'CBaba@boom.jp');

COMMIT;