<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 25.04.16
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
<h1>Login form</h1>
<form method="post" action="login">
    <div class="form-element">
        <label for="uname">Username</label>
        <input type="text" name="uname" id="uname">
    </div>
    <div class="form-element">
        <label for="password">Password</label>
        <input type="password" name="pw" id="password">
    </div>
    <c:if test="${requestScope.registration_msg != null}">
        <b>${requestScope.registration_msg}</b>
    </c:if>

    <div class="form-element">
        <input type="submit" value="Login">
        <input type="reset" value="Reset">
    </div>
</form>
</body>
</html>
