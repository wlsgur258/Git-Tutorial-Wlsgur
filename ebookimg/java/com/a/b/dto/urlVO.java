package com.a.b.dto;

public class urlVO {
	private String name;
	private String pathname;
	private String tel;
	
	public urlVO() {
		System.out.println("urlVO의 생성자");
	}
	
	// 세가지의 변수를 동시에 받아주는 생성자 작성
	public urlVO(String name, String pathname, String tel) {
		System.out.println("---파라미터를 세개 받는 생성자---");
		this.name= name;
		this.pathname = pathname;
		this.tel = tel;
	}


	
	public String getPathname() {
		return pathname;
	}
	public void setPathname(String pathname) {
		System.out.println("---setPathname()---");
		this.pathname = pathname;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		System.out.println("---setTel()---");
		this.tel = tel;
	}

	public String geturlname() {
		return name;
	}

	public void seturlname(String name) {
		System.out.println("---seturlname()---");
		this.name = name;
	}

	
	
}
