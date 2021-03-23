<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.a.b.service.*"%>
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
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		id = "GUEST";
	}
%>
<title>Home</title>
<link rel="stylesheet" href="resources/css/home.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.1.js"></script> 
<script>
$(document).ready(function() {
	$(".main>li").mouseover(function() {
		$(this).children(".sub").stop().slideDown(); });
	$(".main>li").mouseleave(function() {
		$(this).children(".sub").stop().slideUp();
	});
});
</script>
</head>
<body class="body">
	<div class="wrapper">
		<div class="wrap">
			<div class="top_area">
				<div class="logo_area">
				<a href="main" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO1.png'/>" height="100" alt="로고출력자리"></a>
				</div>
				<div class="search_area" align="center">
					<h1>E Book</h1>
				</div>
				<div class="login_area">
					<h3 class="y"><%=id%>
				</h3>
	<%
 	if (id.equals("GUEST")) { %>
				<button class="btn btn-primary" onclick="location.href='login'">로그인</button>
				<button class="btn btn-primary" onclick="location.href='memberjoin'">회원가입</button>
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
				%>
				</div>
			</div>
			<div class="navi_bar_area">
				<div id = "nav">
				<ul class="main">
					<li><h3><a href="list">도서 목록</a></h3>
						<ul class="sub">
							<li><a href="">일반</a>
							<li><a href="">로맨스/판타지</a>
						</ul>
					</li>
					<li><h3><a href="rentallist">대여 목록</a></h3>
						<ul class="sub">
							<li><a href="">총 대여 목록</a>
							<li><a href="">현재 대여 목록</a>
						</ul>
					</li>
						<li><h3><a href="boardList">게시판</a></h3>
						<ul class="sub">
							<li><a href="">자유 게시판</a>
							<li><a href="">요청 게시판</a>
							<li><a href="">내 글 확인</a>
						</ul>
					</li>
					<li><h3><a href="cashup">잔액확인/충전</a></h3></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
