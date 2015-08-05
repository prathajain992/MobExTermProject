<%-- 
    Document   : searchheader
    Author     : pratha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Header</title>
    </head>
    <body>
    <center>
        <form action="result.jsp" method="post" id="searchform">
        <table>
            <tr>
                <td>
                    <select name="phoneCategory" form="searchform">
                        <option value="default">Category</option>
                        <option value="ancient">Ancient Phones</option>
                        <option value="multimedia">Multi Media</option>
                        <option value="smartphone">Smart Phones</option>
                        <option value="tablet">Tabs</option>
                        <option value="smartwatch">Smart Watches</option>
                    </select>
                </td>
             
                <td>
                    <input type="search" name="searchKeyword" size="100"/>
                </td>
                <td>
                    <input type="submit" name="search" value="Go"/>
                </td>
            </form>
                <td>
                    <select name="resultSort">
                        <option value="default">Sort By</option>
                        <option value="asc">A - Z</option>
                        <option value="desc">Z - A</option>
                        <option value="LtoH">Low to High</option>
                        <option value="HtoL">High to Low</option>
                    </select>
                </td>
            </tr>
        </table>
        
    </center>
    </body>
</html>
