package com.yw.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVo {
	private String id;
	private String pw;
	private String name;
	private MultipartFile multipart;
	private String imagename;
	
	public MemberVo() {}
	public MemberVo(String id, String pw, String name, MultipartFile multipart, String imagename) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.multipart = multipart;
		this.imagename = imagename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public MultipartFile getMultipart() {
		return multipart;
	}
	public void setMultipart(MultipartFile multipart) {
		this.multipart = multipart;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", name=" + name + ", multipart=" + multipart + ", imagename="
				+ imagename + "]";
	}
	
}
