/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import dal.PagingProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;
import models.Categories;
import models.Collections;
import models.Product;

/**
 *
 * @author dinhd513
 */
public class ManageControl extends HttpServlet {

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

//        DAO dao = new DAO();
//        List<Product> list = dao.getAllProduct();
//        List<Categories> listca = dao.getAllCategories();
//        List<Collections> listco = dao.getAllCollections();
//        request.setAttribute("listProduct", list);
//        request.setAttribute("listCategories", listca);
//        request.setAttribute("listCollections", listco);
        HttpSession session = request.getSession();
        
        Account acc = (Account) session.getAttribute("account");
        if (acc == null|| acc.getRole() == 1) {
            response.sendRedirect("error404.jsp");
        }else{
            try {
                DAO dao = new DAO();
                PagingProductDAO paginDao = new PagingProductDAO();

                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }

                int index = Integer.parseInt(indexPage);
                if (index == 0) {
                    index = 1;
                }

                int total = paginDao.getTotalAllProduct();
                int endPage = total / 6;
                if (endPage % 6 != 0) {
                    endPage++;

                }

                if (index >= endPage) {
                    index = endPage;
                }

                request.setAttribute("endPage", endPage);

                List<Product> list = paginDao.pagingAllProduct(index);
                request.setAttribute("listProduct", list);

                request.setAttribute("indexNow", index);

                List<Categories> listca = dao.getAllCategories();
                List<Collections> listco = dao.getAllCollections();
                request.setAttribute("listCategories", listca);
                request.setAttribute("listCollections", listco);
                request.setAttribute("none1", "block");

                request.getRequestDispatcher("admin.jsp").forward(request, response);
                request.getRequestDispatcher("addproduct.jsp").forward(request, response);
           
        } catch (Exception e) {
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

}
