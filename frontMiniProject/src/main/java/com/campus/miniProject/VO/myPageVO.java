package com.campus.miniProject.VO;

public class myPageVO {
	private int datano;
	private String userid;
	private String title;
	private String color;
	private String content;
	private String Sdate;
	private String Edate;
	private String jsonform;
	private int year;
	private int month;

	public int getDatano() {
		return datano;
	}
	public void setDatano(int datano) {
		this.datano = datano;
	}
	public void setJsonform(String jsonform) {
		this.jsonform = jsonform;
	}
	public String getJsonform() {
		return jsonform;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSdate() {
		return Sdate;
	}
	public void setSdate(String sdate) {
		Sdate = sdate;
		
		String [] month_day = sdate.split("-");
		year = Integer.parseInt(month_day [0]);
		month = Integer.parseInt(month_day [1]);
	}
	public String getEdate() {
		return Edate;
	}
	public void setEdate(String edate) {
		Edate = edate;
		//
	}
	public int getMonth() {
		return month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMonth(int month) {
		this.month = month;
	}
}
