package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.a.b.dao.EDao;
import com.a.b.dto.Ebook;
import com.a.b.dto.RentalList;

public class RentalListService implements IBoarderService {
	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 5;
	public RentalListService() {}
	
		String ok;
		@Override
		public void execute(Model model) {
			
				//HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				
			
				HttpSession session = request.getSession();
				ok = (String)session.getAttribute("id"); // 에러
				
				EDao dao = sqlSession.getMapper(EDao.class);
				System.out.println(ok);
				
				if (ok==null) {
					System.out.println("id값이 null이라 암것도안하고서비스탈출");
				}else {
				List<RentalList> dtos = dao.ebookRentalList(ok);
				System.out.println("서비스 내부로 가는중...");
				model.addAttribute("rentallist", dtos);
				}
				
		}
		
		public List<RentalList> selectList(int a,int z) throws SQLException{
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession session = request.getSession();
			String ok = (String)session.getAttribute("id"); // 에러
			
					
			EDao dao = sqlSession.getMapper(EDao.class);
			List<RentalList> dtos =  dao.ebookRentalList(ok);
			return dtos.subList(a-1,z);
		
		}
		
		public MessageListViewEbookRentalList getMessageListView(int pageNumber) throws SQLException{
			int currentPageNumber = pageNumber;
			
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession session = request.getSession();
			String ok = (String)session.getAttribute("id"); // 에러
			System.out.println("getmessage123:"+ok);
			
			
			EDao dao = sqlSession.getMapper(EDao.class);
			if(ok==null) {
				List<RentalList> messageList = null;
				messageList = Collections.emptyList();
				int messageTotalCount = 0;
				int firstRow =0;
				int endRow =0;
				return new MessageListViewEbookRentalList
						(messageList, messageTotalCount,currentPageNumber,
								MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
			}
			
			
			int messageTotalCount = dao.ebookRentalList(ok).size();
			System.out.println("messageTotalCount:"+messageTotalCount);
			
			List<RentalList> messageList = null;
			int firstRow =0;
			int endRow =0;
			if(messageTotalCount>0){
				firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
				endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
				if(endRow>messageTotalCount)endRow=messageTotalCount;
				messageList = selectList(firstRow,endRow);
			}else{
				currentPageNumber =0;
				messageList = Collections.emptyList();
			}
			return new MessageListViewEbookRentalList
					(messageList, messageTotalCount,currentPageNumber,
							MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
		}

}
