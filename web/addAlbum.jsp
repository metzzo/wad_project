<%-- 
    Document   : addAlbum
    Created on : May 8, 2016, 8:40:25 PM
    Author     : isma94
--%>

<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/jspf/includes.jspf" %>
        <title>Add a new album</title>
    </head>

    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
        <h2 class="page-header">Add a new album</h2>
        
        <div class="container">
            <form role="form" method="post" action="addAlbumController" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="input-group">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="input-group">
                        <label for="author">Author:</label>
                        <input type="text" class="form-control" id="author" name="author" required>
                    </div>

                    <div class="input-group">
                        <label for="year">Year:</label>

                        <select class="form-control" name="year" required>
                            <%  int currentYear = Calendar.getInstance().get(Calendar.YEAR);
                                
                                out.println("<option selected>" + currentYear + "</option>");
                                
                                for (int i = (currentYear - 1); i >= 1900; i--) {
                                    out.println("<option>" + i + "</option>");
                                }
                            %>
                        </select>
                    </div>
                        
                    <div class="input-group">
                        <label for="cover">Cover:</label>
                        <input type="file" name="cover" id="cover" accept="image/*" required>
                    </div>

                    <div class="input-group">
                        <label for="genre">Genre:</label>
                        <select class="form-control" name="genre" required>
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

                    <div class="input-group">
                        <label for="label">Label:</label>
                        <input type="text" class="form-control" id="label" name="label" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
            </form>
        </div>

        <%@include file="/WEB-INF/jspf/formCheck.jspf" %>
    </body>
</html>
