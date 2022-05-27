package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Dbconn.Dbconn;

public class GroupDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public GroupDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
}
