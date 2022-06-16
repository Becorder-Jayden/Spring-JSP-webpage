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
	
		String sql1 = "set @rownum:=0";
		String sql2 = "select * from ("
				+ "select @rownum:=@rownum+1 as rnum, a.* from ("
				+ "select * from groupboard order by gbidx desc)"
				+ "a)"
				+ "b where rnum limit ?, 10";
		
		try {
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, (scri.getPage()-1)*10+1);
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
		
		// Q. 6/6 finally를 하지 않으면 정상작동 됨. close구문 관련해서 이해 부족?
		// a. finally 구문의 경우 컨트롤러 기준으로 마지막에 사용되는 메서드에 적용시켜서 연결관계를 끊는데 사용된다. 마지막이 아닌 메서드에 적용할 경우 오류가 발생할 수 있다. 

		return gv;
	}

	
	// 페이징 계산을 위한 데이터 개수 확인
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
		}
		return cnt;
	}

	
	// boardView가 실행되었을 때 조회수 증가
	public int groupBoardCount(int gbidx) {
	int cnt = 0;
	String sql = "update groupboard set gbhit = gbhit+1 where gbidx = ?";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, gbidx);
		cnt = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		return cnt;
	}
	
}
