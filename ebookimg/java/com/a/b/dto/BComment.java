package com.a.b.dto;

import java.sql.Timestamp;

public class BComment {
	
	private long bCid;
	private long bBid;
	private String bId;
	private String bContent;
	private Timestamp bDate;
	private long bGroup;
	private long bStep;
	
	public BComment() {}

	public BComment(long bCid, long bBid, String bId, 
			String bContent, Timestamp bDate, 
			long bGroup, long bStep) {
		this.bCid = bCid;
		this.bBid = bBid;
		this.bId = bId;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bGroup = bGroup;
		this.bStep = bStep;
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

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public long getbGroup() {
		return bGroup;
	}

	public void setbGroup(long bGroup) {
		this.bGroup = bGroup;
	}

	public long getbStep() {
		return bStep;
	}

	public void setbStep(long bStep) {
		this.bStep = bStep;
	}	
	
}
