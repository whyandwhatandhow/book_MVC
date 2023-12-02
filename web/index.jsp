<%--
  Created by IntelliJ IDEA.
  User: dd
  Date: 2023/11/28
  Time: 23:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Page Title</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
      color: #495057;
      margin: 20px;
    }

    h1 {
      color: #007bff;
    }

    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Welcome to Your Book Page</h1>
  <p>Explore a collection of amazing books!</p>
  <a href="${pageContext.request.contextPath}/book/allBook">Go to Book Page</a>
</div>
</body>
</html>
