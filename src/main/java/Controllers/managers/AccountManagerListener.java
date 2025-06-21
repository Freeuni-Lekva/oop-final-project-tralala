package Controllers.managers;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AccountManagerListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        AccountManager accountManager = new AccountManager();
        sce.getServletContext().setAttribute(AccountManager.ATTRIBUTE_NAME, accountManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
}
