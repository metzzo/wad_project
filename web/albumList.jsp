<%-- 
    Document   : albumList
    Created on : May 20, 2016, 4:46:50 PM
    Author     : isma94
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/includes.jspf" %>
        <%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
        <title>List of albums</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>

        <div class="container">

            <c:if test="${applicationScope.ALBUMS.isEmpty()}">
                <div class="alert alert-danger" role="alert">
                    <p><b>Sorry!</b> There are no albums in the system yet. Why don't you upload one? :D</p>
                </div>
            </c:if>

            <c:if test="${!applicationScope.ALBUMS.isEmpty()}">
                <div class="list-group album-list">
                    <c:forEach var="a" items="${applicationScope.ALBUMS}">
                        <div class="list-group-item album-card">
                            <div class="list-group-item-heading media">
                                <div class="media-left">
                                    <img class="media-object" src="album_img/${a.getCover()}" width="100" height="100"/>
                                </div>

                                <div class="media-body">
                                    <h3 class="media-heading"><b>${a.getAuthor()} - ${a.getTitle()} (${a.getYear()})</b></h3>
                                    <h4 class="list-group-item-text">Genre: ${a.getGenre()}</h4>
                                    <h4 class="list-group-item-text">Label: ${a.getLabel()}</h4>
                                </div>

                                <div class="media-right">
                                    <div class="btn-group" role="group">
                                        <div class="btn-group review-btn-group" role="group">
                                            <button class="btn btn-default score">
                                                <c:if test="${a.avgScore == -1}">
                                                    NO REVIEWS
                                                </c:if>
                                                <c:if test="${a.avgScore >= 0 and a.avgScore <= 0.5}">
                                                    ☆☆☆☆☆
                                                </c:if>
                                                <c:if test="${a.avgScore > 0.5 and a.avgScore <= 1.5}">
                                                    ★☆☆☆☆
                                                </c:if>
                                                <c:if test="${a.avgScore > 1.5 and a.avgScore <= 2.5}">
                                                    ★★☆☆☆
                                                </c:if>
                                                <c:if test="${a.avgScore > 2.5 and a.avgScore <= 3.5}">
                                                    ★★★☆☆
                                                </c:if>
                                                <c:if test="${a.avgScore > 3.5 and a.avgScore <= 4.5}">
                                                    ★★★★☆
                                                </c:if>
                                                <c:if test="${a.avgScore > 4.5 and avgScore <= 5}">
                                                    ★★★★★
                                                </c:if>
                                            </button>
                                            
                                            <c:if test="${sessionScope.user != null}">
                                                <form action="makeReviewController" method="post">
                                                    <input type="hidden" name="album_id" value="${a.id}" />
                                                    <input type="submit" class="btn btn-default" value="Add a review" />
                                                </form>
                                            </c:if>
                                            
                                            <form action="seeReviewsController" method="post">
                                                <input type="hidden" name="album_id" value="${a.id}" />
                                                <input type="submit" class="btn btn-default" value="See reviews" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </body>
</html>
