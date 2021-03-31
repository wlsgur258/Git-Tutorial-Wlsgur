package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BoardDao;
import com.a.b.dto.Board;

public class AdminBoardListService implements IBoarderService{

	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 5;
	public AdminBoardListService() {}
	
	@Override
	public void execute(Model model) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<Board> board = dao.boardList();
		model.addAttribute("boardList", board);
		
	}
	public List<Board> selectList(int a,int z) throws SQLException{
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<Board> board =  dao.boardList();
		return board.subList(a-1,z);
	}
	public MessageListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int messageTotalCount = dao.boardList().size();
		List<Board> messageList = null;
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
		return new MessageListView(messageList, null, messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}
 
}
