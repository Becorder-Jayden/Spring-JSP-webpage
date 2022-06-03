package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.BoardVo;
import Domain.GroupVo;

public class GroupDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public GroupDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// 그룹 게시판 보기
	public ArrayList<GroupVo> selectGroupBoardAll(){
		ArrayList<GroupVo> glist = new ArrayList<GroupVo>();
		ResultSet rs = null;
	
		String sql = "SELECT * FROM GROUPBOARD";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return glist;
	}
	
	
	
	
	
	
	// 그룹 게시판 글쓰기
	public int insertGroupBoard(String gbtitle, int midx , String gbwriter, int gbhit, String gbcontent, String img) {
		int value = 0;

		String sql = "INSERT INTO GROUPBOARD(GBIDX,GBTITLE,MIDX,GBWRITER,GBWRITETIME,GBHIT,GBCONTENT,IMG)"
				+ "VALUES(gbidx_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gbtitle);
			pstmt.setInt(2, midx);
			pstmt.setString(3, gbwriter);
			pstmt.setInt(4, gbhit);
			pstmt.setString(5, gbcontent);
			pstmt.setString(6, img);
			value = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
}
