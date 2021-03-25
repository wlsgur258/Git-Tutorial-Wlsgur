<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.a.b.dto.*"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.a.b.service.*" %>
<%@ page import="com.a.b.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
		<%@include file="../home.jsp"%>
	<div align="center">
	<%
		Member vo = (Member)session.getAttribute("joinVo");
	%>
	<br>
	<br>
	<br>
		<h1><%=vo.getbId() %> 회원 정보</h1>
		<table border="1" width="30% align="center">
		
				<tr>
					<th>이름</th>
					<td colspan="2"><%=vo.getbName() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="2"><%=vo.getbBirthday() %></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td colspan="2"><%=vo.getbJoindate() %></td>
				<tr>
					<th>잔액</th>
					<td colspan="2"><%=vo.getbCash() %>
					</td>
				<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn btn-primary" onclick="location.href='memmodify?bId=<%=vo.getbId() %>'" value="정보 수정"> 
					&nbsp;&nbsp; &nbsp;&nbsp;
					<input type="button" class="btn btn-primary" onclick="location.href='memdelete?bId=<%=vo.getbId() %>'" value="회원 탈퇴">
					</td>
				</tr>
			</form>
		</table>
	</div>
	<footer>
		<div>
	<%@include file="../bottom.jsp"%>
		</div>
		</footer>
</body>
</html>
