<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ page import="com.a.b.dto.*"%>
<%@ page import="com.a.b.dao.*"%>
<%@ page import="com.a.b.service.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>책 목록</title>
<style>
.container {

text-align: center;

}
</style>
<link href="/b/css1/bootstrap.min.css" rel="stylesheet">
<link href="/b/css1/bootstrap-theme.css" rel="stylesheet">
<link href="/b/css1/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/b/css1/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="/b/css1/sb-admin-2.css" rel="stylesheet">
<link href="/b/css1/morris.css" rel="stylesheet">	

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="adminpageTop.jsp"%>
	
	
	<%-- <% 
		 Member vo = (Member)session.getAttribute("joinVo");
	 		if(vo==null) {	
	%>
	<script>
	alert("새션만료");
	document.location.href="main";
	</script> --%>
	
	<%
	
		String pageNumberStr = request.getParameter("xpage");
		AdminBListService service = new AdminBListService();
		//BDao dao = sqlSession.getMapper(BDao.class);
		//BDao dao = new BDao();
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		MessageListViewAdmin viewData = service.getMessageListView(pageNumber);
		int totalPages = viewData.getPageTotalCount();
		if (pageNumberStr == null)
		pageNumberStr = "1";
	
		List<Ebook> subList = viewData.getMessageList();
		 %>
	
	<div class="container">
		<h1> 도서 관리</h1>	
		<hr>
		<div align="right">
		<a class = "btn btn-primary" href="Adminwrite_view">책추가</a>
	</div>
		<table class = "table table-striped">
			<tr>
				<th>번호</th>
			 	<th>사진</th>
				<th>제목</th>
				<th>소개</th>
				<th>저자</th>
				<th>카테고리</th>
				<th>수정</th>
				<th>삭제</th>
				
			</tr>
			
			 <%-- <c:forEach items="${subList}" var="BookList">  --%>
			<c:forEach items="<%=subList%>" var="BookList">
			<tr>	
				<th><c:out value="${BookList.bBookno}"/></th>
				<th>
				<img src="<spring:url value ='http://121.153.134.167/ebook/${BookList.bUrl}'  />" height="50" >		
				</th>
				<th><c:out value="${BookList.bBookname}"/></th>
				<td><c:out value="${BookList.bContent}"/></td>
				<td><c:out value="${BookList.bWriter}"/></td>
				<td><c:out value="${BookList.bCategory}"/></td>	
				<td><a class = "btn btn-primary" href="AdminContent?bBookno=${BookList.bBookno}">수정</a></td>	
				<td><a class = "btn btn-primary" href="AdminDelete?bBookno=${BookList.bBookno}">삭제</a></td>
				
			
				
			</tr>		
			</c:forEach>
		</table>
	
	<br/>
	<br/>
	
	<div align="center">
	Page<% 
	for (int i= 1; i<= viewData.getPageTotalCount(); i++) {	
	%>
		<a href = "AdminBookList?xpage=<%=i%>">[<%=i%>]
		</a>
	<% 	
		}
	
	 %>	

 
<%@ include file="foot.jsp"%>
	</div>
</div>
</body>
</html>