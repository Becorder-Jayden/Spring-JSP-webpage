package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetInternalMethods;

import Dbconn.Dbconn;
import Domain.FaqVo;

public class FaqDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	public FaqDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// faq 게시판 글 등록
	public int insertFaq(String qquestion, String qanswer) {
		int value = 0;
		
		String sql = "INSERT INTO faq(qquestion, qanswer)"
				+ "VALUES(?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qquestion);
			pstmt.setString(2, qanswer);
			value = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return value;
	}

	public ArrayList<FaqVo> faqSelectAll() {
		ArrayList<FaqVo> flist = new ArrayList<FaqVo>();
		ResultSet rs = null;
		
		String sql = "select * from faq order by qbidx desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				FaqVo fv = new FaqVo();
				fv.setQbidx(rs.getInt("qbidx"));
				fv.setQquestion(rs.getString("qquestion"));
				fv.setQanswer(rs.getString("qanswer"));
				flist.add(fv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return flist;
	}
	
}
