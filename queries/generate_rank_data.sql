-- Generate Capacity Rank data

CREATE SEQUENCE rankseq START WITH 1 INCREMENT BY 1;
create table loaddata2(data1 varchar2(1000), data2 varchar2(1000));

insert into loaddata2(data1,data2)

    select plantkey,rankseq.nextval 
    from (select plantkey
    from pplant 
    ORDER BY capacity_mw DESC)
    
;
update pplantdata.pgen p set p.Rank_By_Capacity = (select ld2.data2 from loaddata2 ld2 where ld2.data1 = p.plant); 

drop SEQUENCE rankseq ;
drop table loaddata2;

CREATE SEQUENCE rankseq START WITH 1 INCREMENT BY 1;
create table loaddata2(data1 varchar2(1000), data2 varchar2(1000));

insert into loaddata2(data1,data2)

    select plantkey,decode(pfuel.renewable,'Y',rankseq.nextval,1000000) 
    from (select plantkey,pfuel.renewable
    from pplant,pfuel
	where pplant.primary_fuel = pfuel.fuel	
    ORDER BY capacity_mw DESC)
    
;
update pplantdata.pgen p set p.Rank_By_Capacity_Renewable = (select ld2.data2 from loaddata2 ld2 where ld2.data1 = p.plant); 

drop SEQUENCE rankseq ;
drop table loaddata2;
