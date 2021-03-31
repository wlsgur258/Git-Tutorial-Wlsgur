
package com.a.b.dto;

public class Bestbook {
	private String bBookname;
	private String bBcontent;
	private String bWriter;
	private String bPublisher;
	private String bCategory;
	private long coun;
	private String bUrl;
	
	
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
	public String getbBcontent() {
		return bBcontent;
	}
	public void setbBcontent(String bBcontent) {
		this.bBcontent = bBcontent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbPublisher() {
		return bPublisher;
	}
	public void setbPublisher(String bPublisher) {
		this.bPublisher = bPublisher;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}
	public long getCoun() {
		return coun;
	}
	public void setCoun(long coun) {
		this.coun = coun;
	}
	@Override
	public String toString() {
		return "Bestbook [bBookname=" + bBookname + ", bBcontent=" + bBcontent + ", bWriter=" + bWriter
				+ ", bPublisher=" + bPublisher + ", bCategory=" + bCategory + ", coun=" + coun + ", bUrl=" + bUrl + "]";
	}

	
	
}



	

