
# MyEcommerce — Java E-Commerce Web Application

MyEcommerce is a Java-based e-commerce web application developed to practice and demonstrate server-side web development, database integration, and CRUD (Create, Read, Update, Delete) operations.

The application currently provides customer management and product management through a web interface backed by a MySQL database.

## Features

### Customer Management
- Register new customers.
- View the customer list.
- Search for customers by ID, email, or phone number.
- Edit and update customer information.
- Delete customer records.
- Validate form inputs and display operation status messages.

### Product Management
- Add new products with details such as name, category, price, stock, description, and image URL.
- View available products in a list.
- Edit and update product information.
- Delete products.
- Validate product form inputs and display operation status messages.

### Application Interface
- Welcome page with navigation to customer and product management.
- Separate forms and list pages for managing records.
- Server-side request handling using Spring MVC.

## Technology Stack

- **Language:** Java
- **Web Framework:** Spring MVC
- **Frontend:** JSP, HTML, CSS
- **Database:** MySQL
- **Database Access:** JDBC
- **Build Tool:** Maven
- **Server:** Apache Tomcat
- **Development Environment:** Eclipse IDE

## Architecture

The application follows a layered structure to separate responsibilities:

- **Model:** Represents application data, including customers and products.
- **DAO:** Handles database operations through JDBC.
- **Service:** Provides a layer between controllers and data access.
- **Controller:** Handles HTTP requests and coordinates application operations.
- **JSP Views:** Display forms, lists, and feedback messages to users.

## Prerequisites

Before running the application, install or configure:

- JDK compatible with the project; developed and tested with JDK 21.
- Apache Maven.
- Apache Tomcat 10.1.x.
- MySQL Server and MySQL Workbench (optional, for database administration).
- Eclipse IDE or another Java IDE.

## Database Setup

1. Start your MySQL server.
2. Create the database:

   ```sql
   CREATE DATABASE ecommerce_db;
   ```

3. Create the customer and product tables according to the application's DAO queries and model fields.
4. Configure the database URL, username, and password for your local environment.
5. Ensure the MySQL JDBC driver is available to the application.

The product table contains fields for ID, name, description, price, stock, category, and image URL.

**Security note:** The database password should be provided through the `ECOMMERCE_DB_PASSWORD` environment variable. Do not commit database passwords, access tokens, or other secrets to this repository.

## Running the Application

1. Clone this repository:

   ```bash
   git clone https://github.com/AashiKumari15/MyEcommerce.git
   ```

2. Open the project in Eclipse as an existing Maven project.
3. Configure your local MySQL database and the `ECOMMERCE_DB_PASSWORD` environment variable.
4. Verify that the required database tables exist and that the MySQL JDBC driver is configured.
5. Configure Apache Tomcat 10.1.x in Eclipse.
6. Deploy the application to Tomcat.
7. Start the server and open:

   `http://localhost:8080/MyEcommerce/`

   The URL assumes that Tomcat uses port 8080 and the application context path is `/MyEcommerce`.

## Current Project Status

**Implemented:**
- Customer CRUD operations.
- Product CRUD operations.
- Search and form validation.
- Database integration.
- Welcome page and management interfaces.
- Git version control and GitHub repository.

**Planned improvements:**
- Shopping cart.
- Order placement and order history.
- User registration, login, and authorization.
- Additional security and automated testing.
- Deployment and production configuration.

## Learning Objectives

This project helps demonstrate practical experience with Java web development, Spring MVC, layered application architecture, JDBC, MySQL, form handling, validation, and version control.

## Repository

GitHub: https://github.com/AashiKumari15/MyEcommerce
