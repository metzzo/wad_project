package service;

import domain.User;

import java.sql.Connection;

/**
 * Created by rfischer on 25.04.16.
 */
public class UserDAO {
    private Connection connection;
    private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    private UserDAO() {
        connection = DBService.getInstance().getConnection();
    }

    public User register(User user) {
        // TODO
        return user;
    }

    public User login(User temporaryUser) {
        // TODO
        return temporaryUser;
    }
}
