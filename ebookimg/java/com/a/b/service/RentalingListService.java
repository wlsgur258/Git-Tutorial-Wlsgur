package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.a.b.dao.EDao;
import com.a.b.dto.RentalList;
import com.a.b.dto.RentalingList;

public class RentalingListService implements IBoarderService {
	
	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 5;
		
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		String ok = (String)session.getAttribute("id");
		if(ok==null) {
			
		}else {
		System.out.println(ok);
		EDao dao = sqlSession.getMapper(EDao.class);
		dao.ebookRentalOverListDelete(ok); // 렌탈링리스트접근시 기간지난거 삭제하고
		
		ArrayList<RentalingList> dtos = dao.ebookRentalingList(ok);
		model.addAttribute("rentalinglist", dtos); // 기간지난거없어진걸 가져온다
		}

	}
	
	public List<RentalingList> selectList(int a,int z) throws SQLException{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String ok = (String)session.getAttribute("id");
		
		
		EDao dao = sqlSession.getMapper(EDao.class);
		List<RentalingList> dtos =  dao.ebookRentalingList(ok);
		return dtos.subList(a-1,z);
	
	}
	
	public MessageListViewEbookRentalingList getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String ok = (String)session.getAttribute("id"); // 에러
		System.out.println("getmessage:"+ok);
		
		
		EDao dao = sqlSession.getMapper(EDao.class);
		if(ok==null) {
			List<RentalingList> messageList = null;
			messageList = Collections.emptyList();
			int messageTotalCount = 0;
			int firstRow =0;
			int endRow =0;
			return new MessageListViewEbookRentalingList
					(messageList, messageTotalCount,currentPageNumber,
							MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
		}
		
		int messageTotalCount = dao.ebookRentalingList(ok).size();
		List<RentalingList> messageList = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
			endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList = selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			//messageList = Collections.emptyList();
		}
		System.out.println("체크서비스내부라스트");
		return new MessageListViewEbookRentalingList(messageList, messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}
	

}
