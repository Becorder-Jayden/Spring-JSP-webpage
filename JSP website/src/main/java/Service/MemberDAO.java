package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Dbconn.Dbconn;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	public MemberDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
}
