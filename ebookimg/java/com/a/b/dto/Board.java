package com.a.b.dto;

import java.sql.Timestamp;

public class Board {

	private long bBid;
	private String bId;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	private long bHit;
	private long bGroup;
	private long bStep;
	private long bIndent;
	
	public Board() {}

	public Board(long bBid, String bId, String bTitle, String bContent, 
		 Timestamp bDate, long bHit,
		 long bGroup, long bStep, long bIndent) {
		this.bBid = bBid;
		this.bId = bId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
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

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
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

	public long getbHit() {
		return bHit;
	}

	public void setbHit(long bHit) {
		this.bHit = bHit;
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

	public long getbIndent() {
		return bIndent;
	}

	public void setbIndent(long bIndent) {
		this.bIndent = bIndent;
	}

	
	
}