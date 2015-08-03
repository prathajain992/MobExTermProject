<%-- 
    Document   : AdminAccountSettings
    Author     : pratha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String adminEmail=(String)session.getAttribute("adminEmail");
    
    if(session.getAttribute("adminEmail")==null){
        response.sendRedirect("AdminLogin.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Account</title>
                <script type="text/javascript">
            function passwordRematch(){
                //Set the colors we will be using ...
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                var message = document.getElementById("confirmMessage");

                pass1 = document.getElementById("newpass1");
                pass2 = document.getElementById("newpass2");
                
                if( pass1.value === pass2.value ){
                    pass2.style.backgroundColor = goodColor;
                    message.style.color = goodColor;
                    message.innerHTML = "Passwords Match!";
                }
                else{
                    pass2.style.backgroundColor = badColor;
                    message.style.color = badColor;
                    message.innerHTML = "Passwords Do Not Match!";
                }
            }
            
            function checkForSubmission(){
                pass1 = document.adminChangePasswordForm.newAdminPassword.value;
                pass2 = document.userRegisterForm.adminRePassword.value;
                
                if( pass1 === pass2 ){
                    return true;
                }
                else{
                    document.getElementById("confirmMessage").innerHTML="Passwords Do Not Match!";
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <h1>Admin account settings</h1>
        <h3>Change Password</h3>
        <form action="adminPassChange" name="adminChangePasswordForm" method="post" onsubmit="return checkForSubmission()">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="adminEmail" value="<%=adminEmail%>" >
                    </td>
                </tr>
                <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="adminPassword" id="currentpass" required/></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="newAdminPassword" id="newpass1" required/></td>
                </tr>
                <tr>
                    <td>Re enter Password</td>
                    <td><input type="password" name="adminRePassword" id="newpass2"  onkeyup="passwordRematch(); return false;" required/></td>
                    <td><span id="confirmMessage" class="confirmMessage"></span></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Change Password"/>
                    </td>
            </table>
        </form>
    </body>
</html>
