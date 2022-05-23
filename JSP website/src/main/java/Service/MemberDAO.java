package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dbconn.Dbconn;
import Domain.MemberVo;

// DAO : 메소드들로만 구성. DB 접근을 위한 로직을 분리하기 위해 작성

public class MemberDAO {
	
	private Connection conn;				// 연결 객체
	private PreparedStatement pstmt;		// 구문 객체
	
	public MemberDAO() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}

	public int insertMember(String memberId, String memberPassword, String memberMail, String memberName, String memberGender) {
		int value = 0;
		
		String sql = "insert into member(MIDX,MEMBERID,MEMBERPASSWORD,MEMBEREMAIL,MEMBERNAME,MEMBERGENDER)" 
						+ "values(midx_seq.nextval, ?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPassword);
			pstmt.setString(3, memberMail);
			pstmt.setString(4, memberName);
			pstmt.setString(5, memberGender);
			value = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		
		} return value; 
	}
	
	public ArrayList<MemberVo> memberSelectAll() {
		
		ArrayList<MemberVo> alist = new ArrayList<MemberVo>();				// 객체 생성
		
		String sql = "SELECT * FROM MEMBER";
		ResultSet rs = null;												// ResultSet : 여러 데이터들을 복사해서 담는 클래스
		
		try {
		pstmt = conn.prepareStatement(sql);									// Connection 객체를 통해 문자열을 쿼리화
			rs = pstmt.executeQuery();								
			
		while(rs.next()) {													// 반복문을 사용해 데이터를 꺼냄
				MemberVo mv = new MemberVo();								// 객체 생성
				
				mv.setMidx(rs.getInt("mIdx"));								// 객체에 데이터 담기
				mv.setMemberid(rs.getString("memberId"));
				mv.setMemberemail(rs.getString("memberEmail"));
				mv.setMembergender(rs.getString("gender"));
				mv.setMembername(rs.getString("memberName"));
				mv.setMemberpassword(rs.getString("memberPassword"));
				
				
				alist.add(mv);												// 데이터를 담은 객체를 ArrayList에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		return alist;
	}
	
}
