<%-- 
    Document   : AddProducts2
    Author     : pratha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String phoneId = (String)session.getAttribute("phoneId");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Products 2</title>
    </head>
    <body>
        <h3>Details added to the database. Add Photo for the phone</h3>
        
        
        <form action="uploadPhoneImage" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Phone ID </td>
                    <td><%=phoneId%><input type="hidden" name="phoneId" value="<%=phoneId%>" /></td>
                </tr>
                <tr>
                    <td>Phone Image</td>
                    <td><input type="file" accept="image/*" name="phoneImage" size="25"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="uploadImage" value="Upload"/>
                    </td>
                </tr>
                
            </table>
        </form>
                
                
    </body>
</html>
