package dao;

import domain.Album;
import domain.Review;

import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by rfischer on 20.05.16.
 */
@Stateless
public class ReviewDAO {
    @PersistenceContext(unitName = "testjpa")
    EntityManager em;

    public static ReviewDAO getInstance() {
        try {
            return (ReviewDAO) new InitialContext().lookup("java:module/ReviewDAO");
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void persist(Review r) {
        if (r.getId() == null) {
            em.persist(r);
        } else {
            em.merge(r);
        }
        em.flush();
    }

    public List<Review> getReviewsForAlbum(Album a) {
        return em.createQuery("select r from Review r where r.album = :album").setParameter("album", a).getResultList();
    }

    public Review getReviewById(Long reviewId) {
        return em.find(Review.class, reviewId);
    }
}
