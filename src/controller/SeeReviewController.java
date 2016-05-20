package controller;

import dao.AlbumDAO;
import dao.ReviewDAO;
import domain.Album;
import domain.Comment;
import domain.Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by rfischer on 20.05.16.
 */
public class SeeReviewController extends BaseServlet {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("album_id") != null) {
            Album album = AlbumDAO.getInstance().getAlbumById(Long.valueOf(request.getParameter("album_id")));
            request.setAttribute("album", album);

            String reviewId = request.getParameter("review_id");
            String text = request.getParameter("comment");

            if (reviewId != null && text != null) {
                Review review = ReviewDAO.getInstance().getReviewById(Long.valueOf(reviewId));
                Comment comment = new Comment(text, getUser());
                review.getComments().add(comment);
                ReviewDAO.getInstance().persist(review);
            }

            List<Review> reviews = ReviewDAO.getInstance().getReviewsForAlbum(album);
            request.setAttribute("reviews", reviews);

            forward("seeReviewView");
        } else {
            forward("/");
        }
    }
}
