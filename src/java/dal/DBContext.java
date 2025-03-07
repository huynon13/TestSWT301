package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Shop_PRJ";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    //Em không kết nối được nên phải GPT dùng thêm file này//
   public static void main(String[] args) {
    DBContext d = new DBContext(); // Tạo đối tượng DBConnect để kết nối đến cơ sở dữ liệu
    Connection connection = d.connection; // Lấy đối tượng Connection từ DBConnect
    
    // Kiểm tra xem kết nối đã được thiết lập thành công hay không
    if (connection != null) {
        System.out.println("Kết nối cơ sở dữ liệu thành công.");
        
        // Thực hiện các thao tác trên cơ sở dữ liệu ở đây, ví dụ:
        // d.insert(new Admin("username", "password", 1)); // Gọi phương thức insert để chèn dữ liệu
        
        // Đóng kết nối sau khi hoàn thành công việc với cơ sở dữ liệu
    
    } else {
        System.out.println("Không thể kết nối đến cơ sở dữ liệu.");
    }
}

    
}