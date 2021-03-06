package org.prototype.domain;

import java.sql.Date;

public class Test_boardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private String file_url;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	@Override
	public String toString() {
		return "Test_boardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", file_url=" + file_url + "]";
	}
}
