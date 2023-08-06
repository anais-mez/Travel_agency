--------------- Insert values into the Customers table ------------------
    
INSERT INTO Customers(Lastname_c, Firstname_c, Phone_c, Email_c, Gender, Age, Total_travellers)
    VALUES
    ('Lemelin', 'Brice', '0156240499', 'BriceLemelin@dayrep-com', 'Man', '1952-11-16', 2),
    ('Fluet', 'Gabriel', '0585261506', 'GabrielFluet@armyspy-com', 'Man', '1992-07-24', 2),
    ('Plante', 'Magalie', '0580183070', 'MalagigiPlante@jourrapide-com', 'Woman', '1976-06-13', 2),
    ('Bourasse', 'Gralande', '0144279217', 'GarlandBourassa@rhyta-com', 'Woman', '1990-06-05', 2),
    ('Grimard', 'Arthur', '0695876349', 'ArthurGrimard@armyspy-com', 'Man', '1987-12-04', 2),
    ('Chandonnet', 'Yvon', '0485912436', 'YvonChandonnet@teleworm-com', 'Man', '1959-12-21', 2),
    ('Camus', 'Elodie', '0750253160', 'ElodieCamus@rhyta-com', 'Woman', '1980-03-13', 2),
    ('Meilleur', 'Clarice', '0485912436', 'ClariceMeilleur@teleworm-com', 'Woman', '1972-10-15', 2),
    ('Charrette', 'Luc', '0642193867', 'LucCharette@rytha-com', 'Man', '1982-01-09', 2),
    ('Edith', 'Jacques', '0205562086', 'JacquesEdith@dayrep-com', 'Man', '1990-06-15', 2)
    ;
    
    
    
--------------- Insert values into the Travellers table ------------------

INSERT INTO Travellers(Lastname_travel, Firstname_travel, Age, Gender, Id_c)
    VALUES
    ('Robillard', 'Frank', '1980-10-20', 'Man', 1),
    ('Allyrian', 'Louise', '1995-11-22', 'Woman', 2),
    ('Bussons', 'Merlin', '2001-04-26', 'Man', 3),
    ('Bourdette', 'Jay', '2021-08-25', 'Man', 4),
    ('Laliberté', 'Jessamine', '2013-10-30', 'Woman', 5),
    ('Josseaume', 'Gabriel', '1992-01-20', 'Man', 6),
    ('Lang', 'Anton', '2009-02-06', 'Man', 7),
    ('Caron', 'Jeannine', '2016-06-30', 'Woman', 8),
    ('Carrière', 'Adrien', '1970-10-22', 'Man', 9),
    ('Jodein', 'Madelene', '1972-05-01', 'Woman', 10)
    ;
    
        
    
--------------- Insert values into the Address table ------------------
    
