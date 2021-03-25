package com.a.b.dao;

import java.util.ArrayList;

import com.a.b.dto.Comment;

public interface CommentDao {
	
	public void commentWrite(
				final String bId,
				final String cContent
			);
	
	public ArrayList<Comment> commentList();
	
	public void commentModify(
			final long bCid,
			final long bBid,
			final String bId,
			final String cContent
			);
	
	public void commentDelete(final long strBID);
	
	public Comment commentContent_view(long strBID);
	
}
