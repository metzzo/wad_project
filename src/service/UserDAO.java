package service;

import domain.User;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.transaction.Transaction;
import java.sql.Connection;

/**
 * Created by rfischer on 25.04.16.
 */
public class UserDAO {
    @PersistenceContext
    EntityManager em;


    public static UserDAO getInstance() {
        try {
            return (UserDAO) new InitialContext().lookup("java:module/UserDAO");
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        }
    }

    private UserDAO() {

    }

    public User register(User user) {
        try {
            if (doesUsernameExist(user.getUname())) {
                return null;
            }

            //EntityTransaction t = DBService.getInstance().getManager().getTransaction();
            //t.begin();
            em.persist(user);
            //t.commit();
            em.flush();

            return user;
        } catch (Exception ex) {
            System.err.println(ex);
            return null;
        }
    }

    public User login(User temporaryUser) {
        try {
            User u = (User)em
                    .createQuery("select u from User u where u.uname = :uname and u.pw = :pw")
                    .setParameter("uname", temporaryUser.getUname())
                    .setParameter("pw", temporaryUser.getPw())
                    .getSingleResult();
            return u;
        } catch (Exception ex) {
            return null;
        }
    }

    public boolean doesUsernameExist(String uname) {
        try {
            int count =
                    ((Number)em
                            .createQuery("select count(u) from User u where u.uname = :uname")
                            .setParameter("uname", uname)
                            .getSingleResult()).intValue();

            return count > 0;
        } catch (Exception ex) {
            System.out.println(ex);
            return false;
        }
    }
}
