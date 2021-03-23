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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 목록</title>
</head>
<body>
	<%@ include file="adminpage.jsp"%>
	
	<div class= "container">
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
			
			<c:forEach items="${BookList}" var="BookList">
			<tr>	
				<th><c:out value="${BookList.bBookno}"/></th>
				<th>
				<img src="<spring:url value ='/resources/img/${BookList.bUrl}'/>" > 		
				</th>
				<th><c:out value="${BookList.bBookname}"/></th>
				<td><c:out value="${BookList.bContent}"/></td>
				<td><c:out value="${BookList.bWriter}"/></td>
				<td><c:out value="${BookList.bCategory}"/></td>	
				<td><a class = "btn btn-primary" href="AdminContent?bBookno=${BookList.bBookno}">수정</a></td>	
				<td><a class = "btn btn-primary" href="AdminDelete?bBookno=${BookList.bBookno}">삭제</a></td>
				
				<td></td>
				
			</tr>		
			</c:forEach>
			
		</table>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>



</body>
</html>