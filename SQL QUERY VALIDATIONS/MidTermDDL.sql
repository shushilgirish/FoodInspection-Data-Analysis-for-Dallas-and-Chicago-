create database workshop
use midtermproject
drop TABLE DIM_FoodPlaces (
  FoodPlaceSK INT PRIMARY KEY,
  DBA_NAME VARCHAR(1000),
  Zip FLOAT(50),
  Latitude FLOAT(50),
  Longitude FLOAT(50),
  Licenses VARCHAR(1000),
  DL_WorkflowDirectory VARCHAR(1000),
  RestaurantName VARCHAR(1000),
  DL_WorkflowFileName VARCHAR(1000),
  StreetAddress VARCHAR(1000),
  CityName VARCHAR(1000),
  State VARCHAR(1000),
  DL_CreateDate DATE,
  AKA_NAME VARCHAR(1000)
);
drop TABLE DIM_Facility (
    FacilitySK INT PRIMARY KEY,
    DI_WorkflowDirectory VARCHAR(1000),
    DI_WorkflowFileName VARCHAR(1000),
    DI_CreateDate DATE,
    FacilityType VARCHAR(1000)
);

drop TABLE DIM_InspectionType (
  InspectionTypeSK INT PRIMARY KEY,
  DL_WorkflowDirectory VARCHAR(1000),
  InspectionType VARCHAR(1000),
  DL_CreateDate DATE,
  DL_WorkflowFileName VARCHAR(1000)
);
drop table FACT_FoodInspection
drop TABLE DIM_Date (
  DateSK INT PRIMARY KEY,
  full_date_at DATE,
  day_name_of_week VARCHAR(1000),
  day_number_of_week INT,
  day_number_of_year INT,
  day_number_of_month INT,
  week_number_of_year INT,
  month_name VARCHAR(1000),
  month_number_of_year INT,
  calendar_quarter INT,
  calendar_year INT
);

drop TABLE DIM_Result (
  ResultSK INT PRIMARY KEY,
  DL_WorkflowDirectory VARCHAR(1000),
  Result VARCHAR(1000),
  DL_WorkflowFileName VARCHAR(1000),
  DL_CreateDate DATE
);

drop TABLE DIM_Risk (
  RiskSK INT PRIMARY KEY,
  DL_WorkflowDirectory VARCHAR(1000),
  Risk VARCHAR(1000),
  DL_CreateDate DATE,
  DL_WorkflowFileName VARCHAR(1000)
);

drop TABLE DIM_Violation (
  ViolationSK INT PRIMARY KEY,
  DL_WorkflowDirectory VARCHAR(1000),
  DL_CreateDate DATE,
  DL_WorkflowFileName VARCHAR(1000),
  ViolationCode VARCHAR(1000),
  ViolationDescription VARCHAR(1000)
);
create TABLE FACT_FoodInspection
 (
  InspectionSK INT PRIMARY KEY,
  RiskSK INT,
  InspectionScore INT,
  InspectionYear INT,
  DL_CreateDate DATE,
  DL_WorkflowDirectory VARCHAR(1000),
  InspectionID INT,
  DL_WorkflowFileName VARCHAR(1000),
  InspectionTypeSK INT,
  FoodPlaceSK INT,
  DateSK INT,
  ResultSK INT,
  FacilitySK INT,
  FOREIGN KEY (RiskSK) REFERENCES DIM_Risk(RiskSK),
  FOREIGN KEY (InspectionTypeSK) REFERENCES DIM_InspectionType(InspectionTypeSK),
  FOREIGN KEY (FoodPlaceSK) REFERENCES DIM_FoodPlaces(FoodPlaceSK),
  FOREIGN KEY (DateSK) REFERENCES DIM_Date(DateSK),
  FOREIGN KEY (ResultSK) REFERENCES DIM_Result(ResultSK),
  FOREIGN KEY (FacilitySK) REFERENCES DIM_Facility(FacilitySK)
);
drop TABLE FACT_FoodInspViolation (
  FoodInspectionViolationSK INT PRIMARY KEY,
  DL_WorkflowDirectory VARCHAR(1000),
  ViolationMemo VARCHAR(1000),
  ViolationPoints INT,
  DL_CreateDate DATE,
  DL_WorkflowFileName VARCHAR(1000),
  ViolationSK INT,
  InspectionSK INT,
  FOREIGN KEY (ViolationSK) REFERENCES DIM_Violation(ViolationSK),
  FOREIGN KEY (InspectionSK) REFERENCES FACT_FoodInspection(InspectionSK)
);

create database midtermproject
