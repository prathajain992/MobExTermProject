<%-- 
    Document   : UserCart
    Author     : pratha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbconn" class="phonestore.other.DB_Conn" scope="session"/>

<%
    String loginId="";
    
    String phoneId="";
    int phoneCartQty=0;
    int cartId=0;
    
    String phoneName="";
    double phonePrice=0.0;
    
    double productPrice=0.0;
    double totalPrice=0.0;
    
    if(session.getAttribute("loginId")!= null){
        loginId = (String)session.getAttribute("loginId");
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
    Connection con = dbconn.getConnection();
    PreparedStatement st = con.prepareStatement("SELECT * FROM cart_items WHERE login_id=? AND purchased=?");
    st.setString(1, loginId);
    st.setString(2, "NO");
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
    </head>
    <body>
        <a href="index.jsp">Go shopping</a> <!--add this to logo anchor-->
        <h1>Hello <%=loginId%>!</h1>
        
        <h3>Your cart</h3>
        <table border="1">
            <tr>
                <th colspan="2">
                    Product
                </th>
                <th>
                    Unit Price
                </th>
                <th>
                    Quantity
                </th>
                <th>
                    Total
                </th>
            </tr>
            <%
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                phoneId = rs.getString("phone_id");
                phoneCartQty = rs.getInt("phone_qty");
                cartId = rs.getInt("cart_items_id");
                
                PreparedStatement st1 = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
                st1.setString(1, phoneId);
                ResultSet rs1 = st1.executeQuery();
                while(rs1.next()){
                    phoneName = rs1.getString("phone_name");
                    phonePrice = rs1.getDouble("phone_price");
                    
                    productPrice = phoneCartQty*phonePrice;
                    
                    totalPrice += productPrice;
            %>
            <tr>
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="20" border="0"/></td>
                <td><%=phoneName%></td>
                <td>$ <%=phonePrice%></td>
                <td><%=phoneCartQty%></td>
                <td>$ <%=productPrice%></td>
                <td>
                    <form name="deletecartitem" method="post" action="deleteitem">
                        <input type="hidden" value="<%=cartId%>" name="cartId"/>
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <%
                }
            }
            
            %>
            <tr>
                <td colspan="5" align="right">$ <%=totalPrice%></td>
            </tr>
        </table>
        
            <div>
                <a href="Checkout.jsp">Checkout</a>
            </div>
    </body>
</html>
