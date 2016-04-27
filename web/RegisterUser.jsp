<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 25.04.16
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>Registration form</h1>
<form method="post" action="registrationController">
    <div class="form-element">
        <label for="username">Username</label>
        <input type="text" name="uname" id="uname">
    </div>
    <div class="form-element">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
    </div>
    <div class="form-element">
        <label for="rPassword">Repeat password</label>
        <input type="password" id="rPassword">
    </div>
    <div class="form-element">
        <label for="email">Email</label>
        <input type="email" id="email" name="email">
    </div>
    <c:if test="${requestScope.registration_msg != null}">
        <b>${requestScope.registration_msg}</b>
    </c:if>

    <div class="form-element">
        <input type="submit" value="Submit">
        <input type="reset" value="Reset">
    </div>
</body>
</html>
