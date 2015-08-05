<%-- 
    Document   : Reciept
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
    st.setString(2, "YES");
    
    //get userdetails for the bill
    String name=null;
    String address=null;
    String contactNum=null;
    
    PreparedStatement st2 = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
    st2.setString(1, loginId);
    
    PreparedStatement st3 = con.prepareStatement("SELECT user_id FROM userlogin WHERE user_email=?");
    st3.setString(1, loginId);
    
    ResultSet rs2=st2.executeQuery();
    if(rs2.next()){
        name=rs2.getString("user_name");
        address = rs2.getString("user_address");
        contactNum = rs2.getString("user_mob_num");
    }
    else{
        ResultSet rs3 = st3.executeQuery();
        if(rs3.next()){
            String userId = rs3.getString("user_id");
            st2.setString(1, userId);
            ResultSet rs4 = st2.executeQuery();
            
            if(rs4.next()){
                name=rs2.getString("user_name");
                address = rs2.getString("user_address");
                contactNum = rs2.getString("user_mob_num");
            }
        }
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Store Order Receipt</title>
    </head>
    <body>
        <h1>Order Successful, Here is your order receipt!</h1>
        <table>
            <tr>
                <td><%=name%></td>
                
            </tr>
            <tr>
                <td><%=contactNum%></td>
               
            </tr>
            <tr>
                 <td><%=address%></td>
            </tr>
        </table>
        
        <table border="1" align="center" width="90%">
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
                
                
                PreparedStatement st1 = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
                st1.setString(1, phoneId);
                ResultSet rs1 = st1.executeQuery();
                while(rs1.next()){
                    phoneName = rs1.getString("phone_name");
                    phonePrice = rs1.getDouble("phone_price");
                    
                    productPrice = phoneCartQty*phonePrice;
                    
                    totalPrice += productPrice;
            %>
            <tr align="center">
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="50" border="0"/></td>
                <td><%=phoneName%></td>
                <td>$ <%=phonePrice%></td>
                <td><%=phoneCartQty%></td>
                <td>$ <%=productPrice%></td>
            </tr>
            <%
                }
            }
            
            %>
            <tr>
                <td colspan="5" align="right">$ <%=totalPrice%></td>
            </tr>
        </table>
            
            <div align="center"><input type="submit" value="print" onClick="window.print()" /></div>
    </body>
</html>
