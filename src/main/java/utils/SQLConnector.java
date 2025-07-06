package utils;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class SQLConnector {
    private static final String URL =  "localhost:3306";
    private final static String USERNAME = "root";

    private final static String PASSWORD = "VashlisXe!123";

    public static BasicDataSource dataSource;

    public SQLConnector(){
        dataSource = new BasicDataSource();
        dataSource.setUrl(URL);
        dataSource.setUsername(USERNAME);
        dataSource.setPassword(PASSWORD);
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

}
