-- =====================================================
-- TABLE: USERS
-- =====================================================
CREATE TABLE USERS (
    UserID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    Birthday DATE,
    Gender VARCHAR(10),
    UserPhoto VARCHAR(255),
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address1 VARCHAR(100),
    Address2 VARCHAR(100),
    City VARCHAR(50),
    Postcode VARCHAR(10),
    Phone VARCHAR(20),
    University VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- =====================================================
-- TABLE: CATEGORIES
-- =====================================================
CREATE TABLE CATEGORIES (
    CategoryID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    CategoryName VARCHAR(50) NOT NULL,
    CategoryDesc VARCHAR(1000)
);

-- =====================================================
-- TABLE: ITEMS
-- =====================================================
CREATE TABLE ITEMS (
    ItemID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    SellerID INT NOT NULL,
    CategoryID INT,
    ItemName VARCHAR(100) NOT NULL,
    ItemDesc VARCHAR(1000),
    ItemPhoto VARCHAR(255),
    ItemCondition VARCHAR(20),
    ItemStatus VARCHAR(20) DEFAULT 'Available',
    Stock INT DEFAULT 1,
    Price DECIMAL(10,2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SellerID) REFERENCES USERS(UserID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID) ON DELETE SET NULL
);

-- =====================================================
-- TABLE: ORDERS
-- =====================================================
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    BuyerID INT NOT NULL,
    SellerID INT NOT NULL,
    OrderDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL,
    OrderStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (BuyerID) REFERENCES USERS(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SellerID) REFERENCES USERS(UserID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE: ORDER_ITEMS
-- =====================================================
CREATE TABLE ORDER_ITEMS (
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    PriceAtPurchase DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE: PAYMENTS
-- =====================================================
CREATE TABLE PAYMENTS (
    PaymentID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    OrderID INT NOT NULL,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(20) DEFAULT 'Pending',
    PaymentDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE: PARCELS
-- =====================================================
CREATE TABLE PARCELS (
    ParcelID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    OrderID INT NOT NULL,
    DeliveryType VARCHAR(20),
    PickupLocation VARCHAR(255),
    TrackingNumber VARCHAR(100),
    DeliveryStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE
);

/--INSERT 10 STUDENT CATEGORIES--/
INSERT INTO CATEGORIES (CategoryName, CategoryDesc) VALUES
('Textbooks', 'Academic books, reference materials, and study guides'),
('Stationery', 'Pens, notebooks, highlighters, and office supplies'),
('Electronics', 'Laptops, phones, tablets, and gadgets'),
('Furniture', 'Study tables, chairs, shelves, and room essentials'),
('Clothing', 'T-shirts, jackets, hoodies, and campus merchandise'),
('Accessories', 'Bags, watches, caps, and fashion accessories'),\
('Sports Equipment', 'Rackets, balls, gym gear, and sports accessories');

/--INSERT 3 SAMPLE USERS--/
INSERT INTO USERS (Username, FullName, Birthday, Gender, Email, Address1, City, Postcode, Phone, University, Password) VALUES
('ahmad_izham', 'Ahmad Izham Bin Abdullah', '2000-05-15', 'Male', 'ahmad.izham@student.um.edu.my', 'Blok A-12, Kolej Kediaman', 'Kuala Lumpur', '50603', '012-3456789', 'Universiti Malaya', 'password123'),
('siti_nur', 'Siti Nur Aisyah Binti Hassan', '2001-08-22', 'Female', 'siti.nur@student.ukm.edu.my', 'Fakulti Sains Sosial', 'Bangi', '43600', '013-9876543', 'Universiti Kebangsaan Malaysia', 'password123'),
('tan_wei', 'Tan Wei Ming', '1999-11-30', 'Male', 'tan.wei@student.usm.my', 'Desa Murni, Fasa 3', 'Gelugor', '11800', '016-5678912', 'Universiti Sains Malaysia', 'password123');

/--INSERT 3 SAMPLE ITEMS--/
INSERT INTO ITEMS (SellerID, CategoryID, ItemName, ItemDesc, ItemCondition, ItemStatus, Stock, Price) VALUES
(1, 1, 'Calculus: Early Transcendentals 8th Edition', 'Used for 1 semester. Very good condition with minimal highlighting.', 'Good', 'Available', 1, 45.00),
(2, 3, 'HP Laptop 15s-fq2000ni', 'Intel Core i5, 8GB RAM, 256GB SSD. Still under warranty.', 'Like New', 'Available', 1, 1200.00),
(3, 4, 'IKEA Study Desk', 'White, 120cm x 60cm. Comes with drawer. Lightly used.', 'Good', 'Available', 1, 180.00);

/--VERIFY--/
SELECT '=== CATEGORIES (10 Rows) ===' AS '';
SELECT * FROM CATEGORIES;

SELECT '=== USERS (3 Rows) ===' AS '';
SELECT * FROM USERS;

SELECT '=== ITEMS (3 Rows) ===' AS '';
SELECT i.ItemName, i.Price, u.FullName AS Seller, c.CategoryName
FROM ITEMS i
JOIN USERS u ON i.SellerID = u.UserID
JOIN CATEGORIES c ON i.CategoryID = c.CategoryID;