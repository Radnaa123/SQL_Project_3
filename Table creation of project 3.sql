CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(255),
    CountryCode VARCHAR(10)
);

CREATE TABLE Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(255),
    Zipcode VARCHAR(20),
    CountryID INT
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    MiddleInitial CHAR(1),
    LastName VARCHAR(255),
    CityID INT,
    Address VARCHAR(255),
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    MiddleInitial CHAR(1),
    LastName VARCHAR(255),
    BirthDate DATETIME,
    Gender CHAR(1),
    CityID INT,
    HireDate DATETIME,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2),
    CategoryID INT,
    Class VARCHAR(50),
    ModifyDate DATETIME,
    Resistant VARCHAR(50),
    IsAllergic VARCHAR(50),
    VitalityDays INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    SalesPersonID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(5, 2),
    TotalPrice DECIMAL(10, 2),
    SalesDate DATETIME,
    TransactionNumber VARCHAR(50),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);