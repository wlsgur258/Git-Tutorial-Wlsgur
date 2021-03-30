package com.a.b.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.a.b.service.IBoarderService;
import com.a.b.service.MDeleteService;
import com.a.b.service.MModifyService;
import com.a.b.service.RentalListService;
import com.a.b.service.RentalingListService;
import com.a.b.service.textService;
import com.a.b.service.AdminBListService;
import com.a.b.service.AdminContentService;
import com.a.b.service.AdminDeleteService;
import com.a.b.service.AdminMemberListService;
import com.a.b.service.AdminModifyService;

import com.a.b.service.BoardContentService;
import com.a.b.service.BoardDeleteService;
import com.a.b.service.BoardListService;
import com.a.b.service.CommentDeleteService;
import com.a.b.service.CommentModifyService;
import com.a.b.service.CommentWriteService;
import com.a.b.service.Constant;
import com.a.b.service.EbookListService;
import com.a.b.service.EbookListService2;
import com.a.b.dao.BDao;
import com.a.b.dao.BoardDao;
import com.a.b.dao.EDao;
import com.a.b.dao.MDao;
import com.a.b.dto.Ebook;
import com.a.b.dto.Member;
import com.a.b.dto.RentalingList;


/**
 * Handles requests for the application home page.
 */
@Controller // css 적용 이후 대여시 팝업창 활성화 적용 및 코인충전 
public class HomeController {
	
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	IBoarderService service;
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request", request);
		model.addAttribute("locale", locale);
		EDao dao = sqlSession.getMapper(EDao.class);
		ArrayList<Ebook> ebook = dao.newebook();
		session.setAttribute("newbook", ebook);
		ArrayList<Ebook> bestbook = dao.bestbook();
		session.setAttribute("bestbook", bestbook);
		model.addAttribute("session",session);
		return "main";
	}
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(Locale locale, Model model, HttpServletRequest request) {
		return "main";
	}
	
	
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		
		service = new BoardListService();
		service.execute(model);
		
		return "board/boardList";
		
	}
	
	@RequestMapping("/boardWrite_view")
	public String boardWrite_view(Model model) {
		
		return "board/boardWrite_view";
	}
	
	
	
	@RequestMapping("/commentWrite")
	public String commentWrite(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service = new CommentWriteService();
		service.execute(model);
		
		return "redirect:boardContent_view";
	}
	
	@RequestMapping("/boardContent_view")
	public String boardContent_view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		service = new BoardContentService();
		service.execute(model);
		return "board/boardContent_view";
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		service = new BoardDeleteService();
		service.execute(model);
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/commentModify")
	public String commentModify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		service = new CommentModifyService();
		service.execute(model);
		
		return "redirect:boardContent_view";
	}
	
	@RequestMapping("/commentDelete")
	public String commentDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		service = new CommentDeleteService();
		service.execute(model);
		
		return "redirect:boardContent_view";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ID_Check", produces="text/plane")
	public String ID_Check(@RequestBody String paramData) {
		String bid = paramData.trim();
		MDao dao = sqlSession.getMapper(MDao.class);
		Member dto = dao.Id_Check(bid);
		if(dto != null) {
			return "-1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value = "/login")
	public String flogin(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		return "login/login";
	}
	@RequestMapping(value="logindo", method=RequestMethod.POST)
	public void memberLogin(@RequestParam("userId") String userId,
							@RequestParam("userPwd") String userPwd,
							HttpServletResponse response, HttpSession session,
							Model model) throws IOException{
		Member member = new Member() ;
		member.setbId(userId);
		member.setbPw(userPwd);
		MDao dao = sqlSession.getMapper(MDao.class);
		Member loginUser = dao.memberView(userId);
			if(member.getbPw().equals(loginUser.getbPw())) {
				model.addAttribute("request", loginUser);
				int cash = (int) loginUser.getbCash();
				session.setAttribute("id", userId);
				session.setAttribute("pw", userPwd);
				session.setAttribute("loginOk","ok");
				session.setAttribute("joinVo", loginUser);
				session.setAttribute("cash", cash);
				
				model.addAttribute("session", session);
				response.getWriter().print(true) ;
			} else {
				response.getWriter().print(false) ;
			}
	}
	
	
	@RequestMapping(value="/idSearch")
	public String idsearch(HttpServletRequest request, Model model) {
		return "login/idsearch";
	}
	@RequestMapping(value="/idsearchdo", method=RequestMethod.POST)
	public void idsearchdo(@RequestParam("name") String name, @RequestParam("birthday") Date birthday,
			HttpServletResponse response, HttpSession session, Model model) throws IOException {
		MDao dao = sqlSession.getMapper(MDao.class);
		Member member = new Member();
		member.setbName(name);
		member.setbBirthday(birthday);
		String searchID = dao.idsearch(name, birthday);
		if(!searchID.equals(null)) {
			session.setAttribute("searchID", searchID);
			model.addAttribute("session", session);
			response.getWriter().print(true) ;
		}else {
			response.getWriter().print(false) ;
		}
	}
	@RequestMapping(value="/id&pwsearch")
	public String idpwsearch(HttpServletRequest request, Model model, HttpSession session) {
		return "login/id&pwsearch";
	}
	@RequestMapping(value="/pwsearchdo", method=RequestMethod.POST)
	public void pwsearchdo(@RequestParam("pname") String pname, @RequestParam("pbirthday") Date pbirthday,
			@RequestParam("bid") String bid, HttpServletResponse response, HttpSession session, Model model) throws IOException {
		MDao dao = sqlSession.getMapper(MDao.class);
		Member member = new Member();
		member.setbName(pname);
		member.setbBirthday(pbirthday);
		member.setbId(bid);
		String searchPW = dao.passwordsearch(bid, pname, pbirthday);
		if(!searchPW.equals(null)) {
			session.setAttribute("searchID", searchPW);
			model.addAttribute("session", session);
			response.getWriter().print(true) ;
		}else {
			response.getWriter().print(false) ;
		}
	}
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
//		session.removeAttribute("no");
//		session.removeAttribute("id");
//		session.removeAttribute("pw");
//		session.removeAttribute("loginOk");
//		session.removeAttribute("joinVo");
//		session.removeAttribute("cash");
		session.invalidate();
		System.out.println("로그아웃.세션초기화");
		return "redirect:main";
	}

	
	@RequestMapping(value = "/memberjoin")
	public String memberJoin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return "member/memberjoin";
	}
	@RequestMapping("/memberdo")
	public String memberok(HttpServletRequest request, Model model, HttpSession session) {
		MDao dao = sqlSession.getMapper(MDao.class);
		String bId = request.getParameter("mid");
		Member vo = dao.memberView(bId);
		
		if (!(vo == null)) {
			System.out.println(bId + "회원가입 실패");
			return "main";
		} else {
			String bName = request.getParameter("name");
			String bPw = request.getParameter("password");
			String bGender = request.getParameter("gender");
			Date bBirthday = Date.valueOf(request.getParameter("birthday"));
			Timestamp bJoindate = new Timestamp(System.currentTimeMillis());
			
			if (!bPw.equals(request.getParameter("password2"))) {
				System.out.println(bId + "패스워드가 다릅니다.");
			} else {
				
				try {
					dao.memberJoin(bId, bPw, bName, bGender, bBirthday, bJoindate);
					System.out.println(bId + " 회원 가입완료");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(bId + " 회원 가입 되지 않았습니다.");
				}
			}
			
		}
		return "redirect:main";
	}
	@RequestMapping("/memdata")
	public String memdata(Model model, HttpSession session) {
		return "member/memdata";
	}
	@RequestMapping("/memmodify")
	public String memmodify(Model model, HttpServletRequest request) {
		String bId = request.getParameter("bId");
		model.addAttribute("request", request);
		MModifyService service = new MModifyService();
		service.setbId(bId);
		service.execute(model);
		
		return "member/membermodify";
	}
	@RequestMapping(value="/memmodifydo", method = RequestMethod.POST)
	public String memmodifydo(HttpServletRequest request, Model model) {
		MDao dao = sqlSession.getMapper(MDao.class);
		HttpSession session = request.getSession();
		String bId = request.getParameter("bId");
		String bPw = request.getParameter("password");
		String bName = request.getParameter("name");
		Member member = dao.memberView(bId);
		if(bPw.equals(member.getbPw())) {
			dao.memberModify(bPw, bName, bId);
			session.removeAttribute("joinVo");
			Member remember = dao.memberView(bId);
			session.setAttribute("joinVo", remember);
			return "redirect:memdata";
		}else {
			dao.memberModify(bPw, bName, bId);
			session.invalidate();
			return "redirect:login";
		}
	}
	@RequestMapping("/memdelete")
	public String memdelete(HttpServletRequest request, Model model, HttpSession session) {
		model.addAttribute("request", request);
		service = new MDeleteService();
		service.execute(model);
		session.removeAttribute("id");
		session.removeAttribute("pw");
		session.removeAttribute("loginOk");
		session.removeAttribute("mainpage");
		session.removeAttribute("joinVo");
		
		return "redirect:main";
	}
	
	
	@RequestMapping("/adminpage")
	public String adminpage(HttpServletRequest request,Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		
		JSONArray jsonDonutArr = new JSONArray();
		JSONArray jsonBarArr = new JSONArray();
		
		List<Map<String,String>>  dsBookPublisher = dao.retrieveStatisticsForBookPublisher();
		JSONObject jsonObj = null;
		
		
		for(int i =0;  i<dsBookPublisher.size(); i++) {
			jsonObj = new JSONObject();
			String bookcategory = dsBookPublisher.get(i).get("BCATEGORY");
			String bookcategorycount = String.valueOf(dsBookPublisher.get(i).get("B_CATEGORY_COUNT"));
			
			jsonObj.put("label", bookcategory);
			jsonObj.put("value", bookcategorycount);
			
			jsonDonutArr.add(jsonObj);
			
			jsonObj = new JSONObject();
			
			jsonObj.put("y", bookcategory);
			jsonObj.put("a", bookcategorycount);
			
			jsonBarArr.add(jsonObj);
			
		}
		
		model.addAttribute("objDonut",jsonDonutArr);
		model.addAttribute("objBar",jsonBarArr);
		
		//ArrayList<Ebook> list = dao.list(); 
//		
//		  // 가져온 데이터를 화면에 표시 해야한다. String data = "["; for (Ebook x : list) { data +=
//		  "['"; data += x.getbCategory(); data += "'],";
//		  
//		  }
//		  
//		  // 마지막 콤마 제거 data = data.substring(0, data.length() -1); data +="]";
//		  
//		  
//		  model.addAttribute("data",data);
//		 
		
		return "admin/adminpage";
	}
	
	
	@RequestMapping("/cashup")
	public String cashup(HttpServletRequest request, Model model, HttpSession session) {
		return "cashup";
	}
	@RequestMapping("/cashupdo")
	public String cashupdo(HttpServletRequest request, Model model, HttpSession session) {
		MDao dao = sqlSession.getMapper(MDao.class);
		String bid = request.getParameter("bId");
		Member member = dao.memberView(bid);
		long bcash = Long.parseLong(request.getParameter("bCash"));
		long brecash = member.getbCash() + bcash;
		dao.cashupdown(bid, brecash);
		session.removeAttribute("joinVo");
		Member remember = dao.memberView(bid);
		session.setAttribute("joinVo", remember);

		int newCash = (int) remember.getbCash();
		session.removeAttribute("cash");
		session.setAttribute("cash", newCash);
		

		return "redirect:cashup";
	}
	@RequestMapping(value="/booksearch", method=RequestMethod.POST)
	public String bookSearch(HttpServletRequest request, Model model,HttpSession session) {
		EDao dao = sqlSession.getMapper(EDao.class);
		String searchRe = request.getParameter("searchType");
		String search = request.getParameter("search");
		if(searchRe.equals("Bookname")) {
			ArrayList<Ebook> ebook = dao.namesearch(search);
			session.setAttribute("sear_result", ebook);
			model.addAttribute("session", session);
		}else if(searchRe.equals("Publisher")) {
			ArrayList<Ebook> ebook = dao.publishersearch(search);
			session.setAttribute("sear_result", ebook);
			model.addAttribute("session", session);
		}else if(searchRe.equals("Writer")) {
			ArrayList<Ebook> ebook = dao.writersearch(search);
			session.setAttribute("sear_result", ebook);
			model.addAttribute("session", session);
		}else if(searchRe.equals("Category")) {
			ArrayList<Ebook> ebook = dao.categorysearch(search);
			session.setAttribute("sear_result", ebook);
			model.addAttribute("session", session);
		}else if(searchRe.equals("all")) {
			ArrayList<Ebook> ebook = dao.allsearch(search);
			session.setAttribute("sear_result", ebook);
			model.addAttribute("session", session);
		}
		return "searchlist";
	}
	
	
	@RequestMapping("/AdminBookListSearch")
	public String AdminBookListSearch(Model model) {
		
		 //service = new AdminBListService(); s
		 //ervice.execute(model);
		
		return null;
	
	}
	
	
	
	@RequestMapping("/AdminBookList")
	public String AdminBookList(Model model) {
		
		service = new AdminBListService();
		service.execute(model);
		
		return "admin/AdminBookList";
	
	}
	
	
	
	@RequestMapping("/Adminmodify")
	public String AdminModify(Model model, HttpServletRequest request) {
		model.addAttribute("request",request);
			
		service = new AdminModifyService();
		service.execute(model);
		
		return "redirect:AdminBookList";
	}
	
	
	
	@RequestMapping("/AdminDelete")
	public String delete(HttpServletRequest request, Model model) {
		

		model.addAttribute("request", request);
		service = new AdminDeleteService();
		service.execute(model);
		return "redirect:AdminBookList";
	}
	
	@RequestMapping(method =  RequestMethod.POST, value = "/boardModify")
	public String boardModify(MultipartHttpServletRequest multi, Model model) {
		MultipartFile uploadFile = multi.getFile("file");
		
		 UUID uuid = UUID.randomUUID();
		
		System.out.println(uploadFile.getOriginalFilename());
		
		
		//String fileName = uploadFile.getOriginalFilename();
		String fileName = uuid+"_"+uploadFile.getOriginalFilename();
		
		
		System.out.println(fileName+"파일네임이다");
		
		
		//String Realpath = multi.getSession().getServletContext().getRealPath("/resources/ebook/");
		
		String Realpath = "C:/Users/pc346/Desktop/useEbook/";
				
		//http://121.153.134.167/ebook/ebook9.png
		
		if(!uploadFile.isEmpty()) {
			//if(!uploadFile.isEmpty()) {
			File file = new File(Realpath, fileName);
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("실패1");
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("실패2");
			}
		}
		
		long bBid = Long.parseLong(multi.getParameter("bBid"));
		String bTitle = multi.getParameter("bTitle");
		String bContent = multi.getParameter("bContent");
		String bBurl = fileName;
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.boardModify(bBid, bTitle, bContent, bBurl);
		
		return "redirect:boardList";
	}
	
	//책 추가
	
	@RequestMapping(value = "/boardWrite",method=RequestMethod.POST)
	public String boardWrite(MultipartHttpServletRequest multi, Model model) {
		
		MultipartFile uploadFile = multi.getFile("file");
		
		UUID uuid = UUID.randomUUID();
		
		System.out.println(uploadFile.getOriginalFilename());
		
		
		//String fileName = uploadFile.getOriginalFilename();
		//if 
		String fileName = uuid+"_"+uploadFile.getOriginalFilename();
		
		
		System.out.println(fileName+"파일네임이다");
		
		
		//String Realpath = multi.getSession().getServletContext().getRealPath("/resources/ebook/");
		
		String Realpath = "C:/Users/pc346/Desktop/useEbook/";
				
		//http://121.153.134.167/ebook/ebook9.png
		
		if(!uploadFile.isEmpty()) {
			//if(!uploadFile.isEmpty()) {
			File file = new File(Realpath, fileName);
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("실패1");
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("실패2");
			}
		}
		
		String bId = multi.getParameter("bId");
		String bTitle = multi.getParameter("bTitle");
		String bContent = multi.getParameter("bContent");
		String bBurl = fileName;
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.boardWrite(bId, bTitle, bContent, bBurl);
		
		return "redirect:boardList";
	}
	
		@RequestMapping(value = "/Adminwrite",method=RequestMethod.POST)
		public String AdminWrite(MultipartHttpServletRequest multi, Model model){
		//	eb.setbUrl(bUrl.getOriginalFilename());
			
			MultipartFile uploadFile = multi.getFile("file");
			MultipartFile uploadFile2 = multi.getFile("file_text");
			
			 UUID uuid = UUID.randomUUID();
			
			System.out.println(uploadFile.getOriginalFilename());
			System.out.println(uploadFile2.getOriginalFilename());
			
			
			//String fileName = uploadFile.getOriginalFilename();
			String fileName = uuid+"_"+uploadFile.getOriginalFilename();
			//String fileName2 =uploadFile2.getOriginalFilename();
			String fileName2 = uuid+"_"+uploadFile2.getOriginalFilename();
			
			
			System.out.println(fileName+"파일네임이다");
			System.out.println(fileName2+"파일네임2이다");
			
			
			//String Realpath = multi.getSession().getServletContext().getRealPath("/resources/ebook/");
			
			String Realpath = "C:/Users/pc346/Desktop/useEbook/";
					
			//http://121.153.134.167/ebook/ebook9.png
			
			if(!uploadFile.isEmpty() && !uploadFile2.isEmpty()) {
				//if(!uploadFile.isEmpty()) {
				File file = new File(Realpath, fileName);
				File file2 = new File(Realpath, fileName2);
				try {
					uploadFile.transferTo(file);
					uploadFile2.transferTo(file2);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("실패1");
				
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("실패2");
				}
			}

			
			//model.addAttribute("multi",multi);
			//service = new AdminWrite()
			 
			String bBookname = multi.getParameter("bBookname");

			String bUrl = fileName;
		
			String bRealContent = fileName2;
			
			System.out.println(bRealContent+"DB에 넣을 값 입니다");
			
			String bContent = multi.getParameter("bContent");
			
			long bPrice =Long.parseLong(multi.getParameter("bPrice"));
			
			String bWriter =multi.getParameter("bWriter");
			
			String bPublisher = multi.getParameter("bPublisher");
			
			String bCategory = multi.getParameter("bCategory");
			
		
			BDao dao = sqlSession.getMapper(BDao.class);
			
	
			dao.write(bBookname, bUrl ,bContent, bPrice, bWriter, bPublisher, bCategory, bRealContent);
			
		

		
			
			
		//	service.execute(model);
			
			return "redirect:AdminBookList";
	
	//	MultipartFile mf = request.getFile("file");
		
	//	String path = "C:/img/";
		

			 
			 
			 
			//model.addAttribute("multipartFile",multipartFile);	
		
		//service.execute(model);
		
		

//			  cmf = (CommonsMultipartFile) files.get("file"); String path
//			  ="J:/springworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ebook()/resources/img/"
//			  +cmf.getOriginalFilename();	 
//			  File f = new File(path); cmf.transferTo(f);
			 
			
			 

			
		//	Map<String, MultipartFile> files = request.getFileMap();
			//MultipartHttpServletRequest files1 =  (MultipartHttpServletRequest) files.get(file);
			
				//MultipartRequest multi=new MultipartRequest(request,"C:\\upload\\tmp", "utf-8", "MS949",new DefaultFileRenamePolicy());
				
		
				
			
			
		//model.addAttribute("request",request);


			
	//	service = new AdminWrite();
		//service.execute(model);
		

					
		}
	
	
		// 글 추가 화면
		
		@RequestMapping("/Adminwrite_view")
		public String write_view(Model model) {
			return "./admin/Adminwrite_view";
		}
	
	
	
		@RequestMapping("/AdminContent")
		public String AdminContent(Model model, HttpServletRequest request) {
			model.addAttribute("request", request);
			service = new AdminContentService();
			service.execute(model);
			return "./admin/Admincontent_view";
		}
		
		@RequestMapping("/AdminMemberList")
		public String AdminMemberList(Model model) {
			
		service = new AdminMemberListService();
		service.execute(model);
		return "./admin/AdminMemberView";
		}
		
		
		
	
	///// ebook 리스트게시판
		
		@RequestMapping("/list")
		public String list(Model model, HttpSession session) {
			
			String ok = (String)session.getAttribute("id");
			System.out.println(ok);
			System.out.println("기본 북리스트 접근...");
			if(ok != null) { // 로그인 상태로 북리스트 접근시
				
				EDao dao = sqlSession.getMapper(EDao.class);
				dao.ebookRentalOverListDelete(ok); 
				System.out.println("렌탈링리스트 최신화 완료");
				// 북리스트접근시 렌탈링리스트에 기간지난거 삭제하고
			}
			
			System.out.println("list()");
			service = new EbookListService();
			service.execute(model);
			service = new EbookListService2();
			service.execute(model);
			
			
			return "./rental/list";
		}
		
		@RequestMapping("/rentallist")
		public String rentallist(Model model, HttpSession session) {
			
			String ok = (String)session.getAttribute("id");
			System.out.println(ok);
//			if (ok==null) { // if(ok.equals(null)) 하면 에러난다...
//				return "./rentallist";
//				}
//				EDao dao = sqlSession.getMapper(EDao.class);
//				ArrayList<RentalList> dtos = dao.ebookRentalList(ok);
//				model.addAttribute("rentallist", dtos);
//				return "./rentallist";
				
			service = new RentalListService();
			service.execute(model);
			return "./rental/rentallist";
		}
		
		@RequestMapping("/rentalinglist")
		public String rentallinglist(Model model, HttpSession session) {
			
//			String ok = (String)session.getAttribute("id");
//			if(ok==null) {
//				return "./rental/rentalinglist";
//			}
//			System.out.println(ok);
//			EDao dao = sqlSession.getMapper(EDao.class);
//			dao.ebookRentalOverListDelete(ok); // 렌탈링리스트접근시 기간지난거 삭제하고
//			
//			ArrayList<RentalingList> dtos = dao.ebookRentalingList(ok);
//			model.addAttribute("rentalinglist", dtos); // 기간지난거없어진걸 가져온다
			
			service = new RentalingListService();
			service.execute(model);
			
			return "./rental/rentalinglist";
		}
		
		@RequestMapping("/ebookcontentview")
			public String ebookcontentview(Model model, HttpServletRequest request, HttpSession session) {
			System.out.println("e북세부페이지시작");
			String memberbId = (String)session.getAttribute("id");
			System.out.println(memberbId);
			
			//model.addAttribute("request", request);
			String bBookname = request.getParameter("bId");
			System.out.println(bBookname);
			System.out.println("e북세부페이지-1");
			
			EDao dao = sqlSession.getMapper(EDao.class);
			Ebook dto = dao.ebookView(bBookname);
			int dto2 = dao.ebookHit(bBookname);
			if (memberbId!=null) {
			int dto3 = dao.ebookRentalingCheck(memberbId, bBookname);
			model.addAttribute("ebook_view3", dto3);
			}
			model.addAttribute("ebook_view", dto);
			model.addAttribute("ebook_view2", dto2);
			//service.execute(model);
			
			System.out.println("e북세부페이지-2");
			return "./rental/ebookcontentview";
		}
		
		@RequestMapping("/rentaldo")
			public String rentaldo(Model model, 
					HttpServletRequest request, 
					HttpSession session) 
					throws UnsupportedEncodingException {
			
			MDao dao = sqlSession.getMapper(MDao.class);
			System.out.println("렌탈두내부시작");
			
			long bBookno = Integer.parseInt(request.getParameter("bBookno1"));
			System.out.println(bBookno);
			
			String bId = request.getParameter("bId1");
			System.out.println(bId);
			
			String bBookname = request.getParameter("bBookname1");
			System.out.println(bBookname);
			
			long coin = Integer.parseInt(request.getParameter("cash1"));
			System.out.println(coin);
			
			if(coin >= 3) {
				
				EDao dao2 = sqlSession.getMapper(EDao.class);
				dao2.rentalCashdown(bId);// 캐쉬 3 감소한다...
				session.removeAttribute("cash"); //기존 "cash"세션 삭제
			
				Member member = dao.memberView(bId); // 멤버dao 통해
				int cash = (int) member.getbCash(); // 겟캐쉬 새롭게
				session.setAttribute("cash", cash); // 새션에 새롭게
			System.out.println(cash);
			System.out.println("여까진오나");
			System.out.println("깃허브실험용 추가문구");
				dao2.ebookRental(bId, bBookno);
				bBookname = URLEncoder.encode(bBookname, "UTF-8");
				return "redirect:./ebookcontentview?bId="+bBookname+"&Ryes="+"Ryes";
				//return "redirect:./ebookcontentview";
			} 
			else
				bBookname = URLEncoder.encode(bBookname, "UTF-8");
				return "redirect:./ebookcontentview?bId="+bBookname+"&Rno="+"Rno";
			}
		
		
		@RequestMapping(value="upload",method=RequestMethod.POST)


			public String upload(MultipartHttpServletRequest request) {
				//file 파라미터의 데이터 가져오기
				MultipartFile file=request.getFile("file");
				//파일 업로드
				String filepath="C:/Users/pc374/documents/uploadtest/";
				filepath=filepath+file.getOriginalFilename();
				
				try {
					file.transferTo(new File(filepath));
					System.out.println("업로드가 잘되는가?");
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("업로드 실패!");
				}
				return "redirect:./list";
			}
		
		@RequestMapping("/textdo")
		public String textdo(Model model, HttpServletRequest request) {
			
			String bno = request.getParameter("bBookno1");
			String bname = request.getParameter("bBookname1");
			EDao dao = sqlSession.getMapper(EDao.class);
			Ebook dto = dao.ebookView(bname);
			
			System.out.println("텍스트두:"+bno);
			
			model.addAttribute("ebook_text", dto);
			
			service = new textService(bno);
			service.execute(model);
			
			System.out.println("textdo 컨트롤러중asd");
			return "/rental/ebooktext";
			
		}
		
		
		
		}
	
	
	
