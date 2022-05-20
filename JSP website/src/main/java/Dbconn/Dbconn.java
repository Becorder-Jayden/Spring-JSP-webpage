package Dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	
	String url = "jdbc:oracle:thin:@DESKTOP-JD3TF5S:1521:xe";
	String user = "system";
	String password = "1234";


	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
	