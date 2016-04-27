package controller;

import domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rfischer on 25.04.16.
 */
public class RegisterUserController extends BaseServlet {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser();

        if (user != null) {
            // already logged in
            forward("/overview");
        } else {
            String uname = request.getParameter("uname"), pw = request.getParameter("pw"), pw2 = request.getParameter("repeatPw"), mail = request.getParameter("email");

        }
    }
}