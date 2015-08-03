<%-- 
    Document   : AdminHome
    Author     : pratha 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if(session.getAttribute("adminEmail")==null){
        response.sendRedirect("AdminLogin.jsp");
    }
    
    String sessionID = (String)session.getAttribute("sessionId");//this sessionId will only work if there is an actual login
    //session.getId(); this will give you session if this page is loaded wether or not login is done
    
    String email = (String)session.getAttribute("adminEmail");

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body>
        <div align="right" ><a href="Logout.jsp">Logout</a></div>
        <h1>Welcome Administrator!</h1>
        
        <table>
            <tr>
                <td><a href="ManageProducts.jsp">Manage Products</a></td>
            </tr>
            <tr>
                <td><a href="ManageOrders.jsp">Manage Orders</a></td>
            </tr>
            <tr>
                <td><a href="AdminAccountSettings.jsp">Account Settings</a></td>
            </tr>
            <tr>
                <td><a href="index.jsp">Go Shopping!</a></td>
            </tr>
        </table>
    </body>
</html>
