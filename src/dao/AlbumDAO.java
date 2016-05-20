/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Album;
import java.util.List;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author isma94
 */
@Stateless
public class AlbumDAO {

    @PersistenceContext(unitName = "testjpa")
    EntityManager em;
    
    public static AlbumDAO getInstance() {
        try {
            return (AlbumDAO) new InitialContext().lookup("java:module/AlbumDAO");
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public Album createAlbum(String title, String author, int year, String cover, String genre, String label) {
        Album newAlbum = null;
        
        if (!this.albumExists(title, author, year)) {
            newAlbum = new Album(title, author, year, cover, genre, label);
            
            em.persist(newAlbum);
            em.flush();
        }
        
        return newAlbum;
    }

    public boolean albumExists(String title, String author, int year) {
        return !em.createQuery(
            "SELECT a FROM Album a WHERE a.title = :title AND a.author = :author AND a.launchYear = :launchYear")
            .setParameter("title", title).setParameter("author", author).setParameter("launchYear", year)
            .getResultList().isEmpty();
    }
    
    public List<Album> getAllAlbums() {
        return em.createQuery("SELECT a FROM Album a").getResultList();
    }

}
