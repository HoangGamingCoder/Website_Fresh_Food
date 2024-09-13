package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection con = null;
		try {
			DriverManager.registerDriver(new SQLServerDriver());
			String username = "sa";
			String password = "123456";
			String url = "jdbc:sqlserver://localhost:1433;DatabaseName=OGANI;"
					+ "encrypt=true;trustServerCertificate=true;";
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConnection(Connection con) {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
