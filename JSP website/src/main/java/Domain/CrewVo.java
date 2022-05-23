package Domain;

import java.sql.Date;

public class CrewVo {
	
	private Number midx;
	private Number cidx;
	private String ctitle;
	private String cobjective;
	private String cmember;
	private Number ccapacity;
	private Date cperiod;
	private String cmemberyn;
	
	
	public Number getMidx() {
		return midx;
	}
	public void setMidx(Number midx) {
		this.midx = midx;
	}
	public Number getCidx() {
		return cidx;
	}
	public void setCidx(Number cidx) {
		this.cidx = cidx;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCobjective() {
		return cobjective;
	}
	public void setCobjective(String cobjective) {
		this.cobjective = cobjective;
	}
	public String getCmember() {
		return cmember;
	}
	public void setCmember(String cmember) {
		this.cmember = cmember;
	}
	public Number getCcapacity() {
		return ccapacity;
	}
	public void setCcapacity(Number ccapacity) {
		this.ccapacity = ccapacity;
	}
	public Date getCperiod() {
		return cperiod;
	}
	public void setCperiod(Date cperiod) {
		this.cperiod = cperiod;
	}
	public String getCmemberyn() {
		return cmemberyn;
	}
	public void setCmemberyn(String cmemberyn) {
		this.cmemberyn = cmemberyn;
	}
	
	
}
