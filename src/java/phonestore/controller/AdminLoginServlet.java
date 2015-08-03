package phonestore.controller;

import phonestore.model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pratha
 */
public class AdminLoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adminEmail = req.getParameter("adminEmail");
        String adminPassword = req.getParameter("adminPassword");
        String value = req.getParameter("rememberMe");
        
        boolean rememberMe = false;
        
        HttpSession session = req.getSession();
        String sessionID = session.getId();
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        Admin admin = new Admin(adminEmail, adminPassword);
        boolean check = admin.checkAdminLogin();
        
        if(check){
            session.setAttribute("adminEmail", adminEmail);
            session.setAttribute("sessionId", sessionID);
            
            
            if(value != null && value.equalsIgnoreCase("on")){
                rememberMe = true;
            }
            if (rememberMe) {           //If your checkbox value is true
                Cookie cookieAdminEmail = new Cookie("cookieEmail", adminEmail);
                Cookie cookieAdminPassword = new Cookie("cookiePassword", adminPassword);
                // Make the cookie one year last
                cookieAdminEmail.setMaxAge(60 * 60 * 24 * 365);
                cookieAdminPassword.setMaxAge(60 * 60 * 24 * 365);
                resp.addCookie(cookieAdminEmail);
                resp.addCookie(cookieAdminPassword);
            }
            
            resp.sendRedirect("AdminHome.jsp");
            
        }
        else{
            out.println("<h1 align="+"center"+">GET LOST</h1>");
        }
    }
    
}
