package com.a.b.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.a.b.dto.Ebook;

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
			final String bCategory);
	
	public Ebook contentview(long bBookno);
	
	
	
}

