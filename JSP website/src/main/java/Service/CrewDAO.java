package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import Dbconn.Dbconn;

public class CrewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public CrewDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	public int makeCrew(int midx, String cName, String cGoal, String cPersonnel, Date dateStart, Date dateEnd) {
		int value = 0;
		
		String sql = "insert into crew(midx,cName,cGoal,cPersonnel,cDateStart,cDateEnd)"
				+ "values(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setString(2, cName);
			pstmt.setString(3, cGoal);
			pstmt.setString(4, cPersonnel);
			pstmt.setString(5, (java.sql.Date) dateStart);
			pstmt.setString(6, (java.sql.Date) dateEnd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return value;
	}
}
