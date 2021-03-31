<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dto.*" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
	<%
		List<Ebook> book = (List<Ebook>)session.getAttribute("sear_result");
	%>
	<header>
	<%@include file="./home.jsp"%>
	</header>
	<br>
	<h1 align="center">검색결과</h1>
	<br/>
		<form action="booksearch" method="post" align="center">
		<select name="searchType">
			<option value="all">전체</option>
			<option value="Bookname">제목</option>
			<option value="Publisher">출판사</option>
			<option value="Writer">저자</option>
			<option value="Category">카테고리</option>
		</select>
		<input type="text" name="search" size="55%">
		<input type="submit" class="btn btn-primary" value="검색">
	</form>
	<br>
	<table border='1' width="70%" align="center" class="table table-dark table-striped table-hover">
	<%if(book.equals(null)){
		%>
		<h3 align="center">찾는 도서가 없습니다.</h3>
		<%
	}else{
		%>
	<tr align="center">
		<th>이미지</th>
		<th>타이틀</th>
		<th>저자</th>
		<th>카테고리</th>
		<th>출판사</th>
		<th>대여료</th>
	</tr>
			<c:forEach items="${sear_result}" var="search">
	<tr align="center">
		<td><img src="<spring:url value ='http://121.153.134.167/ebook/${search.bUrl}'/>" height="100"></td>
		<td align="center"><a href="ebookcontentview?bId=${search.bBookname}">${search.bBookname}</a></td>
		<td align="center">${search.bWriter}</td>
		<td align="center">${search.bCategory}</td>
		<td align="center">${search.bPublisher}</td>
		<td align="center">${search.bPrice}</td>
	</tr>
	</c:forEach>
	</table>
	<%} %>
	<footer>
		<div class="fixed">

	<%@include file="./bottom.jsp"%>
		</div>
	</footer>
</body>
</html>
