
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            color: #222;
        }

        .container {
            width: 90%;
            max-width: 650px;
            margin: 35px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
        }

        .field {
            margin-bottom: 16px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 22px;
        }

        button, .cancel {
            padding: 11px 18px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        button {
            background: #222;
            color: white;
        }

        .cancel {
            background: #e5e5e5;
            color: #222;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Edit Customer</h1>

        <form action="${pageContext.request.contextPath}/customer/update"
              method="post">

            <input type="hidden" name="id" value="${customer.id}">

            <div class="field">
                <label for="name">Name</label>
                <input type="text" id="name" name="name"
                       value="<c:out value='${customer.name}'/>" required>
            </div>

            <div class="field">
                <label for="email">Email</label>
                <input type="email" id="email" name="email"
                       value="<c:out value='${customer.email}'/>" required>
            </div>

            <div class="field">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone"
                       value="<c:out value='${customer.phone}'/>">
            </div>

            <div class="field">
                <label for="city">City</label>
                <input type="text" id="city" name="city"
                       value="<c:out value='${customer.city}'/>">
            </div>

            <div class="field">
                <label for="salary">Salary</label>
                <input type="number" id="salary" name="salary"
                       step="0.01" min="0" value="${customer.salary}">
            </div>

            <div class="field">
                <label for="address">Address</label>
                <input type="text" id="address" name="address"
                       value="<c:out value='${customer.address}'/>">
            </div>

            <div class="field">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob"
                       value="${customer.dob}">
            </div>

            <div class="buttons">
                <button type="submit">Update Customer</button>

                <a class="cancel"
                   href="${pageContext.request.contextPath}/customer/list">
                    Cancel
                </a>
            </div>
        </form>
    </div>
</body>
</html>
