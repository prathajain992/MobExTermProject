<%-- 
    Document   : PhonePage
    Author     : pratha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String phoneId=null;
    if(request.getParameter("phoneId")!= null)
        phoneId = request.getParameter("phoneId");
    else
        response.sendRedirect("index.jsp");
    
    String phoneCompany=null;
    String phoneName=null;
    String phoneCategory=null;
    int phoneQty=0;
    String phoneSummary=null;
    String phoneTags=null;
    String screenSize=null;
    String processor=null;
    String rom=null;
    String ram=null;
    String priCamera=null;
    String secCamera=null;
    String os=null;
    double price=0.00;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
    
    PreparedStatement st = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
    st.setString(1, phoneId);
    ResultSet rs = st.executeQuery();
    if(rs.next()){
        phoneCompany = rs.getString("phone_company");
        phoneName = rs.getString("phone_name");
        phoneCategory = rs.getString("phone_category");
        phoneQty = rs.getInt("phone_qty");
        phoneSummary = rs.getString("phone_summary");
        phoneTags = rs.getString("phone_tags");
        screenSize = rs.getString("screen_size");
        processor = rs.getString("phone_processor");
        rom = rs.getString("phone_ROM");
        ram = rs.getString("phone_RAM");
        priCamera = rs.getString("pri_cam");
        secCamera = rs.getString("sec_cam");
        os = rs.getString("phone_os");
        price = rs.getDouble("phone_price");
    }
    
    String loginId=null;
    boolean check = false;
    if(session.getAttribute("loginId")!=null){
        loginId = (String)session.getAttribute("loginId");
        check = true;
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Page</title>
    </head>
    <body>
        <%@include file="searchheader.jsp" %>
        <div align="right">
            <%
                if(!check){
            %>
            <a href="UserLoginRegister.jsp">Login/Register</a>
            <%
                }
                else{
            %>
            <div align="right">
                Welcome, <%=loginId%>
                <img src="getuserimage.jsp?userId=<%=loginId%>" width="50" border="0"/>
            </div>
            <div align="right"><a href="UserCart.jsp">Your Cart</a></div>
            <div align="right"><a href="UserAccountSettings.jsp">Account Settings</a></div>
            <div align="right"><a href="Logout.jsp">Logout</a></div>
            <%
                }
            %>
        </div>
        <h1>Phone Page</h1>
        <div>
            <img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="115" border="0"/>
        </div>
        <div>
            Company: <%=phoneCompany%>
        </div>
        <div>
            Name: <%=phoneName%>
        </div>
        <div>
            Price: <%=price%>
        </div>
        <div>
            <%
                if(phoneQty>0){
            %>
             Available in Stock<br>
             <%
                if(loginId != null){
             %>
             <form action="addtocart" method="post" name="addtocartform">
                <input type="hidden" name="loginId" value="<%=loginId%>"/>
                <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                <input type="number" name="phoneQty" min="1" max="10" value="1"/>
                <input type="submit" name="addtocart" value="Add to Cart"/>
             </form>
             <%
                }
             %>
             
            <%
                }
                else{
            %>
            Sold Out. Not Available
            <%
                
                }
            %>
        </div>
        <div>
            Summary: <%=phoneSummary%>
        </div>
        <div>
            Specifications:
            <table>
                <tr>
                    <td>Name</td>
                    <td><%=phoneName%></td>
                </tr>
                <tr>
                    <td>Screen</td>
                    <td><%=screenSize%></td>
                </tr>
                <tr>
                    <td>RAM</td>
                    <td><%=ram%></td>
                </tr>
                <tr>
                    <td>ROM</td>
                    <td><%=rom%></td>
                </tr>
                <tr>
                    <td>Processor</td>
                    <td><%=processor%></td>
                </tr>
                <tr>
                    <td>Primary Camera</td>
                    <td><%=priCamera%></td>
                </tr>
                <tr>
                    <td>Secondary Camera</td>
                    <td><%=secCamera%></td>
                </tr>
                <tr>
                    <td>OS</td>
                    <td><%=os%></td>
                </tr>
            </table>
        </div>
        
        <div>
            <%
            if(loginId != null){
            %>
            <form name="addreviewForm" action="review" method="post">
                <input type="hidden" name="loginId" value="<%=loginId%>"/>
                <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                <textarea name="review" style="resize:none" rows="5" cols="40"></textarea>
                <input type="submit" value="Add Review"/>
            </form>
            <%
            }
            %>
        </div>
        <div>
            <%
            String username=null;
            String review=null;
            
            String userId=null;
            
            
            PreparedStatement stRev = con.prepareStatement("SELECT * FROM review WHERE phone_id=?");
            stRev.setString(1, phoneId);
            ResultSet rsRev = stRev.executeQuery();
            while(rsRev.next()){
                //get login id from review table and fetch corresponding user data: name
                userId = rsRev.getString("login_id");
                review = rsRev.getString("review");
                
                PreparedStatement stUser = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
                stUser.setString(1, userId);
                ResultSet rsUser = stUser.executeQuery();
                if(rsUser == null){
                    PreparedStatement stUser1 = con.prepareStatement("SELECT * FROM userlogin WHERE user_email=?");
                    stUser1.setString(1,userId);
                    ResultSet rsUser1 = stUser1.executeQuery();
                    while(rsUser1.next()){
                        userId = rsUser1.getString("user_id");
                        PreparedStatement stUser2 = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
                        stUser2.setString(1, userId);
                        ResultSet rsUser2 = stUser2.executeQuery();
                        while(rsUser2.next()){
                            username = rsUser2.getString("user_name");
            %>
                    show review:<%=review%> ;with username:<%=username%>
            <%
                        }
                    }
                }
                else{
                    while(rsUser.next()){
                        username = rsUser.getString("user_name");
            %>
                    show review:<%=review%> ;with username:<%=username%>
            <%
                    }
                }
            
            }
            %>
        </div>
    </body>
</html>
