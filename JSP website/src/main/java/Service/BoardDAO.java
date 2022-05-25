package Service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.BoardVo;

// DB 접근을 위한 메소드들로만 구성
public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public BoardDAO() {
		Dbconn db = new Dbconn();			// db 접속정보 전달
		this.conn = db.getConnection();		// db 연결
		
	}
	
	// 자유게시판 글쓰기 
	public int insertBoard(int mIdx, String fbCategory, String fbTitle, String fbContent, String fbWriter) {
		System.out.println("insertBoard 실행");
		int value = 0;
		
		
		String sql = "INSERT INTO BULLETINBOARD(FBIDX,MIDX,FBCATEGORY,FBTITLE,FBCONTENT,FBWRITER)"
				+ "values(fbidx_seq.nextval, ?,?,?,?,?)";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mIdx);
			pstmt.setString(2, fbCategory);
			pstmt.setString(3, fbTitle);
			pstmt.setString(4, fbContent);
			pstmt.setString(5, fbWriter);

			value = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;

	}
	
	public ArrayList<BoardVo> boardSelectAll() {
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		
		String sql = "SELECT * FROM BULLETINBOARD ORDER BY FBIDX DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setFbidx(rs.getInt("fbidx"));
				bv.setFbTitle(rs.getString("fbtitle"));
				bv.setFbWriter(rs.getString("fbwriter"));
				bv.setFbCategory(rs.getString("fbcategory"));
				bv.setFbWriteDate(rs.getDate("fbwritedate"));
				alist.add(bv);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return alist;
		
	}
	
	
}
