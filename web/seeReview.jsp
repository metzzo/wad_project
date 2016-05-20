<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 20.05.16
  Time: 22:37
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
                <c:if test="${sessionScope.user != null}">
                    <form action="makeReviewController" method="post">
                        <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                        <input type="submit" class="btn btn-default" value="Add Review" />
                    </form>
                </c:if>
            </div>
        </div>

        <div class="list-group">
            <c:forEach var="r" items="${requestScope.reviews}">
                <a href="#" class="list-group-item">
                    <div class="list-group-item-heading media">
                        <div class="media-body">
                            <h4 class="media-heading">Review by ${r.user.uname}</h4><br>
                            <p class="list-group-item-text">${r.review}</p>
                            <p>
                                <h4>Comments</h4>
                                <c:forEach var="c" items="${r.comments}">
                                    ${c.user.uname}: ${c.text} <br />
                                </c:forEach>
                                <c:if test="${sessionScope.user != null}">
                                    <form action="seeReviewController" method="post">
                                        <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                                        <input type="hidden" name="review_id" value="${r.id}" />
                                        <input type="text" name="comment" placeholder="Your comment..." />
                                        <input type="submit" value="Add comment" />
                                    </form>
                                </c:if>
                            </p>
                        </div>

                        <div class="media-right">
                            <div class="btn-group" role="group">
                                <div class="btn-group review-button-group" role="group">
                                    <p class="btn btn-default score">
                                        <c:if test="${r.score == 0}">
                                            ☆☆☆☆☆
                                        </c:if>
                                        <c:if test="${r.score == 1}">
                                            ★☆☆☆☆
                                        </c:if>
                                        <c:if test="${r.score == 2}">
                                            ★★☆☆☆
                                        </c:if>
                                        <c:if test="${r.score == 3}">
                                            ★★★☆☆
                                        </c:if>
                                        <c:if test="${r.score == 4}">
                                            ★★★★☆
                                        </c:if>
                                        <c:if test="${r.score == 5}">
                                            ★★★★★
                                        </c:if>
                                    </p><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
