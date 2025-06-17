package Login;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

class AccountManagerTest {
    private static AccountManager am;

    @BeforeAll
    public static void setUp() {
        am = new AccountManager();
        am.createNewAccount("Federer", "roger123");
        am.createNewAccount("Nadal", "vamosRafa");
        am.createNewAccount("Djokovic", "no1tennisbutNotForMe");
    }

    @Test
    public void hasAccountTest() {
        assertTrue(am.accountExists("Federer"));
        assertTrue(am.accountExists("Nadal"));
        assertFalse(am.accountExists("Murray"));
    }

    @Test
    public void isCorrectPasswordTest() {
        assertTrue(am.validateCredentials("Djokovic", "no1tennisbutNotForMe"));
        am.createNewAccount("Alcaraz", "nextGen");
        assertTrue(am.validateCredentials("Alcaraz", "nextGen"));
        assertFalse(am.validateCredentials("Thiem", "winner"));
    }

    @Test
    public void createNewAccountTest() {
        am.createNewAccount("Sinner", "backhand");
        assertTrue(am.accountExists("Sinner"));
        assertTrue(am.validateCredentials("Sinner", "backhand"));
    }
}
