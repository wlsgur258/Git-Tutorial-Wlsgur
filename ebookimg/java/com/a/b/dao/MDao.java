package com.a.b.dao;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import com.a.b.dto.Member;
public interface MDao {
	public Member memberView(String bid);
	public void memberJoin( 
			final String bId,
			final String bPw,
			final String bName,
			final String bGender,
			final Date bBirthday,
			final Timestamp bJoindate
	);
	public ArrayList<Member> memberList();
	public void memberModify( 
			final String bPw,
			final String bName,
			final String bId
	);
	public void memberRemove(final String bid);
	public void memberExit(final String bid);
	public Member Id_Check(String bid);
	public void cashupdown(
			final String bid,
			final long bcash);
	
	public String idsearch(
			final String bname,
			final Date bBirthday);
	
	public String passwordsearch(
			final String bid,
			final String bname,
			final Date bBirthday);
	
	
}

