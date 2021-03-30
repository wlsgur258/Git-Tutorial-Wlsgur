package com.a.b.dao;

import java.util.ArrayList;

import com.a.b.dto.BComment;

public interface BCommentDao {
	
	public void bcommentWrite(
				final String bId,
				final String bContent
			);
	
	public ArrayList<BComment> bcommentList();
	
	public void bcommentModify(
			final long bCid,
			final String bId,
			final String bContent
			);
	
	public void bcommentDelete(final long strCID);
	
	public BComment bcommentContent_view(long strCID);
	
}
