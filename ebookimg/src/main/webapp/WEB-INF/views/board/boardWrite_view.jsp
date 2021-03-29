<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<%@ page import="com.a.b.dto.Member"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
	<%@include file="../home.jsp"%>

	<%
		String vo = (String) session.getAttribute("id");
	%>

	<%
		if (vo == null) {
	%>
	<script>
		alert('로그인 후 가능합니다.');
		document.location.href = "login";
	</script>
	<%
		}
	%>

	<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}
</style>
	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>

	<table width="700" border="3" bordercolor="lightgray" align="center">
		<form action="boardWrite" method="post">

			<input type="hidden" name="bBid" value="${boardWrite_view.bBid}">
			<input type="hidden" name="bId" value=<%= vo %>>
			<tr>
				<th>작성자</th>
				<td><%= vo %></td>
			</tr>
			
			<tr>
				<th>제 목</th>
				<td><input name="bTitle" type="text" size="70" maxlength="100"></td>
			</tr>
			
			<tr>
				<th>내 용</th>
				<td><textarea name="bContent" cols="72" rows="20"></textarea></td>
			</tr>
			
			<tr>
				<th>이미지</th>
				<td>
					<input name="file" type="file" size="50">
				</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="5"><input type="reset" value="작성취소"> <input
					type="submit" value="등록">
					<button type="button">
						<a href="boardList">목록보기</a>
					</button></td>
			</tr>

		</form>
	</table>
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
</body>
</html>


