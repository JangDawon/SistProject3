package com.project3.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class IdusProductVO {
	String pid, pcat, sname, semail, ptitle, pcontent, pfile1, psfile1, pfile2, psfile2
	, pfile3, psfile3, pdate, savePath, opt1, opt2, opt3;
	int rno, pprice, product_total, opt1_price, opt2_price, opt3_price;
	CommonsMultipartFile file1, file2, file3;
	CommonsMultipartFile[] file;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPcat() {
		return pcat;
	}
	public void setPcat(String pcat) {
		this.pcat = pcat;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
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
	public String getPfile2() {
		return pfile2;
	}
	public void setPfile2(String pfile2) {
		this.pfile2 = pfile2;
	}
	public String getPsfile2() {
		return psfile2;
	}
	public void setPsfile2(String psfile2) {
		this.psfile2 = psfile2;
	}
	public String getPfile3() {
		return pfile3;
	}
	public void setPfile3(String pfile3) {
		this.pfile3 = pfile3;
	}
	public String getPsfile3() {
		return psfile3;
	}
	public void setPsfile3(String psfile3) {
		this.psfile3 = psfile3;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
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
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getProduct_total() {
		return product_total;
	}
	public void setProduct_total(int product_total) {
		this.product_total = product_total;
	}
	public int getOpt1_price() {
		return opt1_price;
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
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public CommonsMultipartFile getFile2() {
		return file2;
	}
	public void setFile2(CommonsMultipartFile file2) {
		this.file2 = file2;
	}
	public CommonsMultipartFile getFile3() {
		return file3;
	}
	public void setFile3(CommonsMultipartFile file3) {
		this.file3 = file3;
	}
	public CommonsMultipartFile[] getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile[] file) {
		this.file = file;
	}
	
	
}