INSERT INTO Address(Street_number, Street_name, Residence_name, Building_name, Floor, Zip_code, City, Complement, Type_address)
    VALUES
    (90, 'Avenue Jules Ferry', '','RUCHE',2,2200,'SOISSONS', '', 'Payment'),
    (24, 'Rue de la République', 'Les terrases du vallon', '',1,69001,'Lyon','BIS', 'payment'),
    (69, 'Rue Reine Elisabeth', '','Rivage Bleu',0,48000, 'MENDE','', 'Payment'),
    (18, 'Rue des six frères Ruellan', 'Domaine du pin', '',2,13300,'SALON-DE-PROVENCE','', 'payment'),
    (84, 'Square de la couronne', '', 'Residence 7',4,75002,'PARIS','BIS', 'Payment'),
    (77, 'Boulevard Bryas', 'Charmille', 'B7',7,77190,'DAMMAIRE-LES-LYS','', 'Payment'),
    (167, 'Rue de saint germain', 'Villa Boisée', '',5,93200,'GAGNY','', 'Payment '),
    (11, 'Rue Petit Fusterie', 'L Ecrin du bosquet', '',3,12000,'BOURG-EN-BASSE','', 'Payment '),
    (13, 'Boulevard de Normandie', '', 'Jardin des Amandiers',2,97200,'FORT-DE-FRANCE','', 'Payment '),
    (29, 'Place Charles de Gaulle', 'Villa Azalée', '',3,30100,'ALES','', 'Delivery '),
    (86, 'Rue de Genève', 'Les Balcons Canopées', '',1,17100,'SAINTES','', 'Delivery '),
    (168, 'Rue Sébastol', '', 'Vue Naturel',2,95150,'TAVERNY','BIS', 'Delivery '),
    (136, 'Rue du Faubourg National', 'Envie Bois', '',3,93000,'BOBIGNY','', 'Delivery '),
    (150, 'Avenue de l Amandier', 'Jardin des Erables', '',0,59491,'VILLENEUVE-D ASCQ','', 'Delivery '),
    (90, 'Avenue de Bouvines', 'Les Terrasses des Cimes', '',4,97233,'SCHOELCHER','', 'Staff '),
    (3, 'Quai Saint-Nicolas', '', 'Les pins MArins',0,37100,'TOURS','', 'Staff '),
    (9, 'Rue du Faubourg National', '', 'Villa Epicea',1,57100,'THIONVILLE','', 'Staff '),
    (4, 'Quai des Belges', '', 'Le Clos Boisé',5,77100,'MEAUX','', 'Staff '),
    (42, 'Rue Ernest Renan', 'Les Résidences Mimosas', '',7,77500,'CHELLES','', 'Staff '),
    (18, 'Avenue Voltaire', 'Ilot Secret', '',6,64700,'MAISONS-ALFORT','', 'Staff '),
    (85, 'Rue des Chaligny', 'Les Balcons Fleuries', '',4,33000,'BORDEAUX','', 'Staff '),
    (96, 'Avenue Millies Lacroix', 'Coté Bosquet', '',0,95600,'EAUBONNE','BIS', 'Staff '),
    (9, 'Cours Jean Jaures', '', 'Villa Flore',5,92100,'BOULOGNE-BILLANCOURT','', 'Staff '),
    (5, 'Rue du Chateau', '', 'Les clos lavande',3,97480,'SAINT-JOSEPH','', 'Staff '),
    (65, 'Avenue Jules Ferry', '', 'Ruche',4,22000,'SOISSONS','', 'Delivery '),
    (213, 'Rue de la République', 'Les terrasses du vallon', '',0,69001,'LYON','BIS', 'Delivery '),
    (52, 'Rue Reine Elisabeth', '', 'Rivage Bleu',7,48000,'MENDE','', 'Delivery '),
    (78, 'Rue des six frères', 'Domaine du pin', '',3,13300,'SALON-DE-PROVENCE','', 'Delivery '),
    (2, 'Square de la couronne', '', 'B7',5,75002,'PARIS','', 'Delivery '),
    (6, 'Boulevard Bryas', '', '',77190,'PARIS','DAMMAIRE-LES-LYS','BIS', 'Delivery ')
    ;
    
--------------- Insert values into the Staff table ------------------
    
INSERT INTO Staff(Lastname_staff, Firstname_staff, Phone_staff, Email_staff, Hiring_date, Id_a)
    VALUES
    ('Brasseur', 'Camille', '0416680319' ,'CamilleBrasseur@teleworm-us', '2014-07-16', 15),
    ('Tétrault', 'Byron', '0260646740', 'ByronTetrault@teleworm-us', '2018-11-14', 16),
    ('Périllard', 'Arridano', '0233684958', 'ArridanoPerillard@armyspy-com', '2020-04-06', 17),
    ('Gauthier', 'Fabienne', '0648736429', 'FabienneGauthier@jourrapide-com', '2022-01-16', 18),
    ('Sanschagrin', 'Ambra', '0497645821', 'AmbraSanschagrin@rhyta-com', '2012-02-25', 19),
    ('Charest', 'Arnaudm', '0470256698', 'ArnaudCharest@armyspy-com', '2016-12-09', 20),
    ('Aupry', 'Didier', '0258963758', 'DidierAupry@jourrapide-com', '2018-09-08', 21),
    ('Boule', 'Arno', '0687594569', 'ArnoBoule@rhyta-com', '2013-04-20', 22),
    ('Larocque', 'Javier', '0615364897', 'JavierLarocque@dayrep-com', '2015-10-21', 23),
    ('DeLaRonde', 'France', '0709869472', 'FranceDeLaRonde@armyspy-com', '2012-09-10', 24)
    ;
    
 --------------- Insert values into the Payment table ------------------

