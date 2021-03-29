package com.a.b.dto;

import java.sql.Timestamp;

public class RentalList {
	
	private long bRentalno;
	private String bId;
	private long bBookno;
	private Timestamp bRentaldate;
	private String bUrl;
	private String bBookname;
	
	public RentalList() {}

	public RentalList(long bRentalno, String bId, long bBookno, 
			Timestamp bRentaldate, String bUrl, String bBookname) {
		this.bRentalno = bRentalno;
		this.bId = bId;
		this.bBookno = bBookno;
		this.bRentaldate = bRentaldate;
		this.setbUrl(bUrl);
		this.setbBookname(bBookname);
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

	public String getbUrl() {
		return bUrl;
	}

	public void setbUrl(String bUrl) {
		this.bUrl = bUrl;
	}

	public String getbBookname() {
		return bBookname;
	}

	public void setbBookname(String bBookname) {
		this.bBookname = bBookname;
	}

	
	
}
