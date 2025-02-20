<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.util.List" %>  
<%@ page import="models.Revenue" %>  
<%@ page import="models.Customer" %>  

<!DOCTYPE html>  
<html lang="en">  
<head>  
    <title>Revenue</title>  
    <link rel="stylesheet" type="text/css" href="revenue.css">  
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="css/home.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <style>
            * {
                box-sizing: border-box;
            }

            .row {
                margin-top: 10px;
                justify-content: center;
                text-align: center;

                margin-left:-5px;
                margin-right:-5px;
            }

            .column {
                float: left;
                width: 90%;
                padding: 5px;
                line-height: 24px;
                text-align: center;
                margin-bottom: 50px;

            }

            
            .row::after {
                content: "";
                clear: both;
                display: table;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 16px;
            }
            .row{
                display: flex;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            
  
.navbar_menu {
  background-color: white;
  display: flex;
  justify-content: center;
      
 
}


.navbar_menu a {
  display: block;
  color: black;
  text-align: center;
  padding: 15px ;
  font-size: 17px;
  
}

/* Change the color of links on hover */
.navbar_menu a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a green background color to the active link */
.navbar_menu a.active {
  background-color: #04AA6D;
  color: white;
}

/* Hide the link that should open and close the navbar on small screens */
.navbar_menu .icon {
  display: none;
}
</style>
</head>  
<body>  
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="navbar_menu" id="myNavbar"> 
                <a href="addproduct">Add Product</a>
                <a href="usermanage">User</a>
                <a href="orderManager">Order</a>
          
                <a href="monthlyRevenue" class="revenue-button">View Revenue</a>
            
            </div>
     <h2 style="text-align: center; margin-top: 30px">Revenue in year </h2>
    <canvas id="revenueChart" width="400" height="200"></canvas>  

    <script>  
        const labels = [];  
        const data = [];  

        <%   
            List<Revenue> revenueList = (List<Revenue>) request.getAttribute("revenueList");  
            for (Revenue revenue : revenueList) {   
        %>  
            labels.push("<%= revenue.getYear() %>-<%= revenue.getMonth() %>");  
            data.push(<%= revenue.getMonthlyRevenue() %>);  
        <% } %>  

        const ctx = document.getElementById('revenueChart').getContext('2d');  
        new Chart(ctx, {  
            type: 'bar',  
            data: {  
                labels: labels,  
                datasets: [{  
                    label: 'Doanh Thu Theo Tháng',  
                    data: data,  
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',  
                    borderColor: 'rgba(75, 192, 192, 1)',  
                    borderWidth: 1  
                }]  
            },  
            options: {  
                responsive: true,  
                plugins: {  
                    legend: {  
                        display: true,  
                        labels: {  
                            color: '#333',  
                            font: {  
                                size: 14  
                            }  
                        }  
                    },  
                },  
                scales: {  
                    x: {   
                        title: { display: true, text: 'Tháng', color: '#333' },  
                    },  
                    y: {   
                        title: { display: true, text: 'Doanh Thu ($)', color: '#333' },  
                        beginAtZero: true   
                    }  
                }  
            }  
        });  
    </script>  

    <h2 style="text-align: center; margin-top: 30px">Top Customer </h2>
    <div class="row">
            <div class="column">
    <table>  
        <thead>  
            <tr>  
                <th>Customer</th>  
                <th>Total Money</th>  
            </tr>  
        </thead>  
        <tbody>  
            <%  
                List<Customer> topCustomers = (List<Customer>) request.getAttribute("topCustomers");  
                for (Customer customer : topCustomers) {  
            %>  
                <tr>  
                    <td><%= customer.getAccId() %></td>  
                    <td><%= customer.getTotalSpent() %></td>  
                </tr>  
            <% } %>  
        </tbody>  
    </table>  
        </div>
         <jsp:include page="footer.jsp" ></jsp:include>
</body>  
</html>

