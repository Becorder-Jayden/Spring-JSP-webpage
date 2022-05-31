package Service;

import java.sql.Connection;
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
		Dbconn db = new Dbconn(); // db 접속정보 전달
		this.conn = db.getConnection(); // db 연결

	}

	// 자유게시판 글쓰기
	public int insertBoard(int mIdx, String fbCategory, String fbTitle, String fbContent, String fbWriter) {
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

	public BoardVo boardSelectOne(int fbidx) {
		BoardVo bv = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM bulletinboard WHERE FBIDX = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fbidx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bv = new BoardVo();
				bv.setFbidx(rs.getInt("fbidx"));
				bv.setFbCategory(rs.getString("fbcategory"));
				bv.setFbTitle(rs.getString("fbtitle"));
				bv.setFbContent(rs.getString("fbcontent"));
				bv.setFbWriter(rs.getString("fbwriter"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bv;

	}

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = new BoardVo();
		ResultSet rs = null;

		// 쿼리문 between을 사용. 게시글의 한 화면에 보이는 글의 개수 조절
		String sql = "SELECT * FROM" + "(SELECT ROWNUM AS rnum, A.* FROM" + "(SELECT * FROM bulletinboard  where fbtitle like ? and fbcategory like ?"
				+ " ORDER BY fbidx DESC)" + "A) " + "B WHERE rnum BETWEEN ? AND ?";
		// 5.30 검색기능을 구현하기 위해 boardSelectAll에 where절이 잘 있는지 확인해야 함
		// 5.26 Q.오라클에서 추가한 데이터는 왜 안불러와지나요? A. commit을 하지 않으면 불러와지지 않음

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + scri.getKeyword() + "%");
			pstmt.setString(2, "%" + scri.getCategory() + "%");
			pstmt.setInt(3, (scri.getPage() - 1) * 20 + 1);
			pstmt.setInt(4, (scri.getPage() * 20));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv.setFbidx(rs.getInt("fbidx"));
				bv.setFbTitle(rs.getString("fbtitle"));
				bv.setFbWriter(rs.getString("fbwriter"));
				bv.setFbCategory(rs.getString("fbcategory"));
				bv.setFbWriteDate(rs.getDate("fbwritedate"));
				alist.add(bv);
			}
		} catch (SQLException e) {
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

	// 페이징 → boardTotal Q.why??
	public int boardTotal(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		String str = "";

		String sql = "SELECT COUNT(*) AS cnt from bulletinboard where fbtitle like ? and fbcategory like ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + scri.getKeyword() + "%");
				pstmt.setString(2, "%" + scri.getCategory() + "%");

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

	// 카테고리
	public ArrayList<BoardVo> boardSelectCategory(String fbcategory) {
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;

		// DB 접근
		String sql = "SELECT * FROM bulletinboard WHERE fbCategory = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fbcategory);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return alist;
	}

}
