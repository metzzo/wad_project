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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form method="post" action="loginController">
            <div class="form-element">
                <label for="uname">Username</label>
                <input type="text" name="uname" id="uname">
            </div>
            <div class="form-element">
                <label for="password">Password</label>
                <input type="password" name="pw" id="password">
            </div>
            <c:if test="${requestScope.login_message != null}">
                <b>${requestScope.login_message}</b>
            </c:if>

            <div class="form-element">
                <input type="submit" value="Login">
                <input type="reset" value="Reset">
            </div>
        </form>
    </body>
</html>
