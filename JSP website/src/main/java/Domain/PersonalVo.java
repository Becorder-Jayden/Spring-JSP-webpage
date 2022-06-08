package Domain;

import java.sql.Date;

public class PersonalVo {

	private Number midx;
	private Number pbidx;
	private Date pbdate;
	private Number pbweight;
	private Number pbcontinuous;
	private String pbweightimg;
	private String pbMemo;
	
	
	//
	private String pbyear;
	private String pbMonth;
	
	
	
	public String getPbyear() {
		return pbyear;
	}
	public void setPbyear(String pbyear) {
		this.pbyear = pbyear;
	}
	public String getPbMonth() {
		return pbMonth;
	}
	public void setPbMonth(String pbMonth) {
		this.pbMonth = pbMonth;
	}
	
	
	
	//
	
	
	public Number getMidx() {
		return midx;
	}
	public void setMidx(Number midx) {
		this.midx = midx;
	}
	public Number getPbidx() {
		return pbidx;
	}
	public void setPbidx(Number pbidx) {
		this.pbidx = pbidx;
	}
	public Date getPbdate() {
		return pbdate;
	}
	public void setPbdate(Date pbdate) {
		this.pbdate = pbdate;
	}
	public Number getPbweight() {
		return pbweight;
	}
	public void setPbweight(Number pbweight) {
		this.pbweight = pbweight;
	}
	public Number getPbcontinuous() {
		return pbcontinuous;
	}
	public void setPbcontinuous(Number pbcontinuous) {
		this.pbcontinuous = pbcontinuous;
	}
	public String getPbweightimg() {
		return pbweightimg;
	}
	public void setPbweightimg(String pbweightimg) {
		this.pbweightimg = pbweightimg;
	}
	public String getPbMemo() {
		return pbMemo;
	}
	public void setPbMemo(String pbMemo) {
		this.pbMemo = pbMemo;
	}

	
}
