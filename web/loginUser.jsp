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
        <title>Login</title>
    </head>
    
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
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
