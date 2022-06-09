package Domain;

// DB에서 member 컬럼 값을 담는 역할

public class MemberVo {
	
	// 데이터 정의
	private Number midx;
	private String memberid;
	private String memberpassword;
	private String memberemail;
	private String membername;
	private String membergender;
	private String memberimg;

	
	// getter & setter : 클래스 필드에 직접 접근하는 것을 방지
	public Number getMidx() {
		return midx;
	}
	public void setMidx(Number midx) {
		this.midx = midx;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMemberpassword() {
		return memberpassword;
	}
	public void setMemberpassword(String memberpassword) {
		this.memberpassword = memberpassword;
	}
	public String getMemberemail() {
		return memberemail;
	}
	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getMembergender() {
		return membergender;
	}
	public void setMembergender(String membergender) {
		this.membergender = membergender;
	}
	
	// 6.9 추가 
	public String getMemberimg() {
		return memberimg;
	}
	public void setMemberimg(String memberimg) {
		this.memberimg = memberimg;
	}

}