package filter;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.Product;
import dal.DAO;
import jakarta.servlet.annotation.WebServlet;
import models.Categories;

public class FilterByCategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Khởi tạo đối tượng DAO
        DAO productDAO = new DAO();

        // Lấy ID danh mục từ tham số yêu cầu
        String categoryId = request.getParameter("categoryId");

        // Gọi phương thức từ DAO để lấy danh sách sản phẩm theo danh mục
        List<Product> listProduct = productDAO.getAllProductBycaId(categoryId);

        // Đưa danh sách sản phẩm tìm được vào request scope
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("selectedCategoryId", categoryId);
        List<Categories> listCategories = productDAO.getAllCategories();
request.setAttribute("listCategories", listCategories);


        // Chuyển tiếp đến admin.jsp để hiển thị sản phẩm theo danh mục
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
