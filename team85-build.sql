SET FOREIGN_KEY_CHECKs = 0;
DROP TABLE IF EXISTS House_type CASCADE;
DROP TABLE IF EXISTS Tenants CASCADE;
DROP TABLE IF EXISTS Tenants_phone CASCADE;
DROP TABLE IF EXISTS Property_Managers CASCADE;

DROP TABLE IF EXISTS property_managers_phone CASCADE;
DROP TABLE IF EXISTS Rental_Properties CASCADE;
DROP TABLE IF EXISTS Lease CASCADE;
DROP TABLE IF EXISTS Property_Managers_Rental_Properties CASCADE;



DROP TABLE IF EXISTS Deposits CASCADE;
DROP TABLE IF EXISTS Damages CASCADE;
DROP TABLE IF EXISTS Background_Check CASCADE;
DROP TABLE IF EXISTS individual_property_owners CASCADE;
SET FOREIGN_KEY_CHECKs = 1;
	
CREATE TABLE Property_Managers (
	SSN VARCHAR(50),
	Fname VARCHAR(50),
	Mname VARCHAR(50),
	Lname VARCHAR(50),
	Address VARCHAR(50),
	DOB VARCHAR(50),
	Email_Address VARCHAR(50),
    PRIMARY KEY (SSN))
	ENGINE = innodb;
	
CREATE TABLE Rental_Properties (
	Property_ID INT,
	Address VARCHAR(50),
	Num_people INT,
	month_price VARCHAR(50),
	included_utilities VARCHAR(50),
	Wifi_included VARCHAR(50),
	Walking_distance INT,
	Square_footage INT,
    PRIMARY KEY (Property_ID))
	ENGINE = innodb;
	
CREATE TABLE Tenants (
	Tenant_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(50),
	dob VARCHAR(50),
	email_address VARCHAR(50),
	credit_score INT,
	emergency_contact VARCHAR(50),
    SSN VARCHAR(50),
    PRIMARY KEY (Tenant_id),
    FOREIGN KEY (SSN) REFERENCES Property_Managers (SSN))
	ENGINE = innodb;
	
