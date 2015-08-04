<%-- 
    Document   : AddProducts1
    Author     : pratha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Products1</title>
    </head>
    <body>
        <h3>STEP 1</h3>
        <form name="addproducts1form" action="uploadphonedetails" method="post">
            <table>
                <tr>
                    <td>Phone ID</td>
                    <td><input type="text" name="phoneId" required/></td>
                </tr>
                <tr>
                    <td>Phone Company</td>
                    <td><input type="text" name="phoneCompany" required/></td>
                </tr>
                <tr>
                    <td>Phone Name</td>
                    <td><input type="text" name="phoneName" required/></td>
                </tr>
                <tr>
                    <td>Phone Category</td>
                    <td>
                    <select name="phoneCategory" required>
                        <option value="default">Category</option>
                        <option value="ancient">Ancient Phones</option>
                        <option value="multimedia">Multi Media</option>
                        <option value="smartphone">Smart Phones</option>
                        <option value="tablet">Tabs</option>
                        <option value="smartwatch">Smart Watches</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Quantity(integer)</td>
                    <td><input type="number" name="phoneQty" required/></td>
                </tr>
                 
                <tr>
                    <td>Phone Summary</td>
                    <td><textarea name="phoneSummary" style="resize:none" rows="5" cols="25"></textarea></td>
                </tr>
                <tr>
                    <td>Phone Tags</td>
                    <td><input type="text" name="phoneTags"/></td>
                </tr>
                
                
                <tr>
                    <td>Screen Size</td>
                    <td><input type="text" name="screenSize"/></td>
                </tr>
                <tr>
                    <td>Processor</td>
                    <td><input type="text" name="processor"/></td>
                </tr>
                <tr>
                    <td>ROM</td>
                    <td><input type="text" name="rom"/></td>
                </tr>
                <tr>
                    <td>RAM</td>
                    <td><input type="text" name="ram"/></td>
                </tr>
                <tr>
                    <td>Primary Camera</td>
                    <td><input type="text" name="priCamera"/></td>
                </tr>
                <tr>
                    <td>Secondary Camera</td>
                    <td><input type="text" name="secCamera"/></td>
                </tr>
                <tr>
                    <td>Operating System</td>
                    <td><input type="text" name="os"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" required/></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Next"/>
                    </td>
                </tr>
            </table>
        </form>
        
    </body>
</html>
