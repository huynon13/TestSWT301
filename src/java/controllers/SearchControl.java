package controllers;

import dal.DAO;
import dal.PagingProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Categories;
import models.Product;

public class SearchControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    } 

 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    DAO dao = new DAO();

    String txt = request.getParameter("searchtxt");
    List<Product> listP = dao.getAllProductByName(txt);

    if (listP.isEmpty()) {
        request.setAttribute("mess", "Don't have product with this name");
        request.setAttribute("messDisplay", "block; text-align: center; margin: 200px");
    } else {
        request.setAttribute("messDisplay", "none");
    }

    // Lấy danh sách danh mục
    List<Categories> listCategories = dao.getAllCategories(); // Gọi phương thức này
    request.setAttribute("listCategories", listCategories);

    request.setAttribute("listProduct", listP);
    request.setAttribute("none1", "none");
    request.setAttribute("none2", "none");
    request.setAttribute("none3", "block");

    request.getRequestDispatcher("admin.jsp").forward(request, response);
}




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response); // Gọi lại doGet để xử lý POST
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
