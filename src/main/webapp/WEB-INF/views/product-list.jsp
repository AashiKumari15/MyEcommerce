
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Management</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    margin: 0;
    padding: 30px;
    color: #1e293b;
}

.container {
    max-width: 1200px;
    margin: auto;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

h1 {
    margin: 0;
}

.button {
    display: inline-block;
    padding: 10px 16px;
    border-radius: 6px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    font-size: 14px;
}

.add {
    background: #2563eb;
    color: white;
}

.edit {
    background: #e0f2fe;
    color: #075985;
}

.delete {
    background: #fee2e2;
    color: #991b1b;
}

.alert {
    padding: 12px;
    background: #d1fae5;
    color: #065f46;
    border-radius: 6px;
    margin-bottom: 18px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

th, td {
    padding: 12px;
    border-bottom: 1px solid #e2e8f0;
    text-align: left;
}

th {
    background: #eff6ff;
}

.empty {
    text-align: center;
    padding: 30px;
    color: #64748b;
}

.actions {
    display: flex;
    gap: 8px;
    align-items: center;
}

.inline-form {
    display: inline;
}

@media (max-width: 800px) {
    .container {
        overflow-x: auto;
    }

    .header {
        gap: 15px;
        flex-wrap: wrap;
    }
}
</style>
</head>

<body>
<div class="container">

    <div class="header">
        <h1>Product Management</h1>
        <a class="button add"
           href="${pageContext.request.contextPath}/product/add">
            + Add Product
        </a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert">
            <c:out value="${successMessage}" />
        </div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.category}" /></td>
                    <td>₹<c:out value="${product.price}" /></td>
                    <td><c:out value="${product.stock}" /></td>
                    <td><c:out value="${product.description}" /></td>
                    <td>
                        <div class="actions">
                            <a class="button edit"
                               href="${pageContext.request.contextPath}/product/edit?id=${product.id}">
                                Edit
                            </a>

                            <form class="inline-form"
                                  action="${pageContext.request.contextPath}/product/delete"
                                  method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this product?');">
                                <input type="hidden" name="id"
                                       value="${product.id}">
                                <button class="button delete" type="submit">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty products}">
                <tr>
                    <td colspan="7" class="empty">
                        No products found. Click Add Product to get started.
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <p>
        <a href="${pageContext.request.contextPath}/customer/list">
            Back to Customer Management
        </a>
    </p>

</div>
</body>
</html>
