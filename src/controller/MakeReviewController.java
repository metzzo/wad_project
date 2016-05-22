package controller;

import dao.AlbumDAO;
import dao.ReviewDAO;
import domain.Album;
import domain.Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rfischer on 20.05.16.
 */
public class MakeReviewController extends BaseServlet {
    
    AlbumDAO albumDAO = AlbumDAO.getInstance();
    ReviewDAO reviewDAO = ReviewDAO.getInstance();
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Album album = null;
        
        if (request.getParameter("album_id") != null) {
            album = AlbumDAO.getInstance().getAlbumById(Long.valueOf(request.getParameter("album_id")));
            request.setAttribute("album", album);
        }

        String review = request.getParameter("review");
        String score = request.getParameter("score");
        
        if (review != null && score != null && album != null && this.getUser() != null) {
            Review r = new Review(album, this.getUser(), review, Integer.valueOf(score));
            
            reviewDAO.persist(r);
            
            // Update the album average with the new score
            albumDAO.updateAvgScore(album);
            
            // Update the list of albums in the application context in order to see the new average
            this.getServletContext().setAttribute("ALBUMS", albumDAO.getAllAlbums());

            this.forward("seeReviewsController");
        } else {
            this.forward("makeReviewView");
        }
    }
}
