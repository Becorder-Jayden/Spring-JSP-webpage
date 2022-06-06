package Domain;

import java.sql.Date;

public class GroupVo {

	private Number gbidx;
	private Number cidx;
	private Number pidx;
	private String gbtitle;
	private String gbwriter;
	private String gbcontent;
	private Date gbwritetime;
	private Number gbhit;
	private String gbattendant;
	private String gbdwriter;
	private String gbdmention;
	private String gbfilename;

	
	public Number getGbidx() {
		return gbidx;
	}
	public void setGbidx(Number gbidx) {
		this.gbidx = gbidx;
	}
	public Number getCidx() {
		return cidx;
	}
	public void setCidx(Number cidx) {
		this.cidx = cidx;
	}
	public Number getPidx() {
		return pidx;
	}
	public void setPidx(Number pidx) {
		this.pidx = pidx;
	}
	public String getGbtitle() {
		return gbtitle;
	}
	public void setGbtitle(String gbtitle) {
		this.gbtitle = gbtitle;
	}
	public String getGbwriter() {
		return gbwriter;
	}
	public void setGbwriter(String gbwriter) {
		this.gbwriter = gbwriter;
	}
	public String getGbcontent() {
		return gbcontent;
	}
	public void setGbcontent(String gbcontent) {
		this.gbcontent = gbcontent;
	}
	public Date getGbwritetime() {
		return gbwritetime;
	}
	public void setGbwritetime(Date gbwritetime) {
		this.gbwritetime = gbwritetime;
	}
	public Number getGbhit() {
		return gbhit;
	}
	public void setGbhit(Number gbhit) {
		this.gbhit = gbhit;
	}
	public String getGbattendant() {
		return gbattendant;
	}
	public void setGbattendant(String gbattendant) {
		this.gbattendant = gbattendant;
	}
	public String getGbdwriter() {
		return gbdwriter;
	}
	public void setGbdwriter(String gbdwriter) {
		this.gbdwriter = gbdwriter;
	}
	public String getGbdmention() {
		return gbdmention;
	}
	public void setGbdmention(String gbdmention) {
		this.gbdmention = gbdmention;
	}
	
	public String getGbfilename() {
		return gbfilename;
	}
	public void setGbfilename(String gbfilename) {
		this.gbfilename = gbfilename;
	}
}
