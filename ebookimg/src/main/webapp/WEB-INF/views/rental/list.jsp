<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.a.b.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 목록</title>
</head>

<body>

<%@include file="../home.jsp"%>

<%
	String vo = (String)session.getAttribute("id");
	if (vo==null){
		vo = "GUEST";
	}
%>
	<div>
	<br/>
	<p>현재 접속자 ID = <%= vo %> </p>
		<form action="booksearch" method="post" align="center">
		<select name="searchType">
			<option value="all">전체</option>
			<option value="Bookname">제목</option>
			<option value="Publisher">출판사</option>
			<option value="Writer">저자</option>
			<option value="Category">카테고리</option>
		</select>
		<input type="text" name="search" size="55%">
		<input type="submit" value="검색">
	</form>
	<table border="1" width="45%" align="center">
	<tr>
	<th colspan="7">모든 도서 목록</th>
	</tr>
	<tr>
	
	</tr>
		<tr>
			<th>책번호</th>
			<th>책제목</th>
			<th>책내용</th>
			<th>책가격</th>
			<th>책저자</th>
			<th>출판사</th>
			<th>장르</th> 
		</tr>
			<%-- <c:forEach items="${list234}" var="dto123">
			<tr>
				<td>${dto123.bId}</td>
				<td>${dto123.bName}</td>
				
			</tr>
			</c:forEach> --%>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bBookno}</td>
				<td><a href ="ebookcontentview?bId=${dto.bBookname}">${dto.bBookname}</a></td>
				<td>${dto.bContent}</td>
				<td>${dto.bPrice}</td>
				<td>${dto.bWriter}</td>
				<td>${dto.bPublisher}</td>
				<td>${dto.bCategory}</td>
			</tr>
			</c:forEach>
	</table>
	</div>
</body>
</html>