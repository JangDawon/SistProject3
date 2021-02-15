package com.project3.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class IdusMemberVO {
	CommonsMultipartFile file1;
	String uemail, upass, uname, cp, addr1, addr2, addr3, aggrsms, aggremail, pfile, psfile, udate,savepath ;
	String[]	agree;
	String agree_list;
	int rno;
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public String getAgree_list() {
		String str = "";
		if(agree!=null) {
			str = String.join(",", agree);
		}else {
			str = agree_list;
		}
		return str;
	}
	public void setAgree_list(String agree_list) {
		this.agree_list = agree_list;
	}
	public String[] getAgree() {
		return agree;
	}
	public void setAgree(String[] agree) {
		this.agree = agree;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAggrsms() {
		return aggrsms;
	}
	public void setAggrsms(String aggrsms) {
		this.aggrsms = aggrsms;
	}
	public String getAggremail() {
		return aggremail;
	}
	public void setAggremail(String aggremail) {
		this.aggremail = aggremail;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public String getPsfile() {
		return psfile;
	}
	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}

	
}
