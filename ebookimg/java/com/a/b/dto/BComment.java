package com.a.b.dto;

import java.sql.Timestamp;

public class BComment {
	
	private long bCid;
	private String bId;
	private String bContent;
	private Timestamp bDate;
	private long bStep;
	
	public BComment() {}

	public BComment(long bCid, String bId, 
			String bContent, Timestamp bDate, long bStep) {
		this.bCid = bCid;
		this.bId = bId;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bStep = bStep;
	}

	public long getbCid() {
		return bCid;
	}

	public void setbCid(long bCid) {
		this.bCid = bCid;
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

	public long getbStep() {
		return bStep;
	}

	public void setbStep(long bStep) {
		this.bStep = bStep;
	}	
	
}
