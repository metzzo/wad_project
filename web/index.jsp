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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music Recommendation System</title>
    </head>

    <body>
        <div class="container">
            <h1 class="page-header">Music Recommendation System</h1>

            <c:if test="${sessionScope.user != null}">
                <h1>Hello ${$sessionScope.user.uname}</h1>
                <div class="btn-group" role="group">
                    <a role="button" class="btn btn-default" href="albumList">See the list of albums</a>
                    <a role="button" class="btn btn-default" href="addAlbum">Add an album</a>
                    <a role="button" class="btn btn-default" href="addReview">Add a review</a>
                </div>
            </c:if>

            <c:if test="${sessionScope.user == null}">
                <div class="btn-group" role="group">
                    <a role="button" class="btn btn-default" href="register">Register</a>
                    <a role="button" class="btn btn-default" href="login">Login</a>
                </div>
            </c:if>
        </div>
    </body>
</html>
