package com.project3.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class IdusReviewVO {

	int rno;
	String rid, pid, uemail, oid, rfile, rsfile, rcontent, rscore, rdate, savepath, ptitle,pfile1,psfile1,onum;
	double product_avg;
	
	
	public double getProduct_avg() {
		return product_avg;
	}

	public void setProduct_avg(double product_avg) {
		this.product_avg = product_avg;
	}

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
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

	CommonsMultipartFile file1;

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public CommonsMultipartFile getFile1() {
		return file1;
	}

	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getRfile() {
		return rfile;
	}

	public void setRfile(String rfile) {
		this.rfile = rfile;
	}

	public String getRsfile() {
		return rsfile;
	}

	public void setRsfile(String rsfile) {
		this.rsfile = rsfile;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRscore() {
		return rscore;
	}

	public void setRscore(String rscore) {
		this.rscore = rscore;
	}

	public String getSavepath() {
		return savepath;
	}

	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
}