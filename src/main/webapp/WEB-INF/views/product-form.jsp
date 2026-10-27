
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Form</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    padding: 30px;
    color: #1e293b;
}

.container {
    max-width: 650px;
    margin: auto;
    background: white;
    padding: 28px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

h1 {
    margin-top: 0;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
}

input, textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 11px;
    border: 1px solid #cbd5e1;
    border-radius: 6px;
    font-size: 14px;
}

textarea {
    resize: vertical;
}

.button {
    padding: 11px 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    text-decoration: none;
    font-size: 14px;
}

.save {
    background: #2563eb;
    color: white;
}

.cancel {
    background: #e2e8f0;
    color: #334155;
    display: inline-block;
    margin-left: 8px;
}

.actions {
    margin-top: 24px;
}
</style>
</head>

<body>
<div class="container">

    <h1>
        <c:choose>
            <c:when test="${product.id > 0}">
                Edit Product
            </c:when>
            <c:otherwise>
                Add Product
            </c:otherwise>
        </c:choose>
    </h1>

    <form
        action="${pageContext.request.contextPath}/product/${product.id > 0 ? 'update' : 'save'}"
        method="post">

        <c:if test="${product.id > 0}">
            <input type="hidden" name="id" value="${product.id}">
        </c:if>

        <div class="form-group">
            <label for="name">Product Name *</label>
            <input type="text" id="name" name="name"
                   value="<c:out value='${product.name}'/>"
                   required minlength="2" maxlength="150">
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" id="category" name="category"
                   value="<c:out value='${product.category}'/>"
                   maxlength="100"
                   placeholder="e.g. Electronics">
        </div>

        <div class="form-group">
            <label for="price">Price (₹) *</label>
            <input type="number" id="price" name="price"
                   value="${product.price}"
                   required min="0.01" max="99999999.99"
                   step="0.01">
        </div>

        <div class="form-group">
            <label for="stock">Stock Quantity *</label>
            <input type="number" id="stock" name="stock"
                   value="${product.stock}"
                   required min="0" max="2147483647" step="1">
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description"
                      rows="4" maxlength="500"
                      placeholder="Describe the product"><c:out value="${product.description}"/></textarea>
        </div>

        <div class="form-group">
            <label for="imageUrl">Image URL (optional)</label>
            <input type="url" id="imageUrl" name="imageUrl"
                   value="<c:out value='${product.imageUrl}'/>"
                   maxlength="500"
                   placeholder="https://example.com/image.jpg">
        </div>

        <div class="actions">
            <button type="submit" class="button save">Save Product</button>
            <a class="button cancel"
               href="${pageContext.request.contextPath}/product/list">
                Cancel
            </a>
        </div>

    </form>
</div>
</body>
</html>
