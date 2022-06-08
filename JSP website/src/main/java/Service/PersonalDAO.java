package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import Dbconn.Dbconn;
import Domain.PersonalVo;

public class PersonalDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	 public PersonalDAO() {
		 Dbconn db = new Dbconn();
		 this.conn = db.getConnection();
	}
	
	// 일일 몸무게 기록
	public int insertPersonal(int mIdx, int pbWeight, String pbWeightImg, String pbMemo) {
		int value = 0;
		
		String sql = "INSERT INTO personal(midx, pbidx, pbweight, pbcontinuous, pbweightimg, pbmemo)"
				+ "VALUES (?, pbidx_seq.NEXTVAL, ?, NULL, ?, ?)";
		
		// C. pbcontinous : 연속된 기록 날짜 - 구현상의 어려워서 일단 null 값 입력
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mIdx);
			pstmt.setInt(2, pbWeight);
			pstmt.setString(3, pbWeightImg);
			pstmt.setString(4, pbMemo);
			value = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	
	// 전체 기록 가져오기
	public ArrayList<PersonalVo> personalSelectALL(int midx) {
		ArrayList<PersonalVo> plist = new ArrayList<PersonalVo>();
		ResultSet rs = null;
		
		String sql = "SELECT * FROM "
				+ "(SELECT MIDX, PBIDX, PBDATE, PBWEIGHT, pbContinuous, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 "
				+ "FROM personal ORDER BY PBIDX DESC) "
				+ "WHERE midx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PersonalVo pv = new PersonalVo();
				pv.setPbidx(rs.getInt("pbidx2"));	// pbidx는 개인 게시판 DB에 저장된 모든 글에 적용되는 인덱스이다. midx별로 group을 지어 활용한 rank를 pbidx2라는 집계함수로 만들어 이를 개별 인덱스로 대체하였다. 
				pv.setPbdate(rs.getDate("pbdate"));
				pv.setPbweight(rs.getInt("pbweight"));
				pv.setPbMemo(rs.getString("pbmemo"));
				pv.setPbweightimg(rs.getString("pbweightimg"));
				plist.add(pv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	
	
	// 하나의 기록 가져오기 - 테스트
	public PersonalVo personalSelectOne(int midx, int pbidx2) {
		PersonalVo pv = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT MIDX, PBIDX, PBDATE, PBWEIGHT, pbContinuous, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 FROM personal ORDER BY PBIDX DESC) WHERE midx = ? AND pbidx2 = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setInt(2, pbidx2);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pv = new PersonalVo();
				pv.setMidx(rs.getInt("midx"));
				pv.setPbidx(rs.getInt("pbidx2"));
				pv.setPbcontinuous(rs.getInt("pbcontinuous"));
				pv.setPbdate(rs.getDate("pbdate"));
				pv.setPbweight(rs.getInt("pbweight"));
				pv.setPbweightimg(rs.getString("pbweightimg"));
				pv.setPbMemo(rs.getString("pbmemo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pv;
	}
}
