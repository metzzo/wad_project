package controller;

import domain.MyUser;
import dao.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by rfischer on 25.04.16.
 */
public class RegisterUserController extends BaseServlet {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        MyUser user = getUser();

        if (user != null) {
            // already logged in
            forward("/");
        } else {
            String uname = request.getParameter("uname"), pw = request.getParameter("pw"), pw2 = request.getParameter("pw2"), mail = request.getParameter("email");

            if (uname == null || pw == null || pw2 == null || mail == null) {
                forward("/registerView");
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

                if (errors.isEmpty()) {
                    MyUser u = UserDAO.getInstance().register(new MyUser(uname, pw, mail, null));
                    
                    if (u != null) {
                        // success
                        forward("/index.jsp");
                    } else {
                        // not sucess
                        forward("/registerView");
                    }
                } else {
                    forward("/registerView");
                }
            }
        }
    }
}