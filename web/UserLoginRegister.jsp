<%-- 
    Document   : UserLoginRegister
    Author     : pratha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login/Register</title>
     
        <script type="text/javascript">
            function passwordRematch(){
                //Set the colors we will be using ...
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                var message = document.getElementById("confirmMessage");

                pass1 = document.getElementById("pass1");
                pass2 = document.getElementById("pass2");
                
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
                pass1 = document.userRegisterForm.userPassword.value;
                pass2 = document.userRegisterForm.userRePassword.value;
                
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
        <h3>User Login</h3>
        <form action="userLogin" method="post" name="userLoginForm">
            <table>
                <tr>
                    <td>User Id/Email</td>
                    <td><input type="text" name="loginId" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="userPassword" required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="userLogin" value="Login"/>
                    </td>
                </tr>
            </table>
        </form>
        <h3>Register Here</h3>
        <form action="userRegister" name="userRegisterForm" method="post" onsubmit="return checkForSubmission()">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text" name="userName" required/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="userEmail" required/></td>
                    </tr>
                    <tr>
                        <td>User Id(your login Id)</td>
                        <td><input type="text" name="userId" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="userPassword" id="pass1" required/></td>
                    </tr>
                    <tr>
                        <td>Re enter Password</td>
                        <td><input type="password" name="userRePassword" id="pass2"  onkeyup="passwordRematch(); return false;" required/></td>
                        <td><span id="confirmMessage" class="confirmMessage"></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Register" name="userRegister"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
