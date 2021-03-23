<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.a.b.service.*"%>
<html>
<head>
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		id = "GUEST";
	}
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	<title>Home</title>
</head>
<style>
.body {
	background-img: url('/resources/img/body.png');
	background-color: white;
}
</style>
<body class="body">
		<table width="100%" border="0">
		<tr>
			<td><a href="main" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO1.png'/>" height="100" alt="로고출력자리">
			</a></td>
			<td colspan="3">
				<div align="center">
					<h1>E Book</h1>
				</div>
			</td>
			<td align="center"><h3 class="y"><%=id%>
				</h3>
	<%
 	if (id.equals("GUEST")) { %>
				<button class="btn btn-primary" onclick="location.href='login'">로그인</button>
				<button class="btn btn-primary" onclick="location.href='memberjoin'">회원가입</button></td>
				<%
					} else {
				%>
				<button class="btn btn-primary" onclick="location.href='logout'">로그아웃</button>
				<%
					}if (id.equals("admin")){
						%>
				<button class="btn btn-primary" onclick="location.href='adminpage'">관리자용</button>
						<%
					}else if(!id.equals("GUEST")) {
						%>
				<button class="btn btn-primary" onclick="location.href='memdata?bId=<%=id%>'">회원정보</button>
						<%
					}
				%></td>
		</tr>
		<tr height="50">
			<td align="center"><h3><a href="list">도서 목록</a></h3></td>
			<td align="center"><h3><a href="rentallist">읽은 책 목록</a></h3></td>
			<td align="center"><h3><a href="rentalinglist">현재 대여 목록</a></h3></td>
			<td align="center"><h3><a href="">요청 게시판</a></h3></td>
			<td align="center"><h3><a href="cashup">잔액확인/충전</a></h3>
		</tr>
</table>
</body>
</html>
