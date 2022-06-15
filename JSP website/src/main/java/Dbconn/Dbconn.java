package Dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

// DB Connection에서는 DB 접속 정보를 가져온다
public class Dbconn {
	
	
	String url = "jdbc:mysql://127.0.0.1:3306/mysql?serverTimezone=UTC&characterEncoding=UTF-8";
	// String url = "jdbc:oracle:thin:@DESKTOP-JD3TF5S:1521:xe";
	String user = "root";
	// String user = "system";
	String password = "1234";

	
	public Connection getConnection() {
		Connection conn = null;
		try {
			// jdbc 패키지에 있는 클래스를 가져옴
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// 접속 정보를 활용해서 연결 객체를 만듬
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
	