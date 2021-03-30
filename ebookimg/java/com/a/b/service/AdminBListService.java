package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.ui.Model;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import com.a.b.dao.BDao;
import com.a.b.dto.Ebook;

public class AdminBListService implements IBoarderService {

	private SqlSession sqlSession=Constant.sqlSession;
	public static final int messageCountPerPage = 7;
	public AdminBListService(){}

	
	@Override
	public void execute(Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		ArrayList<Ebook> dtos = dao.list();
		model.addAttribute("BookList",dtos);
		
		
	}

		public List<Ebook> selectList(int a,int z) throws SQLException{
			BDao dao =sqlSession.getMapper(BDao.class);
			ArrayList<Ebook> dtos =  dao.list();	
			return dtos.subList(a-1,z);
		}
	
	public  MessageListViewAdmin getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		BDao dao = sqlSession.getMapper(BDao.class);
		int messageTotalCount = dao.list().size();
		List<Ebook> messageList = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*messageCountPerPage+1;
			endRow = firstRow+messageCountPerPage-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList = Collections.emptyList();
		}
		return new MessageListViewAdmin(messageList,messageTotalCount,currentPageNumber,messageCountPerPage,firstRow,endRow);
	}
}