INSERT INTO Payment(Number_monthly_payment, Invoicing_date, Id_ticket)
    VALUES
    (1, '2022-06-25', 1),
    (3, '2022-08-01', 2),
    (3, '2022-09-01', 2),
    (3, '2022-10-01', 2),
    (4, '2021-11-01', 3),
    (4, '2021-12-01', 3),
    (4, '2022-01-01', 3),
    (4, '2022-02-01', 3),
    (5, '2021-09-01', 4),
    (5, '2021-10-01', 4),
    (5, '2021-11-01', 4),
    (5, '2021-12-01', 4),
    (5, '2022-01-01', 4),
    (1, '2020-04-27', 5),
    (2, '2021-06-01', 6),
    (2, '2021-07-01', 6),
    (4, '2021-07-01', 7),
    (4, '2021-08-01', 7),
    (4, '2021-09-01', 7),
    (4, '2021-10-01', 7),
    (3, '2022-02-01', 8),
    (3, '2022-03-01', 8),
    (3, '2022-03-01', 8),
    (2, '2021-11-01', 9),
    (2, '2021-12-01', 9),
    (3, '2020-09-01', 10),
    (3, '2020-10-01', 10),
    (3, '2020-11-01', 10)
    ;
    
 --------------- Insert values into the Length table ------------------

INSERT INTO Length(City_1, City_2, Length)
    VALUES
    ('Paris', 'Lyon', 462),
    ('Lyon', 'Nice', 472),
    ('Nice', 'Nantes', 1145),
    ('Nantes', 'Strasbourg', 860),
    ('Strasbourg', 'Paris', 488),
	('Paris', 'Nice', 931),
    ('Lyon', 'Nantes', 682),
    ('Nice', 'Strasbourg',790),
    ('Nantes', 'Paris', 380),
    ('Strasbourg', 'Lyon', 494)
    ;
    
 --------------- Insert values into the Way_point table ------------------

INSERT INTO Way_point(Flat_rate, City_w)
    VALUES
    (54, 'Paris'),
    (60, 'Lyon'),
    (46, 'Nice'),
    (65, 'Nantes'),
    (42, 'Strasbourg'),
    (54, 'Montpellier'),
    (60, 'Lille'),
    (46, 'Rennes'),
    (65, 'Reims'),
    (42, 'Saint-Etienne'),
    (42, 'Angers'),
    (54, 'Grenoble'),
    (60, 'Nîmes'),
    (46, 'Aix-en-Provence'),
    (65, 'Brest')
    ;



 --------------- Insert values into the Transport table ------------------

INSERT INTO Transport(Type_t, City_Access)
    VALUES
    ('Bus', 'Nice'),
	('Bus', 'Angers'),
	('Bus', 'Lille'),
	('Bus', 'Grenoble'),
	('Bus', 'Rennes'),
    ('Plane', 'Nîmes'),
    ('Plane', 'Nantes'),
    ('Plane', 'Paris'),
    ('Plane', 'Brest'),
    ('Train', 'Montpellier'),
	('Train', 'Strasbourg'),
	('Train', 'Aix-en-Provence'),
    ('Car', 'Lyon'),
	('Car', 'Angers'),
	('Car', 'Saint-Etienne'),
	('Car', 'Reims'),
    ('Boat', 'Nice'),
	('Boat', 'Brest')
    ;
    
 --------------- Insert values into the Ticket table ------------------

INSERT INTO Ticket(Payment_type, Payment_date, Purchase_date, Id_c)
    VALUES
    ('Card', 100, '2022-06-20', 1),
    ('Cash', 100, '2022-08-01', 2),
    ('Cheque', 100, '2021-11-01', 3),
    ('Paypal', 100, '2021-07-01', 4),
    ('Card', 100, '2020-04-01', 5),
    ('Cheque', 100, '2021-06-27', 6),
    ('Cash', 100, '2021-07-01', 7),
    ('Cheque', 100, '2022-02-01', 8),
    ('Paypal', 100, '2021-11-01', 9),
    ('Card', 100, '2020-09-01', 10)
    ;
    
    
    
    
--------------- Insert values into the Trip table ------------------
    