CREATE TABLE House_type (
	Apartment_number INT,
	Rent_fee VARCHAR(50),
	Floor_type INT,
	Property_Managers_SSN VARCHAR(50),
    manager_SSN VARCHAR(50),
	House_Tenant_id INT,
    PRIMARY KEY (Apartment_number),
    FOREIGN KEY (manager_SSN) REFERENCES Property_Managers (SSN),
    FOREIGN KEY (House_Tenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;

CREATE TABLE Tenants_phone (
	Tenant_id INT,
	Phone VARCHAR(50),
	Type1 VARCHAR(50),
    PRIMARY KEY (Phone),
    FOREIGN KEY (Tenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;

CREATE TABLE property_managers_phone (
	phone VARCHAR(50),
	phone_type VARCHAR(50),
    SSN VARCHAR(50),
    PRIMARY KEY (Phone),
    FOREIGN KEY (SSN) REFERENCES Property_Managers (SSN))
	ENGINE = innodb;

CREATE TABLE Lease (
	lease_id INT,
	price FLOAT,
	duration INT,
	start_date VARCHAR(50),
	end_date VARCHAR(50),
	number_of_people_on_lease INT,
	apartment_type VARCHAR(50),
	Cosigner VARCHAR(50),
    Tenant_id INT,
    PRIMARY KEY (lease_id),
    FOREIGN KEY (Tenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;



CREATE TABLE Property_Managers_Rental_Properties (
	PMRP_ID INT,
	managerSSN VARCHAR(50),
	mProperty_ID INT,
	PRIMARY KEY (PMRP_ID),
    FOREIGN KEY (managerSSN) REFERENCES Property_Managers (SSN),
    FOREIGN KEY (mProperty_ID) REFERENCES Rental_Properties (Property_ID))
	ENGINE = innodb;


-- Weak Entities

CREATE TABLE Deposits (
	Lease_id INT,
	One_month_rent VARCHAR(50),
	Tenant_id INT,
	Lease_agreement_id VARCHAR(50),
	FOREIGN KEY (Lease_id) REFERENCES Lease (Lease_id),
    FOREIGN KEY (Tenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;


CREATE TABLE Damages (
	Damage_Type VARCHAR(50),
	Damage_Cost FLOAT,
	dTenant_id INT,
    FOREIGN KEY (dTenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;



CREATE TABLE Background_Check (
	Approval_status VARCHAR(50),
	DOB VARCHAR(50),
	Lease_address VARCHAR(50),
	Crime_history VARCHAR(50),
	Requires_disability_accommodation VARCHAR(50),
	bcTenant_id INT,
    FOREIGN KEY (bcTenant_id) REFERENCES Tenants (Tenant_id))
	ENGINE = innodb;


CREATE TABLE individual_property_owners (
	fname VARCHAR(50),
	mname VARCHAR(50),
	lname VARCHAR(50),
	phone VARCHAR(50),
	state VARCHAR(50),
	city VARCHAR(50),
	address VARCHAR(50),
	zip INT,
	date_of_birth VARCHAR(50),
	email_address VARCHAR(50),
	percentage_to_pay DECIMAL(6,2),
    SSN VARCHAR(50),
    Property_ID INT,
    FOREIGN KEY (SSN) REFERENCES Property_Managers (SSN),
    FOREIGN KEY (Property_ID) REFERENCES Rental_Properties (Property_ID))
	ENGINE = innodb;

insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('309-27-5552', 'Banky', 'Rivi', 'Dinley', '7629 Montana Road', '11/25/1940', 'rdinley0@dion.ne.jp');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('486-91-7316', 'Marchall', 'Michal', 'Molen', '0 Kedzie Terrace', '11/27/1918', 'mmolen1@state.gov');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('235-01-5876', 'Port', 'Hailey', 'Bente', '1535 Ramsey Crossing', '8/23/1984', 'hbente2@xinhuanet.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('466-32-4380', 'Esmaria', 'Mick', 'Elby', '260 Redwing Way', '12/11/1924', 'melby3@nih.gov');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('542-21-4639', 'Gaven', 'Waldo', 'Dufton', '64 Carberry Alley', '3/20/1907', 'wdufton4@fema.gov');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('317-74-7411', 'Pepito', 'Chaddy', 'Evesque', '38 Hansons Lane', '6/11/1992', 'cevesque5@who.int');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('469-60-2211', 'Freeland', 'Evaleen', 'Bockmaster', '2811 Acker Place', '8/18/1922', 'ebockmaster6@europa.eu');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('303-89-8349', 'Audi', 'Jess', 'Feeham', '35407 Clemons Court', '3/1/2018', 'jfeeham7@exblog.jp');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('789-65-3443', 'Brigg', 'Ailis', 'Shrimpton', '10266 Clarendon Crossing', '1/23/1906', 'ashrimpton8@house.gov');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('334-60-3725', 'Myrtle', 'Gavin', 'Jozefczak', '4 Shelley Trail', '7/11/1988', 'gjozefczak9@gizmodo.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('812-83-3110', 'Claybourne', 'Tonia', 'McKibbin', '17317 Autumn Leaf Lane', '3/18/1942', 'tmckibbina@fc2.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('208-28-9059', 'Mar', 'Emile', 'Shillinglaw', '2 Grayhawk Plaza', '4/13/1943', 'eshillinglawb@dedecms.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('254-40-3946', 'Myrtice', 'Jacob', 'Kilbride', '67005 Troy Trail', '3/22/1905', 'jkilbridec@chron.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('478-82-0382', 'Ashlie', 'Rube', 'Marshland', '32 Fairview Circle', '2/17/1962', 'rmarshlandd@youtube.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('412-34-8881', 'Teresita', 'Immanuel', 'Insley', '1 Clove Road', '6/10/1998', 'iinsleye@wikispaces.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('100-11-4076', 'Cassaundra', 'Odelle', 'Joskovitch', '50 Oak Valley Park', '4/23/1968', 'ojoskovitchf@hibu.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('847-19-9345', 'Hastie', 'Tomkin', 'Maseyk', '80915 American Ash Drive', '10/16/2009', 'tmaseykg@wikimedia.org');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('847-77-5035', 'Benedicta', 'Nap', 'Culshew', '7161 Transport Road', '1/19/1947', 'nculshewh@dion.ne.jp');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('768-49-2670', 'Eleonora', 'Beatrice', 'Makiver', '70 Hallows Junction', '7/17/2009', 'bmakiveri@friendfeed.com');
insert into Property_Managers (SSN, Fname, Mname, Lname, Address, DOB, Email_Address) values ('773-28-1304', 'Rosalind', 'Ignace', 'Salzburger', '44823 Steensland Circle', '8/19/1951', 'isalzburgerj@nasa.gov');


insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (1, '49 Lyons Trail', 1, '$2833.71', 'Job', true, 1, 1);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (2, '76 Bluestem Way', 2, '$9360.22', 'Bitchip', true, 2, 2);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (3, '883 Hoard Place', 3, '$17964.23', 'Voyatouch', true, 3, 3);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (4, '016 Milwaukee Avenue', 4, '$16179.21', 'Pannier', true, 4, 4);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (5, '36 Norway Maple Circle', 5, '$10443.44', 'Span', true, 5, 5);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (6, '30 Charing Cross Crossing', 6, '$25018.14', 'Prodder', false, 6, 6);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (7, '24781 Clyde Gallagher Terrace', 7, '$25269.64', 'Tempsoft', false, 7, 7);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (8, '371 Norway Maple Plaza', 8, '$7559.52', 'Subin', false, 8, 8);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (9, '91608 Utah Park', 9, '$20099.86', 'Keylex', false, 9, 9);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (10, '8 Steensland Street', 10, '$20393.56', 'It', true, 10, 10);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (11, '3872 Northland Trail', 11, '$2751.55', 'Asoka', false, 11, 11);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (12, '130 Macpherson Drive', 12, '$18310.47', 'Andalax', false, 12, 12);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (13, '205 Valley Edge Avenue', 13, '$8874.23', 'Fintone', true, 13, 13);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (14, '3 Brentwood Court', 14, '$6228.94', 'Otcom', true, 14, 14);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (15, '7024 Stephen Place', 15, '$3405.51', 'Ronstring', true, 15, 15);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (16, '3 Oak Valley Alley', 16, '$16640.59', 'Biodex', true, 16, 16);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (17, '10 Sachs Point', 17, '$19266.38', 'Y-find', false, 17, 17);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (18, '678 Merchant Plaza', 18, '$2401.33', 'Zoolab', true, 18, 18);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (19, '20491 Shelley Junction', 19, '$12482.41', 'Zamit', true, 19, 19);
insert into Rental_Properties (Property_ID, Address, Num_people, month_price, included_utilities, Wifi_included, Walking_distance, Square_footage) values (20, '17549 Dwight Park', 20, '$13433.29', 'Tin', true, 20, 20);

insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (1, 'Giorgia', 'Vedmore', '051 Corscot Road', '4/13/1974', 'gvedmore0@accuweather.com', 769, 'Giorgia Vedmore', '309-27-5552');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (2, 'Staford', 'Archbould', '5375 Bartelt Alley', '7/14/1972', 'sarchbould1@mozilla.com', 567, 'Staford Archbould', '486-91-7316');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (3, 'Theadora', 'Westfalen', '11833 Sutherland Trail', '9/3/1992', 'twestfalen2@nymag.com', 696, 'Theadora Westfalen', '235-01-5876');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (4, 'Dennet', 'Ollive', '975 Hollow Ridge Point', '6/20/1989', 'dollive3@domainmarket.com', 696, 'Dennet Ollive', '466-32-4380');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (5, 'Luise', 'Phizackarley', '40 Lake View Street', '6/29/1983', 'lphizackarley4@hexun.com', 558, 'Luise Phizackarley', '542-21-4639');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (6, 'Meta', 'Senter', '6 Melby Street', '1/19/1988', 'msenter5@wired.com', 721, 'Meta Senter', '317-74-7411');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (7, 'Skip', 'Guslon', '97 Atwood Center', '10/18/1978', 'sguslon6@booking.com', 537, 'Skip Guslon', '469-60-2211');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (8, 'Homerus', 'Pummery', '0009 Golf Park', '3/30/1997', 'hpummery7@miibeian.gov.cn', 576, 'Homerus Pummery', '303-89-8349');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (9, 'Vittoria', 'Pearlman', '3233 Sunfield Street', '7/12/1984', 'vpearlman8@infoseek.co.jp', 757, 'Vittoria Pearlman', '789-65-3443');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (10, 'Tuesday', 'Rivett', '33 Saint Paul Pass', '7/30/1977', 'trivett9@google.de', 619, 'Tuesday Rivett', '334-60-3725');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (11, 'Ellie', 'Blackburn', '0378 Florence Road', '7/19/1999', 'eblackburna@drupal.org', 564, 'Ellie Blackburn', '812-83-3110');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (12, 'Harmonie', 'Kiossel', '324 Bowman Road', '5/3/2002', 'hkiosselb@purevolume.com', 556, 'Harmonie Kiossel', '208-28-9059');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (13, 'Marti', 'Rawsen', '22 Swallow Alley', '8/16/1977', 'mrawsenc@npr.org', 651, 'Marti Rawsen', '254-40-3946');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (14, 'Giulietta', 'Antrum', '1049 Morrow Road', '12/6/1991', 'gantrumd@wired.com', 764, 'Giulietta Antrum', '478-82-0382');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (15, 'Leoline', 'Deakan', '20 Hallows Avenue', '2/16/2000', 'ldeakane@patch.com', 531, 'Leoline Deakan', '412-34-8881');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (16, 'De', 'Grafom', '5 Hovde Crossing', '11/18/1988', 'dgrafomf@salon.com', 572, 'De Grafom', '100-11-4076');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (17, 'Daniela', 'Bohlin', '0 Brentwood Hill', '4/28/1975', 'dbohling@census.gov', 692, 'Daniela Bohlin', '847-19-9345');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (18, 'Gib', 'Paybody', '610 Nelson Lane', '3/5/2003', 'gpaybodyh@huffingtonpost.com', 622, 'Gib Paybody', '847-77-5035');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (19, 'Shayne', 'Saura', '18 Ilene Way', '11/12/1993', 'ssaurai@about.com', 502, 'Shayne Saura', '768-49-2670');
insert into Tenants (Tenant_id, first_name, last_name, address, dob, email_address, credit_score, emergency_contact, SSN) values (20, 'Hillery', 'Van der Mark', '350 Bunker Hill Terrace', '11/6/1996', 'hvanj@tripadvisor.com', 656, 'Hillery Van der Mark', '773-28-1304');

insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (1, '$16443.32', 1, '443-81-5457', '309-27-5552', 1);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (2, '$4652.77', 2, '361-90-0677', '486-91-7316', 2);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (3, '$13785.10', 3, '101-79-9010', '235-01-5876', 3);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (4, '$12727.62', 4, '274-30-2642', '466-32-4380', 4);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (5, '$21962.62', 5, '293-26-1116', '542-21-4639', 5);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (6, '$12600.06', 6, '325-93-0192', '317-74-7411', 6);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (7, '$23092.51', 7, '586-38-9901', '469-60-2211', 7);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (8, '$4380.90', 8, '782-31-1585', '303-89-8349', 8);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (9, '$10445.00', 9, '427-43-8862', '789-65-3443', 9);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (10, '$4258.31', 10, '316-83-1081', '334-60-3725', 10);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (11, '$9804.32', 11, '342-94-7445', '812-83-3110', 11);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (12, '$28025.99', 12, '224-77-3555', '208-28-9059', 12);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (13, '$11591.28', 13, '766-17-1860', '254-40-3946', 13);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (14, '$28871.65', 14, '897-26-7299', '478-82-0382', 14);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (15, '$19819.12', 15, '421-62-6989', '412-34-8881', 15);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (16, '$25617.41', 16, '482-21-3527', '100-11-4076', 16);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (17, '$5319.69', 17, '626-34-8871', '847-19-9345', 17);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (18, '$6817.97', 18, '823-11-4436', '847-77-5035', 18);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (19, '$11880.02', 19, '528-36-5922', '768-49-2670', 19);
insert into House_type (Apartment_number, Rent_fee, Floor_type, Property_Managers_SSN, manager_SSN, House_Tenant_id) values (20, '$26481.27', 20, '613-13-7323', '773-28-1304', 20);

insert into Tenants_phone (Phone, Type1) values ('858-728-8425', 'Right-sized');
insert into Tenants_phone (Phone, Type1) values ('362-897-4299', 'hardware');
insert into Tenants_phone (Phone, Type1) values ('329-717-3324', 'optimal');
insert into Tenants_phone (Phone, Type1) values ('122-827-9968', 'throughput');
insert into Tenants_phone (Phone, Type1) values ('125-160-7017', 'transitional');
insert into Tenants_phone (Phone, Type1) values ('303-783-3228', 'time-frame');
insert into Tenants_phone (Phone, Type1) values ('530-977-8145', 'User-centric');
insert into Tenants_phone (Phone, Type1) values ('214-888-8000', 'Networked');
insert into Tenants_phone (Phone, Type1) values ('155-919-9197', 'artificial intelligence');
insert into Tenants_phone (Phone, Type1) values ('178-472-5930', 'Programmable');
insert into Tenants_phone (Phone, Type1) values ('443-169-9109', 'Fully-configurable');
insert into Tenants_phone (Phone, Type1) values ('915-805-1832', 'Progressive');
insert into Tenants_phone (Phone, Type1) values ('147-926-8428', 'mission-critical');
insert into Tenants_phone (Phone, Type1) values ('102-695-3041', 'installation');
insert into Tenants_phone (Phone, Type1) values ('424-172-0826', 'portal');
insert into Tenants_phone (Phone, Type1) values ('227-579-9183', 'Synergized');
insert into Tenants_phone (Phone, Type1) values ('814-412-4521', 'complexity');
insert into Tenants_phone (Phone, Type1) values ( '686-995-2840', 'intermediate');
insert into Tenants_phone (Phone, Type1) values ('406-519-0619', 'Extended');
insert into Tenants_phone (Phone, Type1) values ( '432-862-6217', 'database');

insert into property_managers_phone (phone, phone_type) values ('148-703-6484', 'Optional' );
insert into property_managers_phone (phone, phone_type) values ('679-721-3596', 'analyzing');
insert into property_managers_phone (phone, phone_type) values ('625-368-3975', 'Operative');
insert into property_managers_phone (phone, phone_type) values ('450-794-2041', 'Synergistic');
insert into property_managers_phone (phone, phone_type) values ('297-135-8709', 'Automated');
insert into property_managers_phone (phone, phone_type) values ('916-902-3291', '5th generation');
insert into property_managers_phone (phone, phone_type) values ('583-277-2710', 'optimizing');
insert into property_managers_phone (phone, phone_type) values ('611-291-3920', 'Mandatory');
insert into property_managers_phone (phone, phone_type) values ('918-806-3544', 'dedicated');
insert into property_managers_phone (phone, phone_type) values ('972-622-0448', 'portal');
insert into property_managers_phone (phone, phone_type) values ('198-679-6652', 'hybrid');
insert into property_managers_phone (phone, phone_type) values ('458-155-8809', 'multi-tasking');
insert into property_managers_phone (phone, phone_type) values ('194-157-7069', 'demand-driven');
insert into property_managers_phone (phone, phone_type) values ('840-827-5849', 'De-engineered');
insert into property_managers_phone (phone, phone_type) values ('313-352-7165', 'concept');
insert into property_managers_phone (phone, phone_type) values ('275-976-4577', 'hardware');
insert into property_managers_phone (phone, phone_type) values ('287-401-1697', 'Exclusive');
insert into property_managers_phone (phone, phone_type) values ('979-565-0185', 'array');
insert into property_managers_phone (phone, phone_type) values ('619-840-3005', 'User-friendly');
insert into property_managers_phone (phone, phone_type) values ('616-238-2225', 'solution');

insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (1, 1948.64, 3, '3/2/2022', '11/22/2022', 2, 'bandwidth-monitored', 'Moyra Minty', 1);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (2, 2746.77, 3, '7/12/2021', '9/21/2022', 1, 'Devolved', 'Miner Pover', 2);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (3, 2934.34, 2, '7/7/2021', '4/30/2022', 4, 'optimal', 'Minna Derrell', 3);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (4, 2651.94, 2, '4/27/2021', '2/14/2023', 5, 'Open-architected', 'Merline Alwell', 4);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (5, 2484.91, 3, '10/10/2021', '10/20/2022', 1, 'Organized', 'Ami Ghilks', 5);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (6, 1426.77, 2, '8/9/2021', '12/10/2022', 2, 'directional', 'Sherman Thaim', 6);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (7, 1841.63, 3, '1/2/2022', '6/1/2022', 4, 'Realigned', 'Homere Amsden', 7);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (8, 1157.01, 1, '4/27/2021', '1/31/2023', 1, 'Profound', 'Ingrid Connikie', 8);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (9, 1641.76, 1, '5/29/2021', '4/5/2023', 3, 'Upgradable', 'Garth McKennan', 9);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (10, 1092.42, 4, '2/5/2022', '1/9/2023', 4, 'Synchronised', 'Patten Dodds', 10);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (11, 2080.16, 1, '5/26/2021', '3/31/2023', 4, 'heuristic', 'Elnora Dowsey', 11);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (12, 1656.40, 2, '10/18/2021', '10/16/2022', 5, 'static', 'Feodora Riccardelli', 12);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (13, 1680.38, 1, '1/10/2022', '8/8/2022', 2, 'Re-engineered', 'Tarah Stuchberry', 13);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (14, 2982.69, 3, '9/7/2021', '8/31/2022', 5, 'Re-contextualized', 'Drucy Westfield', 14);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (15, 1774.11, 4, '6/30/2021', '4/5/2023', 5, 'Programmable', 'Thalia Henrique', 15);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (16, 2393.45, 3, '7/9/2021', '12/19/2022', 1, 'Automated', 'Lillian Gofford', 16);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (17, 1852.06, 2, '9/28/2021', '9/15/2022', 3, 'impactful', 'Ring Brugh', 17);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (18, 2772.59, 1, '3/19/2022', '12/17/2022', 5, 'Decentralized', 'Lizzy Wiggans', 18);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (19, 695.47, 4, '9/3/2021', '10/12/2022', 5, 'Grass-roots', 'Angil Grinaugh', 19);
insert into Lease (lease_id, price, duration, start_date, end_date, number_of_people_on_lease, apartment_type, Cosigner, Tenant_id) values (20, 2118.97, 1, '12/30/2021', '5/18/2022', 4, 'interface', 'Palmer Sidnall', 20);

insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (1,'309-27-5552',1);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (2,'486-91-7316' ,2);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (3,'235-01-5876' ,3);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (4,'466-32-4380' ,4);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (5,'542-21-4639' ,5);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (6,'317-74-7411' ,6);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (7,'469-60-2211' ,7);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (8,'303-89-8349' ,8);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (9,'789-65-3443' ,9);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (10,'334-60-3725' ,10);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (11,'812-83-3110' ,11);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (12,'208-28-9059' ,12);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (13,'254-40-3946' ,13);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (14,'478-82-0382' ,14);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (15,'412-34-8881' ,15);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (16,'100-11-4076' ,16);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (17,'847-19-9345' ,17);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (18,'847-77-5035' ,18);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (19,'768-49-2670' ,19);
insert into Property_Managers_Rental_Properties (PMRP_ID, managerSSN, mProperty_ID) values (20,'773-28-1304' ,20);

insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ( '$2211.81', 1, 1);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ( '$1933.92', 2, 2);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$1740.37', 3, 3);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$2945.98', 4, 4);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$845.84', 5, 5);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$1091.18', 6, 6);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$726.59',7,7);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ('$1019.83', 8, 8);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$972.08', 9, 9);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ('$2566.50', 10, 10);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ('$2044.77', 11, 11);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ('$1620.31', 12, 12);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ('$681.40', 13, 13);
insert into Deposits (One_month_rent, Tenant_id,  Lease_agreement_id ) values ( '$1243.35', 14, 14);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$2618.02', 15, 15);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$2775.46', 16, 16);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$2693.17', 17, 17);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$2028.32', 18, 18);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$1810.22', 19, 19);
insert into Deposits (One_month_rent, Tenant_id, Lease_agreement_id ) values ('$1926.91', 20, 20);






-- Damages


insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('None', 0, 1);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('None', 0,2);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('None', 0,3);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Persistent', 4173.63,4);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Advanced', 4016.33,5);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('portal', 2428.13,6);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Fundamental', 3887.59,7);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('pricing structure', 1427.28,8);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Triple-buffered', 1102.62,9);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('methodology', 3747.37,10);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('challenge', 4799.44,11);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Focused', 2319.90,12);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('tangible', 2106.50,13);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('modular', 224.04,14);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('model', 2311.03,15);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('Reverse-engineered', 370.67,16);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('heuristic', 3513.99,17);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('transitional', 4087.34,18);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('synergy', 1375.66,19);
insert into Damages (Damage_Type, Damage_Cost, dTenant_id) values ('object-oriented', 1857.44,20);

-- Background_Check

insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '8/26/2021', '87 Grasskamp Court', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '7/20/2021', '60 Luster Park', false, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '7/4/2021', '4 Green Avenue', false, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '8/6/2021', '953 Arizona Parkway', true, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '4/4/2022', '10 Mandrake Parkway', false, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '1/8/2022', '040 Vahlen Hill', true, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '7/15/2021', '70 Northland Pass', false, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '2/22/2022', '01 Burning Wood Drive', true, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '10/11/2021', '49943 Upham Place', false, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '3/19/2022', '96810 Mcguire Way', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '3/15/2022', '87682 Ruskin Terrace', true, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '10/23/2021', '16122 Hanover Plaza', true, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '7/26/2021', '9084 Comanche Place', true, false);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '3/16/2022', '05 Nelson Center', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '9/10/2021', '47509 Laurel Drive', true, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '8/2/2021', '1120 Canary Place', true, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '9/25/2021', '40154 Magdeline Trail', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '3/11/2022', '49158 Duke Way', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (true, '10/2/2021', '79809 Kenwood Hill', false, true);
insert into Background_Check (Approval_status, DOB, Lease_address, Crime_history, Requires_disability_accommodation) values (false, '2/10/2022', '9 Anthes Park', false, true);

-- individual_property_owners

insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Rurik', 'Malcolm', 'Formie', '862-432-7998', null, 'Wudui', '998 Logan Trail', 43486, '11/27/2021', 'mformie0@washington.edu', 49.5);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Marie', 'Bronson', 'Rosander', '854-543-7833', null, 'Shibajiazi', '37 Miller Way', 23887, '1/20/2022', 'brosander1@addtoany.com', 69.9);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Blanche', 'Antonella', 'Cuniam', '719-860-7057', 'Colorado', 'Colorado Springs', '299 Spohn Lane', 83369, '7/20/2021', 'acuniam2@squidoo.com', 24.7);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Thaddeus', 'Kaine', 'Klais', '233-814-7614', null, 'Bandaran', '585 Quincy Lane', 55269, '3/19/2022', 'kklais3@delicious.com', 70.0);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Mitchael', 'Aretha', 'Lean', '430-371-8850', null, 'Mondoteko', '5 Forest Lane', 41530, '5/31/2021', 'alean4@edublogs.org', 24.2);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Annmaria', 'Briant', 'Andriss', '813-504-7576', null, 'Agía Foteiní', '14801 Charing Cross Pass', 15131, '3/11/2022', 'bandriss5@dmoz.org', 69.6);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Borg', 'Barri', 'Alldread', '537-798-8465', null, 'Miaotang', '1 Lake View Street', 62161, '10/23/2021', 'balldread6@yandex.ru', 81.0);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Pancho', 'Hildy', 'Ekell', '645-991-0611', null, 'Phanat Nikhom', '93659 Myrtle Court', 36215, '6/9/2021', 'hekell7@techcrunch.com', 72.2);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Queenie', 'Lonee', 'Maulkin', '929-326-4726', null, 'Shigu', '414 Farmco Avenue', 8046, '2/4/2022', 'lmaulkin8@sphinn.com', 23.3);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Vladimir', 'Quintilla', 'Grimme', '919-943-4611', 'North Carolina', 'Raleigh', '8711 Sherman Circle', 84227, '7/31/2021', 'qgrimme9@blogger.com', 26.1);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Freda', 'Nikolai', 'Kippax', '828-943-4836', null, 'Sentul', '9805 Birchwood Circle', 24764, '10/9/2021', 'nkippaxa@cpanel.net', 36.5);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Yvette', 'Jobey', 'Kidstone', '564-286-8411', null, 'Novosemeykino', '590 Talisman Way', 19298, '1/15/2022', 'jkidstoneb@meetup.com', 86.6);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Rex', 'Amos', 'Vergo', '217-182-4420', null, 'Duobao', '627 Heffernan Street', 77576, '11/3/2021', 'avergoc@theglobeandmail.com', 1.0);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Kelvin', 'Pegeen', 'Girsch', '891-324-1471', null, 'El Congo', '44073 Hazelcrest Alley', 60759, '10/29/2021', 'pgirschd@tmall.com', 27.5);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Brady', 'Layne', 'Jobke', '395-586-4437', null, 'Citangtu Kaler', '91 Hagan Court', 74208, '2/23/2022', 'ljobkee@wsj.com', 22.4);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Judith', 'Sebastien', 'Govinlock', '516-869-1138', null, 'Perivólia', '4 Lunder Pass', 53945, '9/1/2021', 'sgovinlockf@home.pl', 73.1);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Robena', 'Kass', 'Kleewein', '580-935-2747', null, 'Cikawunggading', '432 Declaration Center', 92596, '10/8/2021', 'kkleeweing@guardian.co.uk', 9.5);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Micah', 'Martita', 'Verbrugghen', '366-391-7939', null, 'Mukayrās', '50560 Clarendon Street', 80102, '7/19/2021', 'mverbrugghenh@guardian.co.uk', 79.5);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Gearard', 'Constance', 'Kingswold', '868-152-5630', null, 'Suwaru', '51 Macpherson Street', 94131, '10/5/2021', 'ckingswoldi@blogspot.com', 33.7);
insert into individual_property_owners (fname, mname, lname, phone, state, city, address, zip, date_of_birth, email_address, percentage_to_pay) values ('Cirilo', 'Roxanna', 'Beville', '656-502-5693', null, 'Xialiao', '47370 Daystar Avenue', 25581, '10/4/2021', 'rbevillej@vkontakte.ru', 3.0);





