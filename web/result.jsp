<%-- 
    Document   : result
    Author     : pratha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="phonestore.other.DB_Conn" id="dbconn" scope="session"/>
<%
    String category = request.getParameter("phoneCategory");
    String searchKeyword = request.getParameter("searchKeyword");
    
    if(category==null && searchKeyword==null){
        response.sendRedirect("index.jsp");
    }
    
    
    Connection con = dbconn.getConnection();
    if(category == "default"){}
    
    if(category == "ancient" || category == "multimedia" || category == "smartphone" || category == "tablet" || category == "smartwatch"){
        PreparedStatement st1 = con.prepareStatement("SELECT * FROM phone WHERE phone_category=?");
        st1.setString(1, category);
        
        ResultSet rs1 = st1.executeQuery(); //do further coding for category search
    }
    
    
    PreparedStatement st = con.prepareStatement("SELECT * FROM phone WHERE phone_name LIKE ? OR phone_tags LIKE ?");
    st.setString(1, "%"+searchKeyword+"%");
    st.setString(2, "%"+searchKeyword+"%");
     
            
    ResultSet rs = st.executeQuery();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
    </head>
    <body>
        <%@include file="searchheader.jsp" %>
        <%@include file="filter.jsp" %>
        
        <%
            while(rs.next()){
                String phoneId = rs.getString("phone_id");
                String phoneName = rs.getString("phone_name");
                double phonePrice = rs.getDouble("phone_price");
                String phoneSummary = rs.getString("phone_summary");
                int phoneQty = rs.getInt("phone_qty");

        %>
        
        <div align="center">
        <table border="1">
            <tr>
                <td rowspan="3">
                    <a href="PhonePage.jsp?phoneId=<%=phoneId%>">
                    <img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="115" border="0"/>
                    </a>
                </td>
                <td colspan="2"><%=phoneName%></td>
            </tr>
            <tr>
                <td><%=phonePrice%></td>
                <td>
                    <%
                    if(phoneQty>0){
                    %>
                    <a href="AddToCart.jsp?phoneId=<%=phoneId%>">Add to cart</a>
                    <%}
                    else{%>
                    
                    Sold Out
                    <%}%>
                </td>
            </tr>
            <tr>
                <td colspan="2"><%=phoneSummary%></td>
            </tr>
        </table>
        </div>
            <br>
        <%
        }
        %>
        
    </body>
</html>
