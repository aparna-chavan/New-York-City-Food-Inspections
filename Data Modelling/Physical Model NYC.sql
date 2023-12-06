/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC Dimensional Model.DM1
 *
 * Date Created : Monday, February 13, 2023 22:53:51
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Address 
 */

CREATE TABLE Dim_Address(
    Address_ID    char(10)    NOT NULL,
    BORO          char(10)    NULL,
    BUILDING      char(10)    NULL,
    STREET        char(10)    NULL,
    ZIPCODE       int         NULL,
    PHONE         int         NULL,
    Latitude      float       NULL,
    Longitude     float       NULL,
    BIN           int         NULL,
    BBL           int         NULL,
    NTA           char(10)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Address_ID)
)

go


IF OBJECT_ID('Dim_Address') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Address >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Date_ID            char(10)    NULL,
    Full_Date          date        NULL,
    DayWeek_NO         int         NULL,
    DayWeek_Name       char(10)    NULL,
    DayNoOfMonth       int         NULL,
    Day_Name_Month     char(10)    NULL,
    Day_No_Year        int         NULL,
    Week_No_Of_Year    int         NULL,
    DI_Create_DT       date        NULL,
    CalenderYear       int         NULL
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    INSP_ID            char(10)    NOT NULL,
    [INSPECTION TYPE]  char(10)    NULL,
    DI_CREATE_DT       date        NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (INSP_ID)
)

go


IF OBJECT_ID('Dim_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Inspection >>>'
go

/* 
 * TABLE: DIm_Restaurant 
 */

CREATE TABLE DIm_Restaurant(
    Business_ID         char(10)    NOT NULL,
    DBA                 char(10)    NULL,
    [Cusine desc]       char(10)    NULL,
    Community_Board     char(10)    NULL,
    Council_District    char(10)    NULL,
    Census_tract        int         NULL,
    DI_CREATE_DT        date        NULL,
    Address_ID          char(10)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (Business_ID)
)

go


IF OBJECT_ID('DIm_Restaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE DIm_Restaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIm_Restaurant >>>'
go

/* 
 * TABLE: Dim_Violations 
 */

CREATE TABLE Dim_Violations(
    Vio_ID                   char(10)    NOT NULL,
    [VIOLATION CODE]         char(10)    NULL,
    [VIOLATION DESCRIPTION]  char(10)    NULL,
    [CRITICAL FLAG]          char(10)    NULL,
    DI_Create_DT             date        NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Vio_ID)
)

go


IF OBJECT_ID('Dim_Violations') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violations >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violations >>>'
go

/* 
 * TABLE: Fact 
 */

CREATE TABLE Fact(
    Vio_ID             char(10)    NOT NULL,
    Business_ID        char(10)    NOT NULL,
    Address_ID         char(10)    NOT NULL,
    INSP_ID            char(10)    NOT NULL,
    Fact_ID            char(10)    NULL,
    Date_ID            char(10)    NULL,
    GRADE              char(10)    NULL,
    Grade_DATE         date        NULL,
    Record_DATE        date        NULL,
    [INSPECTION DATE]  date        NULL,
    DI_CREATE_DT       date        NULL,
    ACTION             char(10)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Vio_ID, Business_ID, Address_ID, INSP_ID)
)

go


IF OBJECT_ID('Fact') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact >>>'
go

/* 
 * TABLE: Fact 
 */

ALTER TABLE Fact ADD CONSTRAINT RefDim_Violations3 
    FOREIGN KEY (Vio_ID)
    REFERENCES Dim_Violations(Vio_ID)
go

ALTER TABLE Fact ADD CONSTRAINT RefDIm_Restaurant4 
    FOREIGN KEY (Business_ID)
    REFERENCES DIm_Restaurant(Business_ID)
go

ALTER TABLE Fact ADD CONSTRAINT RefDim_Address6 
    FOREIGN KEY (Address_ID)
    REFERENCES Dim_Address(Address_ID)
go

ALTER TABLE Fact ADD CONSTRAINT RefDim_Inspection7 
    FOREIGN KEY (INSP_ID)
    REFERENCES Dim_Inspection(INSP_ID)
go


