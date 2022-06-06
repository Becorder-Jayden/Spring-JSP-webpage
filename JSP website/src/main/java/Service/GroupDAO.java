package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.BoardVo;
import Domain.GroupVo;
import Domain.SearchCriteria;

public class GroupDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public GroupDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// 그룹 게시판 보기
	public ArrayList<GroupVo> selectGroupBoardAll(SearchCriteria scri){
		ArrayList<GroupVo> glist = new ArrayList<GroupVo>();
		ResultSet rs = null;
	
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from ("
				+ "select * from groupboard order by gbidx desc)"
				+ "a)"
				+ "b where rnum between ? and ?";
		
		try {
			// 6.6 Q.왜 오류가 나는 건지?
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (scri.getPage()-1)*15+1);
			pstmt.setInt(2, (scri.getPage()*15));
			rs = pstmt.executeQuery();
			
		while (rs.next()) {
			GroupVo gv = new GroupVo();
			gv.setGbidx(rs.getInt("gbidx"));
			gv.setGbtitle(rs.getString("gbtitle"));
			gv.setGbwriter(rs.getString("gbwriter"));
			gv.setGbwritetime(rs.getDate("gbwritetime"));
			gv.setGbhit(rs.getInt("gbhit"));
			glist.add(gv);
			}
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
	public int insertGroupBoard(String gbtitle, int midx, String gbwriter, String gbcontent, String img) {
		int value = 0;

		String sql = "INSERT INTO GROUPBOARD(GBIDX,GBTITLE,MIDX,GBWRITER,GBCONTENT,IMG)"
				+ "VALUES(gbidx_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gbtitle);
			pstmt.setInt(2, midx);
			pstmt.setString(3, gbwriter);
			pstmt.setString(4, gbcontent);
			pstmt.setString(5, img);
			value = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}

	public GroupVo groupSelectOne(int gbidx) {
		GroupVo gv = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM groupboard WHERE GBIDX = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gbidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				gv = new GroupVo();
				gv.setGbidx(rs.getInt("gbidx"));
				gv.setGbtitle(rs.getString("gbtitle"));
				gv.setGbcontent(rs.getString("gbcontent"));
				gv.setGbwriter(rs.getString("gbwriter"));
				gv.setGbwritetime(rs.getDate("gbwritetime"));
				gv.setGbfilename(rs.getString("img"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		/* 6/6 finally를 하지 않으면 정상작동 됨. close구문 관련해서 이해 부족?
		 * finally { try { conn.close(); rs.close(); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * }
		 */
		return gv;
	}

	public int groupTotal(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String sql = "select count(*) as cnt from groupboard";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

}
