package Domain;

import java.sql.Date;

public class BoardVo {

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
	public String getFbCategory() {
		return fbcategory;
	}
	public void setFbCategory(String fbcategory) {
		this.fbcategory = fbcategory;
	}
	public String getFbTitle() {
		return fbtitle;
	}
	public void setFbTitle(String fbtitle) {
		this.fbtitle = fbtitle;
	}
	public String getFbContent() {
		return fbcontent;
	}
	public void setFbContent(String fbcontent) {
		this.fbcontent = fbcontent;
	}
	public String getFbWriter() {
		return fbwriter;
	}
	public void setFbWriter(String fbwriter) {
		this.fbwriter = fbwriter;
	}
	public Date getFbWriteDate() {
		return fbwritedate;
	}
	public void setFbWriteDate(Date fbwritedate) {
		this.fbwritedate = fbwritedate;
	}
	
	
	
}
