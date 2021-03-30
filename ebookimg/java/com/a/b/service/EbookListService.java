package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BoardDao;
import com.a.b.dao.EDao;
import com.a.b.dto.Board;
import com.a.b.dto.Ebook;

public class EbookListService implements IBoarderService{
	
	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 5;

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		EDao dao = sqlSession.getMapper(EDao.class);
		ArrayList<Ebook> dtos = dao.ebookList();
		model.addAttribute("list", dtos);
		
	}
	
	public List<Ebook> selectList(int a,int z) throws SQLException{
		EDao dao = sqlSession.getMapper(EDao.class);
		ArrayList<Ebook> dtos =  dao.ebookList();
		return dtos.subList(a-1,z);
	}
	public MessageListViewEbookList getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		EDao dao = sqlSession.getMapper(EDao.class);
		int messageTotalCount = dao.ebookList().size();
		List<Ebook> messageList = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
			endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList = Collections.emptyList();
		}
		return new MessageListViewEbookList(messageList, messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}
	
	

}
