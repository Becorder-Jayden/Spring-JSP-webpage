package Domain;

import java.sql.Blob;
import java.sql.Date;

public class PersonalVo {

	private Number midx;
	private Number pidx;
	private Date pdate;
	private Number pweight;
	private Number pcontinuous;
	private Blob pweightimg;
	private String pMemo;

	
	public Number getMidx() {
		return midx;
	}
	public void setMidx(Number midx) {
		this.midx = midx;
	}
	public Number getPidx() {
		return pidx;
	}
	public void setPidx(Number pidx) {
		this.pidx = pidx;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Number getPweight() {
		return pweight;
	}
	public void setPweight(Number pweight) {
		this.pweight = pweight;
	}
	public Number getPcontinuous() {
		return pcontinuous;
	}
	public void setPcontinuous(Number pcontinuous) {
		this.pcontinuous = pcontinuous;
	}
	public Blob getPweightimg() {
		return pweightimg;
	}
	public void setPweightimg(Blob pweightimg) {
		this.pweightimg = pweightimg;
	}
	public String getpMemo() {
		return pMemo;
	}
	public void setpMemo(String pMemo) {
		this.pMemo = pMemo;
	}
}
