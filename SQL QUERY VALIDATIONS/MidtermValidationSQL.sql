  






  --count of foodinspection rows
  select  count(*) from FACT_FoodInspection
  --by dba name
SELECT 
    fp.DBA_NAME, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_FoodPlaces AS fp
JOIN 
    FACT_FoodInspection AS fi 
    ON fp.FoodPlaceSK = fi.FoodPlaceSK
GROUP BY 
    fp.DBA_NAME
ORDER BY 
    InspectionCount DESC;

--by aka name
	SELECT 
    fp.AKA_NAME, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_FoodPlaces AS fp
JOIN 
    FACT_FoodInspection AS fi 
    ON fp.FoodPlaceSK = fi.FoodPlaceSK
GROUP BY 
    fp.AKA_NAME
ORDER BY 
    InspectionCount DESC;

--by risk
	SELECT 
    r.Risk, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_Risk AS r
JOIN 
    FACT_FoodInspection AS fi 
    ON r.RiskSK = fi.RiskSK
GROUP BY 
    r.Risk
ORDER BY 
    InspectionCount DESC;

--by result
	SELECT 
    dr.Result, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_Result AS dr
JOIN 
    FACT_FoodInspection AS fi 
    ON dr.ResultSK = fi.ResultSK
GROUP BY 
    dr.Result
ORDER BY 
    InspectionCount DESC;


	--by inspection type
	SELECT 
    dit.InspectionType, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_InspectionType AS dit
JOIN 
    FACT_FoodInspection AS fi 
    ON dit.InspectionTypeSK = fi.InspectionTypeSK
GROUP BY 
    dit.InspectionType
ORDER BY 
    InspectionCount DESC;
	--by license
	SELECT 
    fp.Licenses, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_FoodPlaces AS fp
JOIN 
    FACT_FoodInspection AS fi 
    ON fp.FoodPlaceSK = fi.FoodPlaceSK
GROUP BY 
    fp.Licenses
ORDER BY 
    InspectionCount DESC;

	--by facility type
	SELECT 
    f.FacilityType, 
    COUNT(fi.InspectionSK) AS InspectionCount
FROM 
    DIM_Facility AS f
JOIN 
    FACT_FoodInspection AS fi 
    ON f.FacilitySK = fi.FacilitySK
GROUP BY 
    f.FacilityType
ORDER BY 
    InspectionCount DESC;
