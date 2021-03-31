package com.a.b.dao;

import java.util.ArrayList;

import com.a.b.dto.Board;

public interface BoardDao {


	public void boardWrite(
			 final String bId,
			 final String bTitle,
			 final String bContent,
			 final String bBurl
			);
	
	
	public ArrayList<Board> boardList();
	
	
	public void boardModify(
			final long bBid,
			final String bTitle,
			final String bContent,
			final String bBurl
			);
	
	
	public void boardDelete(final long strBID);
	
	public Board boardContent_view(long strBID);
	
	public void upHit(final long bBid);
	
	public ArrayList<Board> titlesearch(final String bTitle);
	public ArrayList<Board> contentsearch(final String bContent);
	public ArrayList<Board> idsearch(final String bId);
	public ArrayList<Board> allsearch(final String bTitle);
}
