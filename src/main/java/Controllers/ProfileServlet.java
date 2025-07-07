package Controllers;

import Controllers.managers.AccountManager;
import Models.Account;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountManager accountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);
        
     
        // Get the current user from session
        Account currentUser = (Account) request.getSession().getAttribute("loggedInAccount");
        
        if (currentUser == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Set the profile data in request scope
        request.setAttribute("profile", currentUser);
        request.setAttribute("isSelf", true); // Always true since user is viewing their own profile
        request.setAttribute("isAdmin", currentUser.isAdmin());
        
        // Set individual attributes for easier access in JSP
        request.setAttribute("firstName", currentUser.getFirstName());
        request.setAttribute("lastName", currentUser.getLastName());
        request.setAttribute("userName", currentUser.getUserName());
        request.setAttribute("email", currentUser.getEmail());
        request.setAttribute("imageUrl", currentUser.getImageUrl());
        
        // Forward to the profile view
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Profile.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountManager accountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);
        

        
        // Get the current user from session
        Account currentUser = (Account) request.getSession().getAttribute("loggedInAccount");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Update profile picture URL from form
        String imageUrl = request.getParameter("imageUrl");
        if (imageUrl != null && !imageUrl.isEmpty()) {
            currentUser.setImageUrl(imageUrl);
            accountManager.updateAccount(currentUser);
        }
        
        // Redirect back to profile page
        response.sendRedirect("profile");
    }
}
