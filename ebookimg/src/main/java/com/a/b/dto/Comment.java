package com.a.b.dto;

import java.sql.Timestamp;

public class Comment {
	
	private long bCid;
	private long bBid;
	private String bId;
	private String cContent;
	private Timestamp cDate;
	
	public Comment() {}

	public Comment(long bCid, long bBid, String bId, 
			String cContent, Timestamp cDate) {
		this.bCid = bCid;
		this.bBid = bBid;
		this.bId = bId;
		this.cContent = cContent;
		this.cDate = cDate;
	}

	public long getbCid() {
		return bCid;
	}

	public void setbCid(long bCid) {
		this.bCid = bCid;
	}

	public long getbBid() {
		return bBid;
	}

	public void setbBid(long bBid) {
		this.bBid = bBid;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Timestamp getcDate() {
		return cDate;
	}

	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}	
	
}
