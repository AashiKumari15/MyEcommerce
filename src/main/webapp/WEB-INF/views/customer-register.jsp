
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        .navbar {
            background: #222;
            padding: 16px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 25px;
        }

        .container {
            max-width: 600px;
            margin: 35px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px #ddd;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 14px 0 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            margin-top: 22px;
            padding: 12px 20px;
            background: #222;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #444;
        }

        .back-link {
            margin-left: 15px;
            color: #222;
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/customer/list">Home</a>
        <a href="${pageContext.request.contextPath}/customer/register">Register</a>
    </nav>

    <div class="container">
        <h2>Customer Registration</h2>

        <form action="${pageContext.request.contextPath}/customer/register"
              method="post">

            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter full name" required minlength="2" maxlength="100">

            <label for="email">Email</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter email address" required maxlength="100">

            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone"
                   placeholder="Enter phone number"
                   pattern="[0-9]{10}" maxlength="10"
                   title="Enter a 10-digit phone number">

            <label for="city">City</label>
            <input type="text" id="city" name="city"
                   maxlength="50" placeholder="Enter city">

            <label for="salary">Salary</label>
            <input type="number" id="salary" name="salary"
                   step="0.01" min="0" max="999999999" placeholder="Enter salary">

            <label for="address">Address</label>
            <input type="text" id="address" name="address"
                    maxlength="255" placeholder="Enter address">

            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob"
             max="<%= java.time.LocalDate.now() %>">

            <button type="submit">Register Customer</button>

            <a class="back-link"
               href="${pageContext.request.contextPath}/customer/list">
                Back to Customer List
            </a>
        </form>
    </div>

</body>
</html>
