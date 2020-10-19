package com.auction.vo;

public class CommentVo {
	private int cno;
	private int qbno;
	private String comment;
	private String ID;
	private int level;
	private int ref;
	private int step;
	
	public CommentVo() {}
	public CommentVo(int qbno, String comment, String iD) {
		this.qbno = qbno;
		this.comment = comment;
		ID = iD;
	}
	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getQbno() {
		return qbno;
	}

	public void setQbno(int qbno) {
		this.qbno = qbno;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}
	
	
}
