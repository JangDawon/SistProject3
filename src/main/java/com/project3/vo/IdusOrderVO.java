package com.project3.vo;

public class IdusOrderVO {
	String oid, uemail, pid, rname, raddr, rcp, cancel, cdate, rdate, cid, onum, ptitle, pfile1, psfile1,opt1, opt2, opt3;
	public String getOpt1() {
		return opt1;
	}

	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}

	public String getOpt2() {
		return opt2;
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

	int rno, opt1_qty, opt2_qty, opt3_qty, del_price, total_price, raddr_num,opt1_price,opt2_price,opt3_price,pprice;

	public int getOpt1_price() {
		return opt1_price;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public void setOpt1_price(int opt1_price) {
		this.opt1_price = opt1_price;
	}

	public int getOpt2_price() {
		return opt2_price;
	}

	public void setOpt2_price(int opt2_price) {
		this.opt2_price = opt2_price;
	}

	public int getOpt3_price() {
		return opt3_price;
	}

	public void setOpt3_price(int opt3_price) {
		this.opt3_price = opt3_price;
	}

	public int getRaddr_num() {
		return raddr_num;
	}

	public void setRaddr_num(int raddr_num) {
		this.raddr_num = raddr_num;
	}

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
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

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getOpt1_qty() {
		return opt1_qty;
	}

	public void setOpt1_qty(int opt1_qty) {
		this.opt1_qty = opt1_qty;
	}

	public int getOpt2_qty() {
		return opt2_qty;
	}

	public void setOpt2_qty(int opt2_qty) {
		this.opt2_qty = opt2_qty;
	}

	public int getOpt3_qty() {
		return opt3_qty;
	}

	public void setOpt3_qty(int opt3_qty) {
		this.opt3_qty = opt3_qty;
	}

	public int getDel_price() {
		return del_price;
	}

	public void setDel_price(int del_price) {
		this.del_price = del_price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
}
