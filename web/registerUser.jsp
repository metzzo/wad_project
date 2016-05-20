<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 25.04.16
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/includes.jspf" %>
        <title>Registration</title>
    </head>
    
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
        <h1>Registration</h1>
        <form method="post" action="registerController">
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
