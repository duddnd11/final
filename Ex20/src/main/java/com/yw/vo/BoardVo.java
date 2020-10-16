package com.yw.vo;

public class BoardVo {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private int ref;
	private int level;
	private int step;
	private String imagename;
	
	public BoardVo() {}
	public BoardVo(String title, String content, String writer, int ref, int level, int step,String imagename) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.ref = ref;
		this.level = level;
		this.step = step;
		this.imagename=imagename;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", title=" + title + ", content=" + content + ", writer=" + writer + ", ref="
				+ ref + ", level=" + level + ", step=" + step + "]";
	}
	
}
