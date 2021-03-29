package com.a.b.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component
public class Member {
	private long bNo;
	private String bId;
	private String bPw;
	private String bName;
	private String bGender;
	private Date bBirthday;
	private Timestamp bJoindate;
	private long bCash;
	public long getbNo() {
		return bNo;
	}
	public void setbNo(long bNo) {
		this.bNo = bNo;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbPw() {
		return bPw;
	}
	public void setbPw(String bPw) {
		this.bPw = bPw;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbGender() {
		return bGender;
	}
	public void setbGender(String bGender) {
		this.bGender = bGender;
	}
	public Date getbBirthday() {
		return bBirthday;
	}
	public void setbBirthday(Date bBirthday) {
		this.bBirthday = bBirthday;
	}
	public Timestamp getbJoindate() {
		return bJoindate;
	}
	public void setbJoindate(Timestamp bJoindate) {
		this.bJoindate = bJoindate;
	}
	public long getbCash() {
		return bCash;
	}
	public void setbCash(long bCash) {
		this.bCash = bCash;
	}
	@Override
	public String toString() {
		return "MyMember [bNo=" + bNo + ", bId=" + bId + ", bPw=" + bPw + ", bName=" + bName + ", bGender=" + bGender
				+ ", bBirthday=" + bBirthday + ", bJoindate=" + bJoindate + ", bCash=" + bCash + "]";
	}

	
}
