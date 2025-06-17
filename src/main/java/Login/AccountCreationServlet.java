package Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AccountCreationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create_new.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountManager MyAccountManager = (AccountManager) getServletContext().getAttribute(AccountManager.ATTRIBUTE_NAME);

        if (!MyAccountManager.accountExists(request.getParameter("username"))) {
            MyAccountManager.createNewAccount(request.getParameter("username"), request.getParameter("password"));
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("create_fail.jsp").forward(request, response);
        }
    }
}
