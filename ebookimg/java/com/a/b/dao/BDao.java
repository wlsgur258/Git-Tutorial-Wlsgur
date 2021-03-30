package com.a.b.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.a.b.dto.Ebook;
import com.a.b.dto.Member;

public interface BDao {

public ArrayList<Ebook> list();
	
	public void modify(final long bBookno,final String bBookname, final String bContent, final long bPrice, final String bWriter, final String bPublisher, final String bCategory);
	
	public void delete(final long bBookno);
	
	public void upHit(final long bBookno);
	
	public void write(final String bBookname,
			final String bUrl,
			final String bContent,
			final long bPrice,
			final String bWriter,
			final String bPublisher,
			final String bCategory, 
			final String bRealContent);
	
	public Ebook contentview(long bBookno);
	
	public ArrayList<Member> Memberlist();
	
	public List<Map<String, String>> retrieveStatisticsForBookPublisher();
	
}

