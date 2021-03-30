package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BCommentDao;
import com.a.b.dto.BComment;

public class BCommentListService implements IBoarderService{
	
	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public BCommentListService() {}
	
	@Override
	public void execute(Model model) {
		
		BCommentDao dao = sqlSession.getMapper(BCommentDao.class);
		ArrayList<BComment> comment = dao.bcommentList();
		model.addAttribute("commentList", comment);
		
	}
	public List<BComment> selectList(int a,int z) throws SQLException{
		BCommentDao dao = sqlSession.getMapper(BCommentDao.class);
		ArrayList<BComment> comment =  dao.bcommentList();
		return comment.subList(a-1,z);
	}
	public MessageListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		BCommentDao dao = sqlSession.getMapper(BCommentDao.class);
		int messageTotalCount = dao.bcommentList().size();
		List<BComment> messageList1 = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
			endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList1 =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList1 = Collections.emptyList();
		}
		return new MessageListView(null, messageList1, messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}

}

