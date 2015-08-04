<%-- 
    Document   : index
    Author     : pratha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  boolean check = false;
    String loginId =null;
    String adminEmail =null;
    
    String phoneId="";
    String phoneName="";
    Double phonePrice=0.0;
    String phoneSummary="";
    int phoneQty=0;
    
    
    
    
    if(session.getAttribute("loginId")!= null || session.getAttribute("adminEmail") != null){
        check = true;
        loginId = (String)session.getAttribute("loginId");
        adminEmail = (String)session.getAttribute("adminEmail");
    }
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
    </head>
    <body>
        <%
    
        if(check){
            if(loginId != null){
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
            if(adminEmail != null){
            %>
            <div align="right">Welcome, <%=adminEmail%></div>
            <div align="right"><a href="AdminHome.jsp">Admin Home</a></div>
            <div align="right"><a href="Logout.jsp">Logout</a></div>
            
            <%
            }
        }
        else{
            %>
            <div align="right"><a href="UserLoginRegister.jsp">Login/Register</a></div>
            <div align="right"><a href="AdminLogin.jsp">Administrator Login</a></div>
            <%
        }
        %>

        <%@include file="searchheader.jsp" %>
        <%@include file="filter.jsp" %>
     
        
        
        
        
    <center>
        
        
        <%
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
    
        PreparedStatement st = con.prepareStatement("SELECT * FROM phone");

        ResultSet rs = st.executeQuery();

        while(rs.next()){
            phoneId = rs.getString("phone_id");
            phoneName = rs.getString("phone_name");
            phonePrice = rs.getDouble("phone_price");
            phoneSummary = rs.getString("phone_summary");
            phoneQty = rs.getInt("phone_qty");

        %>
        
        
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
        
            <br>
        <%
        }
        %>
        
        
        
        
    </center>
    </body>
</html>




















<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<!-- Shell -->
<div class="shell">
<div align="right">Logout</div>
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">shoparound</a></h1>
    
    <!-- Cart -->
    <div id="cart">
     <a href="#" class="cart-link">Your Shopping Cart</a>
      <div class="cl">&nbsp;</div>
      <span>Articles: <strong>4</strong></span> &nbsp;&nbsp; <span>Cost: <strong>$250.99</strong></span> </div>
    <!-- End Cart -->
    
    
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="#" class="active">Home</a></li>
        <li><a href="#">Support</a></li>
        <li><a href="#">My Account</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
     
     
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
      
      
      
      <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
        
        
        
          <li> <a href="#"><img src="css/images/big1.jpg" alt="" /></a>
            <div class="product-info">
              <h3>LOREM IPSUM</h3>
              <div class="product-desc">
                <h4>WOMEN’S</h4>
                <p>Lorem ipsum dolor sit<br />
                  amet</p>
                <strong class="price">$58.99</strong> </div>
            </div>
          </li>
          
          
          
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
    <!-- Sidebar -->
    <div id="sidebar">
      
      
      
      
      
      
      
      
      
      <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
          <form action="#" method="post">
            <label>Keyword</label>
            <input type="text" class="field" />
            <label>Category</label>
            <select class="field">
              <option value="">-- Select Category --</option>
            </select>
            <div class="inline-field">
              <label>Price</label>
              <select class="field small-field">
                <option value="">$10</option>
              </select>
              <label>to:</label>
              <select class="field small-field">
                <option value="">$50</option>
              </select>
            </div>
            <input type="submit" class="search-submit" value="Search" />
            <p> 
              <a href="#" class="bul">Contact Customer Support</a> </p>
          </form>
        </div>
      </div>
      <!-- End Search -->
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
            
      
      
      
    </div>
    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <!-- Side Full -->
  <div class="side-full">
    
    
    
    
    <!-- More Products -->
    <div class="more-products">
      <div class="more-products-holder">
        <ul>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          
        </ul>
      </div>
      <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
    </div>
    <!-- End More Products -->
    
    
    
    
    
    
   
   
    
    
    
    
  </div>
  <!-- End Side Full -->
  
  
  
  
  <!-- Footer -->
  <div id="footer">
    <p class="left">
     	<a href="#">Home</a> 
    <span>|</span> 
    	<a href="#">Support</a> 
    <span>|</span> 
    	<a href="#">My Account</a> 
    <span>|</span> 
    	<a href="#">The Store</a> 
    <span>|</span> 
    	<a href="#">Contact</a> 
    </p>
    
    <p class="right"> Copyright @ pratha 2015</p>
  </div>
  <!-- End Footer -->



</div>
<!-- End Shell -->
<div align=center>&nbsp;</div></body>
</html>
