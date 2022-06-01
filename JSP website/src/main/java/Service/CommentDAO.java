package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.CommentVo;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public CommentDAO () {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// 댓글 입력 
	public int insertComment(int fbIdx, int cmIdx, String cmWriter, String cmComment) {
		int value = 0;
		
		String sql = "INSERT INTO BULLETINCOMMENT(FBIDX, CMIDX, CMWRITER, CMCOMMENT)"
				+ "values(?, cmidx_seq.nextval,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fbIdx);
			pstmt.setString(2, cmWriter);
			pstmt.setString(3, cmComment);
			
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return value;
	}
	
	public ArrayList<CommentVo> selectComment(int fbidx) {
		ArrayList<CommentVo> clist = new ArrayList<CommentVo>();
		ResultSet rs = null;
		
		String sql = "SELECT * FROM BULLETINCOMMENT WHERE FBIDX = ? ORDER BY CMIDX DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fbidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentVo cv = new CommentVo();
				cv.setFbidx(rs.getInt("fbidx"));
				cv.setCmidx(rs.getInt("cmidx"));
				cv.setCmwriter(rs.getString("cmwriter"));
				cv.setCmcomment(rs.getString("cmcomment"));
				clist.add(cv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return clist;
		
		
		
		
		
		
		
		
		
		
	}
}
