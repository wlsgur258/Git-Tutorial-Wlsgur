<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.a.b.dao.EDao" %>
<%@ page import="com.a.b.dao.MDao" %>
<%@ page import="com.a.b.dto.urlVO" %>
<%@ page import="com.a.b.dto.RentalingList" %>
<%@ page import="com.a.b.service.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "java.text.DateFormat" %>
<%@ page import= "java.sql.Date" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<title>현재대여목록페이지</title>
<link rel="stylesheet" href="resources/css/main_css.css">






</head>
<body>

<style type="text/css">
#board, #pageForm, #searchForm {
	text-align: center;
}
<table style="text-align: center;">
</style>


<%@include file="../home.jsp"%>


<%

	String vo = (String)session.getAttribute("id"); 
	//세션설정한게 없으므로 "id"값에는 null이 들어가있다, 즉 vo는 null이 되버린다
	System.out.println("1");
	System.out.println(id); // 이건 위에서 불러들이는 home.jsp 파일이 GUEST로 만들어버린다
	System.out.println(vo);
	SimpleDateFormat formatT = new SimpleDateFormat ("yyyy년 MM월 dd일 HH시 mm분");
	
	//ArrayList<RentalingList> List = (ArrayList<RentalingList>)request.getAttribute("rentalinglist");
	%>
	
<%-- 
<%= request.getAttribute("rentalinglist") %>
<%= List.get(0).getbRentaldate() %> 이거 도서대출한거 없으면 에러남
<%= formatT.format(List.get(0).getbRentaldate()) %>
<%= List.size() %>
<%= List.get(0).getbId() %> --%>

<% if (id=="GUEST"){ %>
	<script>
		alert('로그인 후 이용가능합니다.');
		document.location.href="main";
	</script>
	<%}%>
<div>

<% 


WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(application);
urlVO adress = wac.getBean("url", urlVO.class);

request.setAttribute("ad1", adress);

	String pageNumberStr = request.getParameter("xpage");
	RentalingListService service = new RentalingListService();
	
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
		System.out.println(pageNumber);
		System.out.println("체크");
	MessageListViewEbookRentalingList viewData = service.getMessageListView(pageNumber);
	
	//List<RentalList> subList = viewData.getMessageList();
%>	
<%
	System.out.println(request.getAttribute("rentalinglist"));
	System.out.println("여까진오나");
	List<RentalingList> List = viewData.getMessageList();
	//ArrayList<RentalingList> List2 = List.get(0);
	
%>

<%-- <table border="1" align = "center">
	</tr>
		<tr>
			<th>대출기록번호</th>
			<th>회원아이디</th>
			<th>책번호</th>
			<th>대출한날짜</th>
			<th>대출기간만료예정일</th>
		</tr>
			<c:forEach items="${rentalinglist}" var="dto">
			<tr>
				<td>${dto.bRentalno}</td>
				<td>${dto.bId}</td>
				<td>${dto.bBookno}</td>
				<td>${dto.bRentaldate}</td>
				<td>${dto.bReturndate}</td>
			</tr>
			</c:forEach>
</table> --%>
	
	<p><br><h1 align = "center">회원님이 현재 대여중인 책 목록</h1><br></p>
	
	<table border="1" align="center" class="table table-dark table-striped table-hover">
	<tr>
	</tr>
		<tr align="center">
			<th>번호</th>
			<th>이미지</th>
			<th>대출기록번호</th>
			<th>아이디</th>
			<th>책번호</th>
			<th>제목</th>
			<th>대출날짜</th>
			<th>대출기간만료날짜</th>
		</tr>
			
<% try{
	int a = pageNumber*5-5;
	for(int i=0; i < List.size() ; i++)
		
	{
	a++;
	%>
			<tr align="center">
			<td><%= a %></td>
			<td>
			<img src="${ ad1.urlname }/ebook/<%= List.get(i).getbUrl() %>"
			height="80" >
			</td>
	<td><%= List.get(i).getbRentalno() %></td>
	<td><%= List.get(i).getbId() %></td>
	<td><%= List.get(i).getbBookno() %></td>
	<% String goname = List.get(i).getbBookname(); %>
	<td>
	<a href = "ebookcontentview?bId=<%= goname %>">
	<%= List.get(i).getbBookname() %>
	</a>
	</td>
	<td><%= formatT.format(List.get(i).getbRentaldate()) %></td>
	<td><%= formatT.format(List.get(i).getbReturndate()) %></td>
			</tr>
	<%}
	} catch (Exception e){
	System.out.println("에러처리");
	}%>
				
	</table>
	
	</div>
	
	<!-- 페이지 넘버 부분 -->
		<br>
		<div id="pageForm" >
			
				<% if(pageNumber>10){
			int tenNum2 = pageNumber / 10;
			if(pageNumber % 10 == 0 && pageNumber > 9)tenNum2 -= 1;
			%>
				<a href="rentalinglist?xpage=<%=(tenNum2*10)-9%>">[이전]</a>
				<% } %>
			
			<%
			//System.out.println(pageNumber);
			//System.out.println(viewData.getPageTotalCount());
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
				
				int tenNum = pageNumber / 10;
				if(pageNumber % 10 == 0 && pageNumber > 9)tenNum -= 1;
				if(viewData.getPageTotalCount()==i+(tenNum*10-1))break;
				
				if(11>i){%>
				<a href="rentalinglist?xpage=<%=i+(tenNum*10)%>">[<%=i+(tenNum*10)%>]</a>
				<%
				}else{
				%>
				<a href="rentalinglist?xpage=<%=i+(tenNum*10)%>">[다음]</a>
				<% break;
				}
			}
			%>
		</div>
		<p><br></p>
	
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
</body>
</html>
