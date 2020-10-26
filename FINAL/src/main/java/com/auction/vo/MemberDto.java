package com.auction.vo;

public class MemberDto {
	private String ID;
	private String pw;
	private String name;
	private String addr;
	private String phonenum;
	private String email;
	private String birth;
	private String grade;
	
	public MemberDto() {}
	public MemberDto(String iD, String pw, String name, String addr, String phonenum, String email, String birth,
			String grade) {
		this.ID = iD;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.phonenum = phonenum;
		this.email = email;
		this.birth = birth;
		this.grade = grade;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
