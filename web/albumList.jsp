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
            <div class="list-group">
                <c:forEach var="a" items="${applicationScope.ALBUMS}">
                    <a href="#" class="list-group-item">
                        <div class="list-group-item-heading media">
                            <div class="media-left">
                                <img class="media-object" src="img/${a.getCover()}" width="100" height="100"/>
                            </div>
                            
                            <div class="media-body">
                                <h4 class="media-heading">${a.getAuthor()} - ${a.getTitle()} (${a.getYear()})</h4><br>
                                <p class="list-group-item-text">Genre: ${a.getGenre()}</p>
                                <p class="list-group-item-text">Label: ${a.getLabel()}</p>
                            </div>
                            
                            <div class="media-right">
                                <div class="btn-group" role="group">
                                    <div class="btn-group review-button-group" role="group">
                                        <p class="btn btn-default score">
                                            <c:if test="avgScore == -1">
                                                NOT REVIEWED YET
                                            </c:if>
                                            <c:if test="avgScore >= 0 and avgScore <= 0.5">
                                                ☆☆☆☆☆
                                            </c:if>
                                            <c:if test="avgScore > 0.5 and avgScore <= 1.5">
                                                ★☆☆☆☆
                                            </c:if>
                                            <c:if test="avgScore > 1.5 and avgScore <= 2.5">
                                                ★★☆☆☆
                                            </c:if>
                                            <c:if test="avgScore > 2.5 and avgScore <= 3.5">
                                                ★★★☆☆
                                            </c:if>
                                            <c:if test="avgScore > 3.5 and avgScore <= 4.5">
                                                ★★★★☆
                                            </c:if>
                                            <c:if test="avgScore > 4.5 and avgScore <= 5">
                                                ★★★★★
                                            </c:if>
                                        </p><br>
                                        
                                        <button type="button" class="btn btn-default">See reviews</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </body>
</html>