/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Album;
import java.util.EnumSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NameClassPair;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author isma94
 */
public class AlbumDAOImpl implements AlbumDAO {
    
    private static AlbumDAO instance = null;
    
    @PersistenceContext(unitName = "testjpa")
    EntityManager em;
    
    public static AlbumDAO getInstance() {
        if (instance == null) {
            try {
                instance = (AlbumDAO) new InitialContext().lookup("java:global/AlbumDAOImpl");
                /*
                NamingEnumeration<NameClassPair> ne = new InitialContext().list("java:module");
                
                NameClassPair ncp = null;
                
                while (ne.hasMore()) {
                    ncp = ne.next();
                    
                    System.out.println(ncp.toString());
                }*/
            } catch (NamingException ex) {
                Logger.getLogger(AlbumDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return instance;
    }
    
    @Override
    public Album createAlbum(String title, String author, int year, String genre, String label) {
        Album newAlbum = null;
        
        if (!this.albumExists(title, author, year)) {
            newAlbum = new Album(title, author, year, genre, label);
            
            em.persist(newAlbum);
            em.flush();
        }
        
        return newAlbum;
    }

    @Override
    public boolean albumExists(String title, String author, int year) {
        return !em.createQuery(
            "SELECT a FROM Album a WHERE a.title = :title and a.author = :author and a.year = :year")
            .setParameter("title", title).setParameter("author", author).setParameter("year", year)
            .getResultList().isEmpty();
    }

}
