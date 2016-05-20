/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AlbumDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author isma94
 */
@MultipartConfig
public class AddAlbumController extends HttpServlet {
    
    AlbumDAO albumDAO = AlbumDAO.getInstance();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        
        boolean hasErrors = false;
        String error = "";
        
        // Get introduced values in the form (except the cover image, that requires special treatment)
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int year = Integer.parseInt(request.getParameter("year"));
        String genre = request.getParameter("genre");
        String label = request.getParameter("label");
        
        // Get the information of the uploaded image file
        Part coverImg = request.getPart("cover");
        String coverImgName = coverImg.getSubmittedFileName();
        InputStream coverImgContent = coverImg.getInputStream();
        
        // Define the path to the final storage location
        File imageFolder = new File(getServletContext().getRealPath("/album_img"));
        
        // When an image with the same name already exists, modify the name to not override it
        File coverFile = new File(imageFolder, coverImgName);
        int i = 0;
        
        while (Files.exists(coverFile.toPath())) {
            // Separate the name and the extension of the image
            String[] imgNameParts = coverImgName.split("\\.(?=[^\\.]+$)");
            
            // Create the new name and join it with the extension
            coverFile = new File(imageFolder, imgNameParts[0] + i + '.' + imgNameParts[1]);
            
            i++;
        }
        
        // Save the image file in the server's disk file system
        Files.copy(coverImgContent, coverFile.toPath());
        
        if (albumDAO.albumExists(title, author, year)) {
            hasErrors = true;
            error = "This album already exists";
        }
        
        if (hasErrors) {
            request.setAttribute("formError", error);

            rd = request.getRequestDispatcher("addAlbumView");
            rd.forward(request, response);
        } else {
            albumDAO.createAlbum(title, author, year, coverFile.getPath(), genre, label);

            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
