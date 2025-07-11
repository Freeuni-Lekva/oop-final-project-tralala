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

/**
 * ProfileServlet handles profile-related operations including:
 * - Displaying the user's profile page
 * - Updating profile information (specifically profile picture URL)
 *
 * This servlet requires users to be logged in to access any functionality.
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests to display the user's profile page.
     * Retrieves the logged-in user's information and displays their profile.
     * Redirects to login page if user is not authenticated.
     *
     * @param request HttpServletRequest containing the user's request
     * @param response HttpServletResponse for sending the profile page
     * @throws ServletException if servlet-specific error occurs
     * @throws IOException if I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the account manager from servlet context
        AccountManager accountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);

        // Get the currently logged-in user from session
        Account loggedInUser = (Account) request.getSession().getAttribute("loggedInAccount");

        // Check if user is authenticated
        if (loggedInUser == null) {
            // User is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Set the profile data in request scope for JSP access
        request.setAttribute("profile", loggedInUser);

        // Set flag indicating user is viewing their own profile
        request.setAttribute("isSelf", true); // Always true since user is viewing their own profile

        // Set admin status for conditional display in JSP
        request.setAttribute("isAdmin", loggedInUser.isAdmin());

        // Set individual user attributes for easier access in JSP
        request.setAttribute("firstName", loggedInUser.getFirstName());
        request.setAttribute("lastName", loggedInUser.getLastName());
        request.setAttribute("userName", loggedInUser.getUserName());
        request.setAttribute("email", loggedInUser.getEmail());
        request.setAttribute("imageUrl", loggedInUser.getImageUrl());

        // Forward to the profile view JSP
        RequestDispatcher profileDispatcher = request.getRequestDispatcher("Profile.jsp");
        profileDispatcher.forward(request, response);
    }

    /**
     * Handles POST requests for updating profile information.
     * Currently supports updating the profile picture URL.
     * Requires user authentication.
     *
     * @param request HttpServletRequest containing form data
     * @param response HttpServletResponse for sending responses
     * @throws ServletException if servlet-specific error occurs
     * @throws IOException if I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the account manager from servlet context
        AccountManager accountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);

        // Get the currently logged-in user from session
        Account loggedInUser = (Account) request.getSession().getAttribute("loggedInAccount");

        // Check if user is authenticated
        if (loggedInUser == null) {
            // User is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Get the new profile picture URL from form submission
        String newImageUrl = request.getParameter("imageUrl");

        // Update profile picture if a new URL is provided
        if (newImageUrl != null && !newImageUrl.isEmpty()) {
            // Set the new image URL on the user account
            loggedInUser.setImageUrl(newImageUrl);

            // Persist the updated account information to the database
            accountManager.updateAccount(loggedInUser);
        }

        // Redirect back to profile page to show updated information
        response.sendRedirect("profile");
    }
}