package com.project3.vo;

import java.util.List;

public class IdusOrderVO {
	String uemail, pid, p1_amt, p1_price, p2_amt, p2_price, p3_amt, p3_price, sname, ptitle, opt1, opt2, opt3, 
	del_price, pfile1, psfile1, rname, raddr, rcp;
	int t_price;
	List<IdusOrderVO> IdusOrderVOList;
	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRaddr() {
		return raddr;
	}

	public void setRaddr(String raddr) {
		this.raddr = raddr;
	}

	public String getRcp() {
		return rcp;
	}

	public void setRcp(String rcp) {
		this.rcp = rcp;
	}

	public List<IdusOrderVO> getIdusOrderVOList() {
		return IdusOrderVOList;
	}

	public void setIdusOrderVOList(List<IdusOrderVO> idusOrderVOList) {
		IdusOrderVOList = idusOrderVOList;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
	}

	public String getDel_price() {
		return del_price;
	}

	public void setDel_price(String del_price) {
		this.del_price = del_price;
	}

	public String getOpt1() {
		return opt1;
	}

	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}

	public String getOpt2() {
		return opt2;
	}

	public String getPfile1() {
		return pfile1;
	}

	public void setPfile1(String pfile1) {
		this.pfile1 = pfile1;
	}

	public String getPsfile1() {
		return psfile1;
	}

	public void setPsfile1(String psfile1) {
		this.psfile1 = psfile1;
	}

	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}

	public String getOpt3() {
		return opt3;
	}

	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getP1_amt() {
		return p1_amt;
	}

	public void setP1_amt(String p1_amt) {
		this.p1_amt = p1_amt;
	}

	public String getP1_price() {
		return p1_price;
	}

	public void setP1_price(String p1_price) {
		this.p1_price = p1_price;
	}

	public String getP2_amt() {
		return p2_amt;
	}

	public void setP2_amt(String p2_amt) {
		this.p2_amt = p2_amt;
	}

	public String getP2_price() {
		return p2_price;
	}

	public void setP2_price(String p2_price) {
		this.p2_price = p2_price;
	}

	public String getP3_amt() {
		return p3_amt;
	}

	public void setP3_amt(String p3_amt) {
		this.p3_amt = p3_amt;
	}

	public String getP3_price() {
		return p3_price;
	}

	public void setP3_price(String p3_price) {
		this.p3_price = p3_price;
	}
	
}
