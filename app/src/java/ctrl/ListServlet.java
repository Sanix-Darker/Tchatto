/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modl.Groupe;

/**
 *
 * @author admin
 */
public class ListServlet extends HttpServlet {

    String tabgroup ;
    Groupe gp = new Groupe();
    
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession session = request.getSession();
            String nom = (String) session.getAttribute("USER");
            String code = (String) session.getAttribute("CODE");
            
            if (nom != null && code != null) {
                
                if (Arrays.asList(tabgroup).contains(code)){
                    response.sendRedirect("Messages.jsp?type=OldGroup&groupe="+code);
                }else{
                    try {
                        gp.setCode(code);
                        gp.addUsers(nom);
                        tabgroup += "|"+code;
                    } catch (Exception e) {
                    }
                    response.sendRedirect("Messages.jsp?type=NewGroup&groupe="+gp.getCode());
                }

            } else {
              response.sendRedirect("Login.html");
            }
            
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
    
    public static boolean dedans(List<String> myList, String targetValue) {
        String search = targetValue;
        for(String str: myList) {
            if(str.trim().contains(search))
               return true;
        }
        return false;
    }
}
