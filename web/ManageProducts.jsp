<%-- 
    Document   : ManageProducts
    Author     : pratha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Products</title>
        <script>
            function confirmDelete(){
                var check = confirm("Do you want to delete this product?");
                
                if(check === true){
                    return true;
                }
                else{
                    return false;
                }
            }
            
        </script>
    </head>
    <body>
        <h1>Manage Products</h1>
        
        <h3>Add Product:</h3>
        <a href="AddProducts1.jsp">Add</a>
        
        
        <!--<h3>Delete Product </h3>
        <form action="deletephone" method="post">
            <table>
                <tr>
                    <td>Phone Id</td>
                    <td><input type="text" name="phoneId" size="20"/></td>
                </tr>
                <tr>
                    <td>Phone Name</td>    
                    <td><input type="text" name="phoneName" size="20" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="delete" value="Delete"/>
                    </td>
                </tr>
            </table>
        </form>-->
        
        
        
        
        
        
        
        
        
        <h3>View Product</h3><!--Provide the whole product table in a dynamic way-->
        
        
        <table border="1" width="95%" align="center">
            
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Company</th>
                <th>Phone ID</th>
                <th>Qty</th>
                <th>Category</th>
                <th>Summary</th>
                <th>Tags</th>
                <th>Screen Size</th>
                <th>ROM</th>
                <th>RAM</th>
                <th>Processor</th>
                <th>Primary Camera</th>
                <th>Secondary Camera</th>
                <th>Operating System</th>
                <th>Price</th>
            </tr>
            
            <%  Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
            PreparedStatement st = con.prepareStatement("select * from phone");

            ResultSet rs = st.executeQuery();
            while(rs.next()){

                String phoneId = rs.getString("phone_id");
                String phoneName = rs.getString("phone_name");
                String phoneCategory = rs.getString("phone_category");
                int phoneQty = rs.getInt("phone_qty");
                String phoneCompany = rs.getString("phone_Company");
                String screenSize = rs.getString("screen_size");
                String processor = rs.getString("phone_processor");
                String rom = rs.getString("phone_ROM");
                String ram = rs.getString("phone_RAM");
                String priCam = rs.getString("pri_cam");
                String secCam = rs.getString("sec_cam");
                String summary = rs.getString("phone_summary");
                double price = rs.getDouble("phone_price");
                String os = rs.getString("phone_os");
                String tags = rs.getString("phone_tags");
    
            %>
            <tr>
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="115" border="0"/></td>
                <td><%=phoneName%></td>
                <td><%=phoneCompany%></td>
                <td><%=phoneId%></td>
                <td><%=phoneQty%></td>
                <td><%=phoneCategory%></td>
                <td><%=summary%></td>
                <td><%=tags%></td>
                <td><%=screenSize%></td>
                <td><%=rom%></td>
                <td><%=ram%></td>
                <td><%=processor%></td>
                <td><%=priCam%></td>
                <td><%=secCam%></td>
                <td><%=os%></td>
                <td><%=price%></td>
                <td>
                    <form name="phonedeleteform" action="deletephone" method="post" onsubmit="return confirmDelete()">
                        <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                        <input type="hidden" name="phoneName" value="<%=phoneName%>"/>
                        <input type="submit" name="delete" value="Delete"/>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            
        </table>
        
        

        <h3>Update Product Details</h3>
        Try to make an interactive Phone page to update changes.
<!--        <form action="phonedetailsupdate" name="phonedetailsupdateForm" method="post">
            <table>
                <tr>
                    <td>
                       Phone Id 
                    </td>
                    <td>
                        <input type="text" name="phoneId"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Column
                    </td>
                    <td>
                        <select name="phonecolumn" onselect="column()" required >
                            <option value="default">Select</option>
                            <option value="phoneId">Phone Id</option>
                            <option value="phoneName">Name</option>
                            <option value="phoneCompany">Company</option>
                            <option value="phoneCategory">Category</option>
                            <option value="phoneQty">Quantity</option>
                            <option value="phoneSummary"></option>
                            <option value="phoneTags"></option>
                            <option value="screenSize"></option>
                            <option value="processor"></option>
                            <option value="rom"></option>
                            <option value="ram"></option>
                            <option value="priCam"></option>
                            <option value="secCam"></option>
                            <option value="os"></option>
                            <option value="price"></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    
                </tr>
                <td id="selectedColumn"></td>
                <script>
                    function column(){
                        if(document.phonedetailsupdateForm.phonecolumn.value=="phoneQty"){
                            document.getElementById('selectedColumn').innerHTML="<input type=\"number\" name=\"phoneQty\"/>";
                            return;
                        }

                        if(document.empLoginForm.password.value==""){
                            document.getElementById('pwderror').innerHTML="Password is required";
                            return false;
                        }
                    }
                </script>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Update"/>
                    </td>
                </tr>
            </table>
        </form>-->
        
        <h3>Update Product Image</h3>
        <form action="uploadPhoneImage" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                       Phone Id 
                    </td>
                    <td>
                        <input type="text" name="phoneId"/>
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" accept="image/*" name="phoneImage" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="imageupdate" value="Update"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
