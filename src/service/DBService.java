package service;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created by rfischer on 22.04.16.
 */
public class DBService {
    private static DBService instance;
    private Connection connection;

    public static DBService getInstance() {
        if (instance == null) {
            instance = new DBService();
        }
        return instance;
    }

    public Connection getConnection() {
        if (connection == null) {
            try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource) ctx.lookup("jdbc/myDatasource");
                connection = ds.getConnection();
                connection.setAutoCommit(false);
            } catch (Exception e) {
                System.err.println("Could not establish database connection");
                e.printStackTrace();
            }
        }
        return connection;
    }
}
