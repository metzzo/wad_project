package controller;

import domain.User;
import service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by rfischer on 25.04.16.
 */
public class RegisterUserController extends BaseServlet {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        User user = getUser();

        if (user != null) {
            // already logged in
            forward("/");
        } else {
            String uname = request.getParameter("uname"), pw = request.getParameter("pw"), pw2 = request.getParameter("pw2"), mail = request.getParameter("email");

            if (uname == null || pw == null || pw2 == null || mail == null) {
                forward("/registerUserView");
            } else {
                boolean equalPw = pw.equals(pw2);
                boolean alreadyExists = UserDAO.getInstance().doesUsernameExist(uname);

                List<String> errors = new ArrayList<String>();

                if (!equalPw) {
                    errors.add("Passwords must match");
                }

                if (alreadyExists) {
                    errors.add("Username already taken");
                }

                if (uname.length() < 3) {
                    errors.add("Username too short");
                }

                if (mail.length() < 3 || !mail.contains("@") || !mail.contains(".")) {
                    errors.add("Invalid e-mail address");
                }

                request.setAttribute("errors", errors);

                if (errors.size() == 0) {
                    System.out.println("Register user");
                    User u = UserDAO.getInstance().register(new User(uname, pw, mail, null));
                    if (u != null) {
                        // success
                        forward("/index.jsp");
                    } else {
                        // not sucess
                        forward("/registerUserView");
                    }
                } else {
                    System.out.println("Not possible");
                    forward("/registerUserView");
                }
            }
        }
    }
}