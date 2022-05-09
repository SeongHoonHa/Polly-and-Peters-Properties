SELECT l.Cosigner as cosigner, ht.Apartment_number as apartment_number
FROM Lease as l
JOIN Tenants as t ON l.Tenant_id = t.Tenant_id
JOIN House_type as ht ON ht.House_Tenant_id = t.Tenant_id
ORDER BY apartment_number;

-- Note: Damage Cost numbers hardcoded in, could be changed
SELECT  CONCAT(t.first_name, " ", t.last_name) as full_name, d.Damage_Type, d.Damage_Cost
FROM Tenants as t
JOIN Damages as d ON t.Tenant_id = d.dTenant_id
WHERE d.Damage_Cost < 4000 AND d.dTenant_id NOT IN
( SELECT d1.dTenant_id  FROM Damages as d1 WHERE d1.Damage_cost < 3000)
GROUP BY full_name ; 

-- Note: Last name "Molen" hardcoded in, could also be changed
SELECT COUNT(rp.Property_ID) as Num_Of_Properties, pm.Lname as Last_Name
FROM Rental_Properties as rp
JOIN Property_Managers_Rental_Properties as pmrp ON pmrp.mProperty_ID = rp.Property_ID
JOIN Property_Managers as pm ON pm.SSN = pmrp.managerSSN
GROUP BY Last_Name;
	
SELECT MAX(l.price) as Highest_rent, pm.SSN as Manager_SSN
FROM Lease as l
JOIN Tenants as t ON l.Tenant_id = t.Tenant_id
JOIN Property_Managers as pm ON pm.SSN = t.SSN;

-- Note: Last name "Paybody" hardcoded in, could be changed as well
SELECT t.Tenant_id as Tenant_id, d.One_month_rent as Deposit_price
FROM Tenants as t
JOIN Deposits as d ON t.Tenant_id = d.Tenant_id;