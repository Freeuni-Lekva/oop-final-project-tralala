package Login;

import java.util.HashMap;

public class AccountManager {
    public static final String ATTRIBUTE_NAME = "Account Manager";
    private HashMap<String, String> data;

    public AccountManager() {
        data = new HashMap<String, String>();
    }

    public boolean accountExists(String userName) {
        return data.containsKey(userName);
    }

    public void createNewAccount(String userName, String password) {
        data.put(userName, password); }

    public boolean validateCredentials(String userName, String password) {
        return accountExists(userName) && data.get(userName).equals(password); }

}
