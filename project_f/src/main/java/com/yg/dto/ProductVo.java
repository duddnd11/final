package com.yg.dto;

import java.util.Date;

public class ProductVo {
	private int pno;
	private String pname;
	private String image;
	private int price; 
	private String uploaddate; 
	private String deadlinedate;
	private int hitcount;
	private String ID;
	private int bestmoney;
	private int admin;
	private String category;
	private String auctionmenu;
	private int deal;
	
	public ProductVo() {}

	
	
	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, int hitcount,
			String iD, int bestmoney, int admin, String category, String auctionmenu) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		this.hitcount = hitcount;
		ID = iD;
		this.bestmoney = bestmoney;
		this.admin = admin;
		this.category = category;
		this.auctionmenu = auctionmenu;
	}

	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, int hitcount,
			String iD, int bestmoney, int admin, String category, String auctionmenu, int deal) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		this.hitcount = hitcount;
		ID = iD;
		this.bestmoney = bestmoney;
		this.admin = admin;
		this.category = category;
		this.auctionmenu = auctionmenu;
		this.deal = deal;
	}

	public ProductVo(String pname, String image, int price, String uploaddate, String deadlinedate, String iD,
			String category, String auctionmenu) {
		super();
		this.pname = pname;
		this.image = image;
		this.price = price;
		this.uploaddate = uploaddate;
		this.deadlinedate = deadlinedate;
		ID = iD;
		this.category = category;
		this.auctionmenu = auctionmenu;
	}

	
	
	public int getPno() {
		return pno;
	}



	public void setPno(int pno) {
		this.pno = pno;
	}



	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getDeadlinedate() {
		return deadlinedate;
	}

	public void setDeadlinedate(String deadlinedate) {
		this.deadlinedate = deadlinedate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getBestmoney() {
		return bestmoney;
	}

	public void setBestmoney(int bestmoney) {
		this.bestmoney = bestmoney;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAuctionmenu() {
		return auctionmenu;
	}

	public void setAuctionmenu(String auctionmenu) {
		this.auctionmenu = auctionmenu;
	}

	public int getDeal() {
		return deal;
	}

	public void setDeal(int deal) {
		this.deal = deal;
	}
	
	
	
}
