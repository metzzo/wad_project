package controller;

import domain.MyUser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rfischer on 25.04.16.
 */
public abstract class BaseServlet extends javax.servlet.http.HttpServlet {
    
    private HttpServletRequest request;
    private HttpServletResponse response;
    
    /****************************
     ***** ABSTRACT METHODS *****
     ****************************/
    
    /**
     * Called when servlet is opened
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    protected abstract void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    
    
    /*******************************
     ***** IMPLEMENTED METHODS *****
     *******************************/
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        myProcessRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        myProcessRequest(request, response);
    }

    private void myProcessRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpServletResponse tmpResponse = this.response;
        HttpServletRequest tmpRequest = this.request;

        this.response = response;
        this.request = request;

        processRequest(request, response);

        this.response = tmpResponse;
        this.request = tmpRequest;
    }

    /**
     * Returns User object from Session object
     * @return
     */
    public MyUser getUser() {
        Object obj = request.getSession().getAttribute("user");
        return obj == null || !(obj instanceof MyUser) ? null : (MyUser)obj;
    }

    /**
     * Forwards current request to given URL
     * @param url
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    public void forward(String url) {
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
