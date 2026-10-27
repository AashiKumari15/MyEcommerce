
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Management | MyEcommerce</title>

<style>
* { box-sizing: border-box; }

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f7fb;
    color: #1e293b;
}

.navbar {
    background: #172554;
    padding: 18px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    flex-wrap: wrap;
}

.brand {
    color: white;
    font-size: 21px;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 22px;
    flex-wrap: wrap;
}

.nav-links a {
    color: #dbeafe;
    text-decoration: none;
    font-size: 14px;
}

.nav-links a:hover { color: white; }

.container {
    width: 92%;
    max-width: 1450px;
    margin: 32px auto;
}

.page-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    flex-wrap: wrap;
    margin-bottom: 25px;
}

h1 {
    margin: 0 0 8px;
    font-size: 28px;
}

.subtitle {
    margin: 0;
    color: #64748b;
    font-size: 14px;
}

.primary-btn {
    background: #2563eb;
    color: white;
    padding: 12px 17px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}

.primary-btn:hover { background: #1d4ed8; }

.panel {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 23px;
    margin-bottom: 24px;
    box-shadow: 0 3px 12px rgba(15, 23, 42, 0.035);
}

.panel-title {
    margin: 0 0 20px;
    font-size: 17px;
}

.search-form {
    display: grid;
    grid-template-columns: repeat(3, minmax(150px, 1fr)) auto auto;
    gap: 15px;
    align-items: end;
}

.field label {
    display: block;
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 8px;
}

.field input {
    width: 100%;
    padding: 11px 12px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 14px;
    outline: none;
}

.field input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px #dbeafe;
}

button, .clear-btn {
    border: 0;
    border-radius: 7px;
    padding: 12px 16px;
    font-size: 14px;
    text-decoration: none;
    cursor: pointer;
    text-align: center;
}

.search-btn {
    background: #172554;
    color: white;
}

.clear-btn {
    background: #e2e8f0;
    color: #334155;
}

.table-panel { padding: 0; overflow: hidden; }

.table-heading {
    padding: 22px 23px;
    border-bottom: 1px solid #e2e8f0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
}

.table-heading h2 {
    margin: 0;
    font-size: 17px;
}

.table-wrapper { overflow-x: auto; }

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    font-size: 13px;
}

th {
    background: #f8fafc;
    color: #475569;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.35px;
}

th, td {
    padding: 15px 16px;
    border-bottom: 1px solid #e2e8f0;
    text-align: left;
    white-space: nowrap;
}

tbody tr:hover { background: #f8fafc; }

.id-badge {
    background: #eff6ff;
    color: #1d4ed8;
    padding: 5px 9px;
    border-radius: 6px;
    font-weight: bold;
}

.action-links {
    display: flex;
    align-items: center;
    gap: 8px;
}

.edit-btn {
    display: inline-block;
    padding: 7px 10px;
    background: #dbeafe;
    color: #1d4ed8;
    border-radius: 5px;
    text-decoration: none;
    font-size: 12px;
}

.delete-btn {
    padding: 7px 10px;
    background: #fee2e2;
    color: #b91c1c;
    border-radius: 5px;
    font-size: 12px;
}

.empty-message {
    text-align: center;
    padding: 35px;
    color: #64748b;
}

@media (max-width: 900px) {
    .search-form { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 550px) {
    .container { width: 95%; margin: 22px auto; }
    .search-form { grid-template-columns: 1fr; }
    .panel { padding: 16px; }
    h1 { font-size: 23px; }
}
.alert {
    padding: 12px 16px;
    margin: 15px 0;
    border-radius: 8px;
    font-size: 14px;
}

.alert.success {
    background-color: #d1fae5;
    color: #065f46;
    border: 1px solid #a7f3d0;
}
</style>
</head>

<body>

<nav class="navbar">
    <div class="brand">MyEcommerce</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/customer/list">Customers</a>
        <a href="${pageContext.request.contextPath}/customer/register">Register Customer</a>
    </div>
</nav>

<main class="container">

    <div class="page-heading">
        <div>
            <h1>Customer Management</h1>
            <p class="subtitle">Manage customer information in one place.</p>
        </div>
        <c:if test="${not empty successMessage}">
    <div class="alert success">
        <c:out value="${successMessage}" />
    </div>
</c:if>
        <a class="primary-btn"
           href="${pageContext.request.contextPath}/customer/register">
            + Add Customer
        </a>
    </div>

    <section class="panel">
        <h2 class="panel-title">Search Customers</h2>

        <form class="search-form"
              action="${pageContext.request.contextPath}/customer/search"
              method="get">

            <div class="field">
                <label for="id">Customer ID</label>
                <input type="number" id="id" name="id" min="1"
                       placeholder="Enter customer ID" value="${searchId}">
            </div>

            <div class="field">
                <label for="email">Email</label>
                <input type="text" id="email" name="email"
                       placeholder="Enter email" value="${searchEmail}">
            </div>

            <div class="field">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone"
                       placeholder="Enter phone" value="${searchPhone}">
            </div>

            <button class="search-btn" type="submit">Search</button>

            <a class="clear-btn"
               href="${pageContext.request.contextPath}/customer/list">Clear</a>
        </form>
    </section>

    <section class="panel table-panel">
        <div class="table-heading">
            <h2>Customer Records</h2>
            <span class="subtitle">Customer details and actions</span>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>Salary</th>
                        <th>Address</th>
                        <th>Date of Birth</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td><span class="id-badge"><c:out value="${customer.id}"/></span></td>
                            <td><c:out value="${customer.name}"/></td>
                            <td><c:out value="${customer.email}"/></td>
                            <td><c:out value="${customer.phone}"/></td>
                            <td><c:out value="${customer.city}"/></td>
                            <td><c:out value="${customer.salary}"/></td>
                            <td><c:out value="${customer.address}"/></td>
                            <td><c:out value="${customer.dob}"/></td>

                            <td>
                                <div class="action-links">
                                    <a class="edit-btn"
                                       href="${pageContext.request.contextPath}/customer/edit?id=${customer.id}">
                                        Edit
                                    </a>

                                    <form action="${pageContext.request.contextPath}/customer/delete"
                                          method="post"
                                          onsubmit="return confirm('Are you sure you want to delete this customer?');">
                                        <input type="hidden" name="id" value="${customer.id}">
                                        <button class="delete-btn" type="submit">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty customers}">
                        <tr>
                            <td colspan="9" class="empty-message">
                                No customers found. Try another search or register a customer.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </section>

</main>
</body>
</html>
