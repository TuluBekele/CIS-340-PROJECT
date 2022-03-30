CREATE DATABASE PROJECT_1;
USE PROJECT_1;

/*Creating Ward Table*/
CREATE TABLE WARD (
  Ward_No VarChar(55),
  WardName VarChar(45),
  Ward_Location_Type VARCHAR(55),
  No_Of_Beds Int,
  PhoneNumber VarChar(45),
  PRIMARY KEY (Ward_No)
);
/*Creating Local_Doctors  Table*/
CREATE TABLE LOCAL_DOCTORS (
  FullName Varchar(45),
  ClinicNumber Int,
  linic_Address Varchar(45),
  Clinic_PhoneNumber Varchar(45),
  Doctor_Id Int,
  PRIMARY KEY (Doctor_Id)
);
/*Creating OutPatients Table*/
CREATE TABLE OUTPATIENTS (
  OutPatientNumber VarChar(45),
  FirstName Varchar(45),
  LastName Varchar(45),
  Address Varchar(45),
  PhoneNumber Varchar(45),
  Date_Of_Birth Date,
  Sex Varchar(45),
  Date_Of_Appointment Date,
  Time_Of_Appointment Varchar(45),
  PatientNumber Varchar(45),
  PRIMARY KEY (OutPatientNumber),
   FOREIGN KEY (PatientNumber) REFERENCES PATIENTS (PateintNumber)
);
/*Creating Suppliers Table*/
CREATE TABLE SUPPLIERS (
  Supply_Id int,
  Supply_FirstName Varchar(150),
  Supply_LastName Varchar(200),
  Supply_Address Varchar(450),
  Supply_PhoneNumber Varchar(12),
  Supply_FaxNumber Varchar(12),
  PRIMARY KEY (Supply_Id)
);
/*Creating Patients Table*/
CREATE TABLE PATIENTS (
  PatientNumber Varchar(45),
  FirstName Varchar(45),
  LastName Varchar(45),
  Address Varchar(45),
  PhoneNumber Varchar(45),
  Date_Of_Birth Date,
  Sex Varchar(45),
  Marital_Status Varchar(45),
  Date_Registered Date,
  Next_Of_Kin_ID Varchar(45),
  PRIMARY KEY (PatientNumber),
    FOREIGN KEY (Next_Of_Kin_Id) REFERENCES PATIENTS_NEXT_OF_KIN (Next_Of_Kin_Id),
    FOREIGN KEY (Staff_Id) REFERENCES STAFF(Staff_Id)
  
  
);
/*Creating Staff Table*/
CREATE TABLE STAFF (
  Staff_Id Int,
  FirstName Varchar(100),
  LastName Varchar(200),
  Address Varchar(500),
  Phone_No VarChar(16),
  DOB Date,
  Sex Varchar(10),
  Type_Of_Staff Varchar(15),
  NIN VarChar(100),
  Position VarChar(200),
  Salary Float,
  Salary_Scale VarChar(200),
  Date_Of_Qualification Date,
  Type_Of_Qualification VarChar(100),
  InstitutionName VarChar(250),
  OrgName VarChar(200),
  Position_Held VarChar(200),
  Start_Date Date,
  End_Date Date,
  No_Of_Hours Float,
  Contract_Type Varchar(20),
  Type_Of_Salary Varchar(25),
  Shift Varchar(25),
  PRIMARY KEY(Staff_Id)
);
/*Creating WARD_REQUISITIONS Table*/
CREATE TABLE WARD_REQUISITIONS (
  RequisitionNumber Int,
  Staff_Id Varchar(45),
  WardName Varchar(45),
  Ward_No Int,
  Item_Or_DrugNumber Int,
  Quantity_Required Int,
  Date_Ordered Date,
  Date_Delivered Date,
  PRIMARY KEY (RequisitionNumber),
  FOREIGN KEY (Staff_Id) REFERENCES STAFF(Staff_Id),
  FOREIGN KEY (Ward_No) REFERENCES WARD(Ward_No),
  FOREIGN KEY (ItemNumber) REFERENCES SURGICAL_AND_NON_SURGICAL_SUPPLIES(ItemNumber)
  
);
/*Creating PHARMACEUTICAL_SUPPLIES Table*/
CREATE TABLE PHARMACEUTICAL_SUPPLIES (
  DrugNumber Int,
  DrugName Varchar(45),
  Description Varchar(100),
  Dosage Varchar(45),
  Method_Of_Administration Varchar(45),
  Quantity_In_Stock Int,
  Reorder_Level Varchar(45),
  Cost_Per_Unit Float,
  Ward_No Varchar(55),
  PRIMARY KEY (DrugNumber),
  FOREIGN KEY (Ward_No) REFERENCES WARD(Ward_No)
  
);
/*Creating  PATIENTS_NEXT_OF_KIN Table*/
CREATE TABLE PATIENTS_NEXT_OF_KIN (
  FullName Varchar(45),
  Relationship_To_Patient Varchar(45),
  Address Varchar(45),
  PhoneNumber Varchar(45),
  Next_Of_Kin_ID Varchar(45),
  PRIMARY KEY (Next_Of_Kin_ID)

);
/*Creating  PATIENT_MEDICATION  Table*/
CREATE TABLE PATIENT_MEDICATION (
  MedicationNumber Int,
  PatientNumber Varchar(45),
  Units_Per_Day Int,
  Method VARCHAR(45),
  End_Date Date,
  Start_Date Date,
  PRIMARY KEY (MedicationNumber),
  FOREIGN KEY (PatientNumber) REFERENCES PATIENTS(PatientNumber)
);
/*Creating SURGICAL_AND_NON_SURGICAL_SUPPLIES  PATIENT_MEDICATION  Table*/
CREATE TABLE SURGICAL_AND_NON_SURGICAL_SUPPLIES (
  ItemNumber Int,
  ItemName Varchar(45),
  Description Varchar(100),
  Quantity Int,
  Reorder_Level Varchar(45),
  Cost_Per_Unit Float,
  Ward_No VarChar(55),
  PRIMARY KEY (ItemNumber),
  FOREIGN KEY (Ward_No) REFERENCES WARD(Ward_No)
);
/*Creating PATIENT_APPOINTMENTS  Table*/
CREATE TABLE PATIENT_APPOINTMENTS (
  Appointments_Id Int,
  Staff_Id Int,
  PatientNumber Varchar(45),
  Ward_No Varchar(55),
  Date_Of_Appointments Date,
  Time_Of_Appointments Char(10),
  RoomNumber Int,
  Status Char(2),
  Types_Of_Appointments Char(3),
  Duration Int,
  Ward_Date Date,
  Leave_Date Date,
  Release_Date Date,
  BedNumber int,
  PRIMARY KEY (Appointments_Id),
  FOREIGN KEY (Staff_Id) REFERENCES STAFF(Staff_Id),
  FOREIGN KEY (PatientNumber) REFERENCES PATIENTS(PatientNumber),
  FOREIGN KEY (Ward_No) REFERENCES WARD(Ward_No)
);
/*Creating INPATIENT  Table*/
CREATE TABLE INPATIENTS (
  InpatientNumber Int,
  FirstName Varchar(45),
  LastName Varchar(45),
  Address Varchar(45),
  PhoneNumber Varchar(45),
  Date_Of_Birth Date,
  Sex Varchar(45),
  Marital_Status Varchar(45),
  Next_Of_Kin_ID Varchar(45),
  Date_Placed_On_Waiting_List Date,
  Ward_No Varchar(55),
  Expected_Stay_Duration_Days Int,
  Date_Placed_In_Ward Date,
  Date_Expected_To_Leave Date,
  Date_Left_From_Ward Date,
  BedNumber Int,
  PatientNumber Varchar(45),
  PRIMARY KEY (InpatientNumber),
  FOREIGN KEY (Ward_No) REFERENCES WARD(Ward_No),
   FOREIGN KEY (Next_Of_Kin_Id) REFERENCES PATIENTS_NEXT_OF_KIN (Next_Of_Kin_Id),
    FOREIGN KEY (PatientNumber) REFERENCES PATIENTS(PatientNumber)
  
);
