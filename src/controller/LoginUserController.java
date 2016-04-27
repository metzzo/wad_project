package controller;

import domain.User;
import service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rfischer on 25.04.16.
 */
public class LoginUserController extends BaseServlet {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser();

        if (user != null) {
            forward("/overview");
        } else {
            String uname = request.getParameter("uname"), pw = request.getParameter("pw");

            if (uname != null && pw != null) {
                user = UserDAO.getInstance().login(new User(uname, pw, "", -1));

                if (user != null) {
                    // login successful
                    forward("/overview");
                } else {
                    // wrong credentials
                    request.setAttribute("login_message", "Wrong login credentials.");
                    forward("/loginUserView");
                }
            } else {
                // not yet pressed login button
                forward("/loginUserView");
            }
        }
    }
}