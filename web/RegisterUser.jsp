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
        <title>Registration</title>
    </head>
    <body>
        <h1>Registration</h1>
        <form method="post" action="register">
            <div class="form-element">
                <label for="uname">Username</label>
                <input type="text" name="uname" id="uname">
            </div>
            <div class="form-element">
                <label for="password">Password</label>
                <input type="password" name="pw" id="password">
            </div>
            <div class="form-element">
                <label for="rPassword">Repeat password</label>
                <input type="password" id="rPassword" name="pw2">
            </div>
            <div class="form-element">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
            <c:if test="${requestScope.errors != null && requestScope.errors.size() > 0}">
                <b>Please check the following issues:</b>
                <ul>
                    <c:forEach var="error" items="${requestScope.errors}">
                        <li>${error}</li>
                        </c:forEach>
                </ul>
            </c:if>

            <div class="form-element">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </div>
        </form>
    </body>
</html>
