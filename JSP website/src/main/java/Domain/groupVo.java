package Domain;

import java.sql.Clob;
import java.sql.Date;

public class groupVo {

	private Number gbidx;
	private Number cidx;
	private Number pidx;
	private String gbtitle;
	private String gbwriter;
	private Clob gbcontent;
	private Date writetime;
	private Number gbhits;
	private String gbattendant;
	private String gbgoal;
	private String gbdwriter;
	private String gbdmention;

	
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
	public Clob getGbcontent() {
		return gbcontent;
	}
	public void setGbcontent(Clob gbcontent) {
		this.gbcontent = gbcontent;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	public Number getGbhits() {
		return gbhits;
	}
	public void setGbhits(Number gbhits) {
		this.gbhits = gbhits;
	}
	public String getGbattendant() {
		return gbattendant;
	}
	public void setGbattendant(String gbattendant) {
		this.gbattendant = gbattendant;
	}
	public String getGbgoal() {
		return gbgoal;
	}
	public void setGbgoal(String gbgoal) {
		this.gbgoal = gbgoal;
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
	
}
