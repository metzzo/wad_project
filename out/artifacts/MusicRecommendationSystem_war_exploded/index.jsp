<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 25.04.16
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title></title>
  </head>
  <body>
        <h1>Music Recommendation System</h1>
        <c:if test="${sessionScope.user != null}">
            <h1>Hello ${$sessionScope.user.uname}</h1>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <a href="register">Register</a>
            <a href="login">Login</a>
        </c:if>

  </body>
</html>
