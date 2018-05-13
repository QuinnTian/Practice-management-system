package com.sict.entity;

import java.sql.Timestamp;

public class ReplyNotice {

	private String	 id;
	private String invitation_id;
	private String content;
	private String issuer_id;
	private String reply_id;
	private char isRead;
	private Timestamp create_time;
	private char state;
	private String Temp1;
	private String Temp2;
	private String Temp3;
	private String Temp4;
	private String Temp5;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInvitation_id() {
		return invitation_id;
	}
	public void setInvitation_id(String invitation_id) {
		this.invitation_id = invitation_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIssuer_id() {
		return issuer_id;
	}
	public void setIssuer_id(String issuer_id) {
		this.issuer_id = issuer_id;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public char getIsRead() {
		return isRead;
	}
	public void setIsRead(char isRead) {
		this.isRead = isRead;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public String getTemp1() {
		return Temp1;
	}
	public void setTemp1(String temp1) {
		Temp1 = temp1;
	}
	public String getTemp2() {
		return Temp2;
	}
	public void setTemp2(String temp2) {
		Temp2 = temp2;
	}
	public String getTemp3() {
		return Temp3;
	}
	public void setTemp3(String temp3) {
		Temp3 = temp3;
	}
	public String getTemp4() {
		return Temp4;
	}
	public void setTemp4(String temp4) {
		Temp4 = temp4;
	}
	public String getTemp5() {
		return Temp5;
	}
	public void setTemp5(String temp5) {
		Temp5 = temp5;
	}
	
	
	
	
	
}
