package com.auction.vo;

public class AuctionVo {
	private int idx;
	private String ID;
	private int pno;
	private int myprice;
	private String buydate;
	
	public AuctionVo() {}

	public AuctionVo(int idx, String iD, int pno, int myprice, String buydate) {
		super();
		this.idx = idx;
		ID = iD;
		this.pno = pno;
		this.myprice = myprice;
		this.buydate = buydate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMyprice() {
		return myprice;
	}

	public void setMyprice(int myprice) {
		this.myprice = myprice;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	
	
	
}
