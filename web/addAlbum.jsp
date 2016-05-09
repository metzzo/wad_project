<%-- 
    Document   : addAlbum
    Created on : May 8, 2016, 8:40:25 PM
    Author     : isma94
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a new album</title>
    </head>
    
    <body>
        <h1>Add a new album</h1>
        
        <form role="form" method="post" action="AddAlbumController">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" class="form-control" id="author" name="author" required>
            </div>
            
            <div class="form-group">
                <label for="year">Year:</label>
                
                <select class="form-control" id="year" name="year" required>
                    <% for (int i = Calendar.getInstance().get(Calendar.YEAR); i >= 1900; i--)
                        out.println("<option>" + i + "</option>");
                    %>
                </select>
            </div>
                
            <div class="form-group">
                <label for="genre">Genre:</label>
                <select class="form-control" name="genre" id="genre" required>
                    <option>Blues</option>
                    <option>Country</option>
                    <option>Electronic</option>
                    <option>Folk</option>
                    <option>Hip hop</option>
                    <option>Jazz</option>
                    <option>Latin</option>
                    <option>Pop</option>
                    <option>R&B</option>
                    <option>Soul</option>
                    <option>Rock</option>
                    <option>Metal</option>
                </select>
            </div>

            <div class="form-group">
                <label for="label">Label:</label>
                <input type="text" class="form-control" id="label" name="label" required>
            </div>
            
            <div class="checkbox">
                <label><input type="checkbox">Remember me</label>
            </div>
            
            <button type="submit" class="btn btn-default">Submit</button>
            <button type="reset" class="btn btn-default">Reset</button>
        </form>
                
        <%@include file="/WEB-INF/jspf/formCheck.jspf" %>
    </body>
</html>
