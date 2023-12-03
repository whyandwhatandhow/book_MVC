<%@ page import="com.ymd.pojo.Books" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Display Books</title>
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

    .table-header th {
      background-color: #007bff;
      color: #fff;
    }

    .table-hover tbody tr:hover {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div>
        <h1>书籍展示</h1>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <table class="table table-hover table-header">
        <thead>
        <tr>
          <th>书籍编号</th>
          <th>书籍名称</th>
          <th>出版社</th>
          <th>用户编号</th>
        </tr>
        </thead>
        <tbody>
        <% for (Books book : (List<Books>) request.getAttribute("list")) { %>
        <tr>
          <td><%= book.getBook_id()%></td>
          <td><%= book.getBook_name()%></td>
          <td><%= book.getPublish()%></td>
          <td><%= book.getUser_id()%></td>
          <td class="action-buttons">
            <a href="${pageContext.request.contextPath}/book/toUpdate?id=<%=book.getBook_id()%>">修改</a>  &nbsp; | &nbsp;
            <a href="${pageContext.request.contextPath}/book/deleteBook?id=<%=book.getBook_id()%>">删除</a>
          </td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Add Book Button -->
  <div class="row">
    <div class="col-md-12">
      <a href="${pageContext.request.contextPath}/book/toAddBook" class="btn btn-primary">添加书籍</a>
    </div>
    <div class="col-md-12">
      <form action="${pageContext.request.contextPath}/book/queryBook" method="post" class="form-inline mb-3">
        <input type="text" name="queryBookName" class="form-controller" placeholder="请输入要查询的书籍">
        <input type="submit" value="查询">
      </form>
    </div>
  </div>
</div>

<!-- Add Bootstrap JS and Popper.js scripts here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
</body>
</html>
