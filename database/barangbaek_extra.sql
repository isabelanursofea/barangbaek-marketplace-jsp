-- =====================================================
-- BARANGBAEK: EXTRA TABLES (Apache Derby)
-- Run this AFTER barangbaek.sql.
--
-- NOTE: These three tables are used by the Java code
-- (cartdao, wishlistdao, userdao) but were not in the
-- original barangbaek.sql. They were reconstructed from
-- the column names used in the code, so check them
-- against the real database if a column type differs.
-- =====================================================

-- =====================================================
-- TABLE: CART_ITEMS
-- =====================================================
CREATE TABLE CART_ITEMS (
    CartItemID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    AddedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE: WISHLIST_ITEMS
-- =====================================================
CREATE TABLE WISHLIST_ITEMS (
    WishlistItemID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    AddedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE: REMEMBER_TOKENS (remember-me login)
-- =====================================================
CREATE TABLE REMEMBER_TOKENS (
    TokenID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    UserID INT NOT NULL,
    Token VARCHAR(255) NOT NULL,
    ExpiryDate TIMESTAMP NOT NULL,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID) ON DELETE CASCADE
);
