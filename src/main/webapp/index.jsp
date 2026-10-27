
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyEcommerce | Home</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #172554;
}

.navbar {
    background: #172554;
    color: white;
    padding: 20px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.brand {
    font-size: 24px;
    font-weight: bold;
}

.nav-label {
    font-size: 14px;
    color: #dbeafe;
}

.hero {
    text-align: center;
    padding: 65px 20px 40px;
}

.hero h1 {
    font-size: 38px;
    margin-bottom: 15px;
}

.hero p {
    color: #64748b;
    font-size: 17px;
    line-height: 1.6;
}

.cards {
    max-width: 900px;
    margin: 20px auto 70px;
    padding: 0 20px;
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 25px;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(15, 23, 42, 0.07);
    border: 1px solid #e2e8f0;
}

.icon {
    font-size: 38px;
    margin-bottom: 15px;
}

.card h2 {
    margin: 0 0 12px;
    font-size: 23px;
}

.card p {
    color: #64748b;
    line-height: 1.7;
    min-height: 55px;
}

.button {
    display: inline-block;
    background: #2563eb;
    color: white;
    padding: 12px 18px;
    text-decoration: none;
    border-radius: 7px;
    margin-top: 12px;
    font-weight: bold;
}

.button:hover {
    background: #1d4ed8;
}

.footer {
    text-align: center;
    color: #64748b;
    padding: 20px;
    border-top: 1px solid #e2e8f0;
}

@media (max-width: 650px) {
    .cards {
        grid-template-columns: 1fr;
    }

    .hero h1 {
        font-size: 30px;
    }

    .nav-label {
        display: none;
    }
}
</style>
</head>

<body>

<header class="navbar">
    <div class="brand">MyEcommerce</div>
    <div class="nav-label">Management Dashboard</div>
</header>

<section class="hero">
    <h1>Welcome to MyEcommerce</h1>
    <p>
        Manage your customers and products from one place.<br>
        Choose a section below to get started.
    </p>
</section>

<section class="cards">

    <div class="card">
        <div class="icon">&#128101;</div>
        <h2>Customer Management</h2>
        <p>
            View customer records, register new customers,
            search details, update information, and manage records.
        </p>
        <a class="button"
           href="${pageContext.request.contextPath}/customer/list">
            Manage Customers →
        </a>
    </div>

    <div class="card">
        <div class="icon">&#128722;</div>
        <h2>Product Management</h2>
        <p>
            View your product catalogue, add products,
            update prices and stock, and manage product records.
        </p>
        <a class="button"
           href="${pageContext.request.contextPath}/product/list">
            Manage Products →
        </a>
    </div>

</section>

<footer class="footer">
    MyEcommerce · Customer and Product Management
</footer>

</body>
</html>
