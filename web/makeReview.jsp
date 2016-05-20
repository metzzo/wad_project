<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 20.05.16
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/jspf/includes.jspf" %>
    <%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
    <title>List of Reviews</title>
</head>
<body>
<%@include file="/WEB-INF/jspf/header.jspf" %>
    <div class="container">
        <h1>Review album</h1>
        <div class="list-group-item-heading media">
            <div class="media-left">
                <img class="media-object" src="album_img/${requestScope.album.getCover()}" width="100" height="100"/>
            </div>

            <div class="media-body">
                <h4 class="media-heading">${requestScope.album.getAuthor()} - ${requestScope.album.getTitle()} (${requestScope.album.getYear()})</h4><br>
                <p class="list-group-item-text">Genre: ${requestScope.album.getGenre()}</p>
                <p class="list-group-item-text">Label: ${requestScope.album.getLabel()}</p>
            </div>

            <div class="media-right">
                <div class="btn-group" role="group">
                    <div class="btn-group review-button-group" role="group">
                        <p class="btn btn-default score">
                            <c:if test="${requestScope.album.avgScore == -1}">
                                -----
                            </c:if>
                            <c:if test="${requestScope.album.avgScore >= 0 and requestScope.album.avgScore <= 0.5}">
                                ☆☆☆☆☆
                            </c:if>
                            <c:if test="${requestScope.album.avgScore > 0.5 and requestScope.album.avgScore <= 1.5}">
                                ★☆☆☆☆
                            </c:if>
                            <c:if test="${requestScope.album.avgScore > 1.5 and requestScope.album.avgScore <= 2.5}">
                                ★★☆☆☆
                            </c:if>
                            <c:if test="${requestScope.album.avgScore > 2.5 and requestScope.album.avgScore <= 3.5}">
                                ★★★☆☆
                            </c:if>
                            <c:if test="${requestScope.album.avgScore > 3.5 and requestScope.album.avgScore <= 4.5}">
                                ★★★★☆
                            </c:if>
                            <c:if test="${requestScope.album.avgScore > 4.5 and avgScore <= 5}">
                                ★★★★★
                            </c:if>
                        </p><br>
                    </div>
                </div>
            </div>
        </div>
        <form action="makeReviewController" method="post">
            <input type="hidden" name="album_id" value="${requestScope.album.id}" />
            <div class="input-group">
                <label for="score">Score:</label>
                <select class="form-control" name="score" id="score" required>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="input-group">
                <label for="review">Review:</label>
                <textarea placeholder="What do you think..." class="form-control" name="review" id="review" required></textarea>
            </div>

            <input type="submit" value="Make review" class="btn btn-default" />
        </form>
    </div>
</body>
</html>
