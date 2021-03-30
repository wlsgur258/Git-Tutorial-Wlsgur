package com.a.b.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.a.b.dao.EDao;
import com.a.b.dto.RentalList;

public class RentalListService implements IBoarderService {
	private SqlSession sqlSession = Constant.sqlSession;
		@Override
		public void execute(Model model) {
			
				//HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
				
			
				HttpSession session = request.getSession();
				String ok = (String)session.getAttribute("id"); // 에러
				
				EDao dao = sqlSession.getMapper(EDao.class);
				System.out.println(ok);
				
				if (ok==null) {
					System.out.println("id값이 null이라 암것도안하고서비스탈출");
				}else {
				ArrayList<RentalList> dtos = dao.ebookRentalList(ok);
				System.out.println("서비스 내부로 가는중...");
				model.addAttribute("rentallist", dtos);
				}
				
		}

}
