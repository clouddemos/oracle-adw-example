insert into pplantdata.country (code,name,countrykey)
select distinct data1,data2,data2 from pplantdata.loaddata;

insert into pplantdata.pfuel (fuel,Renewable)
select distinct Nvl(data8,'UNKNOWN'),
Decode( Nvl(data8,'UNKNOWN'),'Hydro','Y','Oil','N','Nuclear','N','Coal','N','Petcoke','N','Gas','N','UNKNOWN','U','Y') 
from pplantdata.loaddata ;

insert into pplantdata.pplant (Plant_Name,PlantKey,Capacity_Mw,Latitude,Longitude,Country,Primary_Fuel,Secondary_Fuel1,Secondary_Fuel2,Secondary_Fuel3,
Est_Gen_Gwh_1Year,Commission_Year,Plant_Owner)
select Nvl(data3,'UNKNOWN'),data4,data5,data6,data7,data2,Nvl(data8,'UNKNOWN'),data9,data10,data11,data22,data12,data13 from pplantdata.loaddata;

insert into pplantdata.pgen (Country,Plant,Plant_name,Capacity_Mw,Primary_Fuel)
select Country,Plantkey,Plant_name,Capacity_Mw,Primary_Fuel from pplantdata.pplant;


