<%--
  Created by IntelliJ IDEA.
  User: rfischer
  Date: 20.05.16
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@page import="domain.Album"%>
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
            <c:if test="${requestScope.album == null}">
                <div class="alert alert-danger" role="alert">
                    <p><b>Sorry!</b> There are no albums in the system yet. Why don't you upload one? :D</p>
                </div>
            </c:if>

            <c:if test="${requestScope.album != null}">
                <h2 class="page-header">List of reviews</h2>

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
                                        <% System.out.println(((Album) request.getAttribute("album")).getAvgScore()); %>
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

                                    <c:if test="${sessionScope.user != null}">
                                        <form action="makeReviewController" method="post">
                                            <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                                            <input type="submit" class="btn btn-default" value="Add a review" />
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group review-list">
                    
                    <c:forEach var="r" items="${requestScope.reviews}">
                        <div class="list-group-item review-card">
                            <div class="list-group-item-heading media">
                                
                                <div class="media-body">
                                    <h3 class="media-heading">Review by <b>${r.user.uname}</b></h3><br>
                                    <p class="review-text">${r.review}</p>
                                    
                                    <hr>
                                    
                                    <div class="comment-list">
                                        <h4 class="comment-header"><b>Comments</b></h4>
                                        <c:forEach var="c" items="${r.comments}">
                                            <p class="list-group-item-text"><b>${c.user.uname}:</b> ${c.text}</p>
                                        </c:forEach>
                                    </div>
                                        
                                    <c:if test="${sessionScope.user != null}">
                                        <form action="seeReviewsController" method="post">
                                            <input type="hidden" name="album_id" value="${requestScope.album.id}" />
                                            <input type="hidden" name="review_id" value="${r.id}" />
                                            <input type="text" name="comment" placeholder="Your comment here" />
                                            
                                            <input type="submit" value="Send comment"/>
                                            <input type="reset" value="Reset"/>
                                        </form>
                                    </c:if>
                                    </p>
                                </div>

                                <div class="media-right">
                                    <div class="btn-group" role="group">
                                        <div class="btn-group review-btn-group" role="group">
                                            <button class="btn btn-default score">
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
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                    
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
            </div>
        </c:if>
    </div>
</body>
</html>
