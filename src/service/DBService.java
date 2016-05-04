package service;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.persistence.*;
import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created by rfischer on 22.04.16.
 */
public class DBService {
    private static DBService instance;

    @PersistenceContext
    EntityManagerFactory emf;
    EntityManager em;

    private DBService() {
        emf = Persistence.createEntityManagerFactory("testjpa");
        em = emf.createEntityManager();
    }

    public static DBService getInstance() {
        if (instance == null) {
            instance = new DBService();
        }
        return instance;
    }

    public EntityManager getManager() {
        return em;
    }
}
