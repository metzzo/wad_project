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
        <title>Review an album</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>

        <div class="container">
            <c:if test="${requestScope.album == null}">
                <div class="alert alert-danger" role="alert">
                    <p><b>Sorry!</b> There are no albums in the system yet. Why don't you upload one? :D</p>
                </div>
            </c:if>

            <c:if test="${requestScope.album != null}">
                <h2 class="page-header">Review this album</h2>

                <div class="list-group-item album-card">
                    <div class="list-group-item-heading media">
                        <div class="media-left">
                            <img class="media-object" src="album_img/${requestScope.album.getCover()}" width="100" height="100"/>
                        </div>

                        <div class="media-body">
                            <h3 class="media-heading"><b>${requestScope.album.getAuthor()} - ${requestScope.album.getTitle()} (${requestScope.album.getYear()})</b></h3>
                            <h4 class="list-group-item-text">Genre: ${requestScope.album.getGenre()}</h4>
                            <h4 class="list-group-item-text">Label: ${requestScope.album.getLabel()}</h4>
                        </div>

                        <div class="media-right">
                            <div class="btn-group" role="group">
                                <div class="btn-group review-btn-group" role="group">
                                    <button class="btn btn-default score">
                                        <c:if test="${requestScope.album.avgScore == -1}">
                                            NO REVIEWS
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
                                    </button>

                                    <form action="seeReviewsController" method="post">
                                        <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                                        <input type="submit" class="btn btn-default" value="See reviews" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <form method="post" action="makeReviewController">
                    <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                    
                    <div class="form-group">
                        <div class="input-group">
                            <label for="score">Score:</label>
                            <select class="form-control" name="score" id="score" required>
                                <option value="0">☆☆☆☆☆</option>
                                <option value="1">★☆☆☆☆</option>
                                <option value="2">★★☆☆☆</option>
                                <option value="3">★★★☆☆</option>
                                <option value="4">★★★★☆</option>
                                <option value="5">★★★★★</option>
                            </select>
                        </div>

                        <div class="input-group">
                            <label for="review">Review:</label>
                            <textarea placeholder="What do you think about the album?" class="form-control" name="review" id="review" required></textarea>
                        </div>
                    </div>

                    <input class="btn btn-default" type="submit" value="Send">
                    <input class="btn btn-default" type="reset" value="Reset">
                </form>
            </c:if>
        </div>
    </body>
</html>
