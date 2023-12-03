<%@ page import="com.ymd.pojo.Books" %><%--
  Created by IntelliJ IDEA.
  User: dd
  Date: 2023/11/30
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Book</title>
  <!-- Add Bootstrap CSS link here -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
      color: #495057;
    }

    .container {
      margin: 20px;
    }

    h1 {
      color: #007bff;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h1>修改书籍信息</h1>
    </div>
  </div>

  <div class="row">
    <div class="col-md-6">
      <!-- Book Form -->
      <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <input type="hidden" name="book_id" value="${QuBooks.book_id}">

        <div class="form-group">
          <label>书籍名称:</label>
          <input type="text" class="form-control" name="book_name" value="${QuBooks.book_name}" required>
        </div>
        <div class="form-group">
          <label>出版社:</label>
          <input type="text" class="form-control" name="publish" value="${QuBooks.publish}" required>
        </div>
        <div class="form-group">
          <label>用户编号:</label>
          <input type="text" class="form-control" name="user_id" value="${QuBooks.user_id}" required>
        </div>
        <button type="submit" class="btn btn-primary">修改</button>
      </form>
    </div>
  </div>
</div>

<!-- Add Bootstrap JS and Popper.js scripts here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
</body>
</html>
