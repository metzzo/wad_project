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
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Album album = null;
        if (request.getParameter("album_id") != null) {
            album = AlbumDAO.getInstance().getAlbumById(Long.valueOf(request.getParameter("album_id")));
            request.setAttribute("album", album);
        }

        String review = request.getParameter("review");
        String score = request.getParameter("score");
        if (review != null &&  score != null && album != null && getUser() != null) {
            Review r = new Review(album, getUser(), review, Integer.valueOf(score));
            ReviewDAO.getInstance().persist(r);

            forward("seeReviewController");
        } else {
            forward("makeReviewView");
        }
    }
}
