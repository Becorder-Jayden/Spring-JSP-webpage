package Domain;

import java.sql.Date;

public class BulletinVo {

	private Number fbidx;
	private Number midx;
	private String fbcategory;
	private String fbtitle;
	private String fbcontent;
	private String fbwriter;
	private Date fbwritedate;
	
	
	public Number getFbidx() {
		return fbidx;
	}
	public void setFbidx(Number fbidx) {
		this.fbidx = fbidx;
	}
	public Number getMidx() {
		return midx;
	}
	public void setMidx(Number midx) {
		this.midx = midx;
	}
	public String getFbcategory() {
		return fbcategory;
	}
	public void setFbcategory(String fbcategory) {
		this.fbcategory = fbcategory;
	}
	public String getFbtitle() {
		return fbtitle;
	}
	public void setFbtitle(String fbtitle) {
		this.fbtitle = fbtitle;
	}
	public String getFbcontent() {
		return fbcontent;
	}
	public void setFbcontent(String fbcontent) {
		this.fbcontent = fbcontent;
	}
	public String getFbwriter() {
		return fbwriter;
	}
	public void setFbwriter(String fbwriter) {
		this.fbwriter = fbwriter;
	}
	public Date getFbwritedate() {
		return fbwritedate;
	}
	public void setFbwritedate(Date fbwritedate) {
		this.fbwritedate = fbwritedate;
	}
	
	
	
}
