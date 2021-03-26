package com.a.b.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class RentalingList {

	private long bRentalno;
	private String bId;
	private long bBookno;
	private Timestamp bRentaldate;
	private Timestamp bReturndate;
	private String bUrl;
	
	public RentalingList() {}

	public RentalingList(long bRentalno, String bId, long bBookno, 
			Timestamp bRentaldate, Timestamp bReturndate, String bUrl) {
		this.bRentalno = bRentalno;
		this.bId = bId;
		this.bBookno = bBookno;
		this.bRentaldate = bRentaldate;
		this.bReturndate = bReturndate;
		this.setbUrl(bUrl);
	}

	public long getbRentalno() {
		return bRentalno;
	}

	public void setbRentalno(long bRentalno) {
		this.bRentalno = bRentalno;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public long getbBookno() {
		return bBookno;
	}

	public void setbBookno(long bBookno) {
		this.bBookno = bBookno;
	}

	public Timestamp getbRentaldate() {
		return bRentaldate;
	}

	public void setbRentaldate(Timestamp bRentaldate) {
		this.bRentaldate = bRentaldate;
	}

	public Timestamp getbReturndate() {
		return bReturndate;
	}

	public void setbReturndate(Timestamp bReturndate) {
		this.bReturndate = bReturndate;
	}

	public String getbUrl() {
		return bUrl;
	}

	public void setbUrl(String bUrl) {
		this.bUrl = bUrl;
	}
	
	
	
}
