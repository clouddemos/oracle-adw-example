
   CREATE TABLE pplantdata.COUNTRY(
      id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
      Code VARCHAR2(4) not null,
      Name VARCHAR2(100) not null,
      Population NUMBER(15),
	  CountryKey VARCHAR2(100) not null,
	  CONSTRAINT uk_country UNIQUE (CountryKey)
   ); 


   CREATE TABLE pplantdata.PFUEL 
      (ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
      Fuel VARCHAR2(20) not null ,
      Renewable VARCHAR2(1) default 'U' not null,
	  CONSTRAINT uk_fuel_key UNIQUE (Fuel)
   ); 

   CREATE TABLE pplantdata.PPLANT 
      (ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
      Plant_Name VARCHAR2(200) not null,
      PlantKey VARCHAR2(100) not null,
      Capacity_Mw NUMBER(*,5),
      Latitude VARCHAR2(50) NOT NULL,
      Longitude VARCHAR2(50) NOT NULL,
      Country VARCHAR2(100) NOT NULL,
      Primary_Fuel VARCHAR2(20) NOT NULL,
      Secondary_Fuel1 VARCHAR2(20),
      Secondary_Fuel2 VARCHAR2(20),
      Secondary_Fuel3 VARCHAR2(20),
      Est_Gen_Gwh_1Year NUMBER(*,5),
      Commission_Year NUMBER,
	  Plant_Owner VARCHAR2(200),
	  CONSTRAINT uk_plant UNIQUE (PlantKey),
	  CONSTRAINT fk_country
		FOREIGN KEY (Country)
		REFERENCES COUNTRY(CountryKey),
	  CONSTRAINT fk_fuel
		FOREIGN KEY (Primary_Fuel)
		REFERENCES PFUEL(Fuel)
	); 

	  
	  
   CREATE TABLE pplantdata.PGEN 
      (ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
      Country VARCHAR2(100) not null,
      Plant VARCHAR2(100) not null,
      Plant_Name VARCHAR2(200) not null,
	  Capacity_Mw NUMBER(*,5),
      Primary_Fuel VARCHAR2(20) not null ,
	  Rank_By_Capacity Number(6),
      Rank_by_Capacity_Renewable Number(6),
      CONSTRAINT fk_country_pgen
		FOREIGN KEY (Country)
		REFERENCES COUNTRY(CountryKey),
	  CONSTRAINT fk_pplant
		FOREIGN KEY (Plant)
		REFERENCES PPLANT(PlantKey),
	  CONSTRAINT fk_pgen_fuel
		FOREIGN KEY (Primary_Fuel)
		REFERENCES PFUEL(Fuel)
   ); 
	  