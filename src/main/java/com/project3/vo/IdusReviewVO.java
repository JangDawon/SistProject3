package com.project3.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class IdusReviewVO {
	int rno;
	String rid, pid, uemail, rfile, rsfile, rcontent, order_num, order_date, rdate, rscore, savepath;
	CommonsMultipartFile file1;

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

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
