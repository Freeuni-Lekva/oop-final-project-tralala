package Controllers.managers;

import Models.Account;
import Models.passwordHasher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

public class AccountCreationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AccountCreationServlet doPost called");
        AccountManager accountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);
        if (accountManager == null) {
            System.out.println("AccountManager not found in context");
            request.setAttribute("error", "Internal server error");
            request.getRequestDispatcher("create_fail.jsp").forward(request, response);
            return;
        }
        System.out.println("AccountManager found");
        
        if (!accountManager.accountExists(request.getParameter("username"))) {
            try {
                // Generate salt for password hashing
                String salt = passwordHasher.generateSalt();
                String hashedPassword = passwordHasher.hash(request.getParameter("password"), salt);
                
                // Create account with all required parameters
                Account account = new Account(
                    request.getParameter("username"),
                    request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    hashedPassword,
                    request.getParameter("email"),
                    "", // Default empty image URL
                    salt
                );
                
                account.setAdmin(false);
                accountManager.createNewUser(account);
                request.setAttribute("username", request.getParameter("username"));
                request.getRequestDispatcher("welcome.jsp").forward(request, response);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error creating account");
                request.getRequestDispatcher("create_fail.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("create_fail.jsp").forward(request, response);
        }
    }
}
