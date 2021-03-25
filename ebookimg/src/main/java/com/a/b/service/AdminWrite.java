package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BDao;

public class AdminWrite implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		
		
		
		
		
		
		
    
    

   
	
		
	//	MultipartRequest multi = new MultipartRequest(request, "" , 1024 * 500 ,"utf-8",new DefaultFileRenamePolicy());
			
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Map<String, Object> map = model.asMap();
	HttpServletRequest request = (HttpServletRequest) map.get("request");
	
		//MultipartRequest multi=new MultipartRequest(request,"C:\\upload\\tmp", "utf-8", "MS949",new DefaultFileRenamePolicy());
		
		
		String bBookname = request.getParameter("bBookname");
		
		String bUrl =request.getParameter("bUrl");
		
		String bContent = request.getParameter("bContent");
		
		long bPrice =Long.parseLong(request.getParameter("bPrice"));
		
		String bWriter =request.getParameter("bWriter");
		
		String bPublisher = request.getParameter("bPublisher");
		
		String bCategory = request.getParameter("bCategory");
		
	
		BDao dao = sqlSession.getMapper(BDao.class);
		
		
		
		
		
		dao.write(bBookname, bUrl ,bContent, bPrice, bWriter, bPublisher, bCategory);
		
	}

}
