package Service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.BoardVo;
import Domain.SearchCriteria;

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
	
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		
		// 페이징 - 검색어, 작성자
		String str = "";
		if (scri.getSearchType().equals("fbtitle")) {
			str = "and fbtitle like ?";
		} else {
			str = "and fbwriter like ?";
		}
		
		// 쿼리문 between을 사용. 게시글의 한 화면에 보이는 글의 개수 조절
		String sql = "SELECT * FROM"
				+ "(SELECT ROWNUM AS rnum, A.* FROM"
				+ "(SELECT * FROM bulletinboard ORDER BY fbidx DESC)"
				+ "A) "
				+ "B WHERE rnum BETWEEN ? AND ?"; 
			
		// 5/26 Q.오라클에서 추가한 데이터는 왜 안불러와지나요?
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (scri.getPage()-1)*20+1);
			pstmt.setInt(2, (scri.getPage()*20));
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
	
	// 페이징 → boardTotal 		Q.why??
	public int boardTotal(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) AS cnt from bulletinboard";
		
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

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
		
	}
	
}
