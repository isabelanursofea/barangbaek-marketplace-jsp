# BarangBaek

A Java web marketplace where university students buy and sell second-hand items such as textbooks, stationery, electronics and furniture. Built as a group project for **CSC584** (Faculty of Computer and Mathematical Sciences, UiTM).

## Features
- Register and log in (with remember-me), plus forgot and reset password
- Edit profile and profile photo
- Post, edit and manage your own item listings with photos and categories
- Browse the marketplace and view item details
- Wishlist and shopping cart
- Checkout with payment and a receipt
- Parcel tracking for orders (delivery or pickup)
- Seller view: seller profile and incoming orders
- Login filter that protects pages for logged-in users only

## Tech Stack
- Java (Servlets, JSP, JDBC)
- Apache Derby database
- GlassFish server
- HTML, CSS, JavaScript
- Developed in NetBeans (Ant project)

## Project Structure
- `src/java/com/barangbaek/`: `bean` (data classes), `dao` (database access), `controller` (servlets), `filter` and `listener`
- `web/`: JSP pages, CSS, JavaScript and images
- `database/`: `barangbaek.sql` (core tables and sample data) and `barangbaek_extra.sql` (cart, wishlist and remember-me tables)
- `docs/`: ERD diagram and its editable file (draw.io)
- `nbproject/`, `build.xml`: NetBeans project files

## How to Run
1. Install **NetBeans** with **GlassFish** and **Java DB (Apache Derby)**.
2. Start Java DB and create a database named `barangbaek_db` (user `app`, password `app`, port `1527`).
3. Run `database/barangbaek.sql` first, then `database/barangbaek_extra.sql`, to create all the tables and the sample data.
4. Open the project in NetBeans and click **Run**. It deploys to GlassFish.

## Notes
- The sample users, emails and phone numbers in `barangbaek.sql` are made up for demonstration.
- `barangbaek_extra.sql` was reconstructed from the column names used in the code.
- Uploaded profile and item photos are not included. The default images are.
