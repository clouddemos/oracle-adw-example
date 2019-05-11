CREATE USER pplantdata 
    IDENTIFIED BY "P1pppaP@ss3s" 
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;

GRANT dwrole TO pplantdata;
