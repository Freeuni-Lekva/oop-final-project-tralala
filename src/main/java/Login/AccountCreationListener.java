package Login;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AccountCreationListener implements ServletContextListener {

    public AccountCreationListener() {}
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        AccountManager myAccountManager = new AccountManager();
        ServletContext scontxt = sce.getServletContext();
        scontxt.setAttribute(AccountManager.ATTRIBUTE_NAME, myAccountManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {}
}