INSERT INTO Trip(Start_date, Start_time, End_date, End_time)
    VALUES
  
    ('2022-08-19', '23:26:55', '2022-09-06', '11:06:20'),
    ('2022-11-02', '09:04:30', '2022-11-28', '07:54:00'),
    ('2022-03-25', '15:43:13', '2022-04-15', '02:15:48'),
    ('2021-12-22', '13:59:14', '2022-01-11', '22:21:44'),
    ('2020-08-29', '18:59:11', '2020-11-06', '07:24:45'),
    ('2021-08-01', '23:16:13', '2021-08-24', '18:56:36'),
    ('2021-10-28', '14:46:18', '2021-11-08', '23:13:05'),
    ('2022-05-15', '10:22:11', '2022-05-29', '23:32:27'),
    ('2022-01-11', '02:56:57', '2022-01-25', '22:54:12'),
    ('2020-12-06', '01:21:24', '2020-12-25', '21:08:29')
    ;


 --------------- Insert values into the customers_address table ------------------

INSERT INTO customers_address( Id_a_Address, Id_c_Customers)
    VALUES
    (1, 1),
    (1,25),
    (2, 2),
    (2,26),
    (3, 3),
    (3,27),
    (4, 4),
    (4, 28),
    (5, 5),
    (5,29),
    (6,6),
    (6,30),
    (7,7),
    (7,11),
    (8,8),
    (8,12),
    (9,9),
    (9,13),
    (10,10),
    (10,14)
    ;
    
 --------------- Insert values into the customers_trip table ------------------

INSERT INTO customers_trip(Id_trip_Trip, Id_c_Customers)
    VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10)
    ;
    
    
 --------------- Insert values into the staff_trip table ------------------

INSERT INTO staff_trip(Id_trip_Trip, Id_staff_Staff)
    VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10)
    ;
    
    
    
 --------------- Insert values into the ticket_length table ------------------

INSERT INTO ticket_length(Id_length_Length, Id_ticket_Ticket)
    VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 10),
    (3, 5),
    (3, 1),
    (3, 7),
    (4, 6),
    (4, 8),
    (5, 9),
    (5, 1),
    (5, 2),
    (6, 10),
    (6, 7),
    (7, 1),
    (7, 7),
    (7, 9),
    (8, 2),
    (8, 3),
    (9, 6),
    (10, 6),
    (10, 8),
    (10, 10)
    ;
    
    
    
 --------------- Insert values into the ticket_way_point table ------------------

INSERT INTO ticket_way_point( Id_w_Way_point, Id_ticket_Ticket)
    VALUES
    (1, 2),
    (1, 3),
    (2, 5),
    (3, 1),
    (3, 2),
    (3, 4),
    (4, 3),
    (5, 1),
    (5, 2),
    (6, 2),
    (6, 4),
    (7, 2),
    (7, 4),
    (8, 3),
    (9, 3),
    (10, 3),
    (10, 5),
    (10, 2)
    ;



 --------------- Insert values into the trip_length table ------------------

INSERT INTO trip_length(Id_trip_Trip, Id_length_Length)
    VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 10),
    (3, 5),
    (3, 1),
    (3, 7),
    (4, 6),
    (4, 8),
    (5, 9),
    (5, 1),
    (5, 2),
    (6, 10),
    (6, 7),
    (7, 1),
    (7, 7),
    (7, 9),
    (8, 2),
    (8, 3),
    (9, 6),
    (10, 6),
    (10, 8),
    (10, 10)
    ;



--------------- Insert values into the trip_transport table ------------------

INSERT INTO trip_transport(Id_trip_Trip, Id_t_Transport)
    VALUES
    (1, 8),
    (1, 13),
    (1, 1),
    (2, 7),
    (2, 11),
    (3, 11),
    (3, 8),
    (3, 13),
    (4, 8),
    (4, 1),
    (5, 7),
    (5, 8),
    (5, 13),
    (6, 11),
    (6, 13),
    (7, 8),
    (7, 13),
    (7, 7),
    (8, 13),
    (8, 1),
    (9, 8),
    (10, 8),
    (10, 1),
    (10, 11)
    ;


--------------- Insert values into the trip_way_point table ------------------

INSERT INTO trip_way_point(Id_trip_Trip, Id_w_Way_point)
    VALUES
    (1, 2),
    (1, 3),
    (2, 5),
    (3, 1),
    (3, 2),
    (3, 4),
    (4, 3),
    (5, 1),
    (5, 2),
    (6, 2),
    (6, 4),
    (7, 2),
    (7, 4),
    (8, 3),
    (9, 3),
    (10, 3),
    (10, 5),
    (10, 2)
    ;
