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
	
	// 댓글 작성
	// fbidx(게시글 번호)에 해당하는 cmWriter(댓글 작성자), cmComment(댓글 내용) 정보를 이용해 댓글 추가
	// 수정, 삭제 등의 권한 부여를 위해 midx(회원 번호) 사용 
	public int insertComment(int fbIdx, String cmWriter, String cmComment, int midx) {
		int value = 0;
		
		String sql = "INSERT INTO BULLETINCOMMENT(FBIDX, CMIDX, CMWRITER, CMCOMMENT, MIDX)"
				+ "values(?, cmidx_seq.nextval,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fbIdx);
			pstmt.setString(2, cmWriter);
			pstmt.setString(3, cmComment);
			pstmt.setInt(4, midx);
			// cmidx는 자동으로 설정되므로 이곳에서 지정하지 않는다
			
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return value;
	}
	
	// 댓글 보이기 : fbidx(게시글 번호)에 해당하는 댓글을 보여줌
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
				cv.setMidx(rs.getInt("midx"));
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
	
	// 댓글 삭제: cmidx(댓글 번호)에 해당하는 댓글 삭제  
	public int deleteComment(int cmidx) {
		int value = 0;
		
		String sql = "delete bulletincomment where cmidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cmidx);
			value = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
		return value;
	}

	// 게시글 삭제: fbidx(게시글 번호)에 해당하는 게시글 삭제
	public int deleteBoard(int fbidx) {
		int value = 0;
		
		String sql = "DELETE FROM BULLETINBOARD WHERE fbidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fbidx);
			value = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return value;
	}
	
	
}
