<%-- 
    Document   : reviewView
    Created on : Apr 25, 2016, 1:14:46 PM
    Author     : isma94
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Review an album</title>
    </head>
    
    <body>
        <h1>Album review</h1>
        
        <form method="post" action="ReviewController">
                <div class="form-element">
                    <label for="title">Title</label>
                    <input type="title" name="title" id="title" required>
                </div>
                
                <div class="form-element">
                    <label for="password">Author</label>
                    <input type="password" name="password" id="password" required>
                </div>
                
                <div class="form-element">
                    <label for="genre">Genre</label>
                    <select name="genre" id="genre" required>
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
                    </select>
                </div>
                
                <div class="form-element">
                    <label for="email">Review</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-element">
                    <label for="gender">Score</label>
                    <input type="radio" name="gender" value="male" checked>Male
                    <input type="radio" name="gender" value="female">Female
                </div>
                
                <div class="form-element">
                    <label for="spam">Subscribe to mail list</label>
                    <input type="checkbox" name="spam" id="spam">
                </div> 
                
                <div class="form-element">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>
            </form>
    </body>
</html>
