<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		id = "GUEST";
	}
%>
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
<link href="/css/main_css.css" rel="stylesheet" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="/script/jquery-3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상단</title>
</head>
<body>
	<div id=wrapper>
		<header>
		<div class="title">
			<a href="main" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO2.png'/>" height="100px" alt="로고출력자리"></a>
		</div>
		<div class="name">
			<img src="<spring:url value ='/resources/img/title.png'/>" height="100px" alt="타이틀">
		</div>
		<div class="loginmenu">
			<h3 class="y"><font color="white"><%=id%></font></h3>
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

		<nav class="mainmenu">
		<ul>
					<li><h3><a href="list">도서 목록</a></h3>
						<ul class="sub">
							<li><a href="list">일반</a>
							<li><a href="">로맨스/판타지</a>
						</ul>
					</li>
					<li><h3><a href="rentalinglist">대여 목록</a></h3>
						<ul class="sub">
							<li><a href="rentalinglist">현재 대여 목록</a>
							<li><a href="rentallist">총 대여 목록</a>
						</ul>
					</li>
						<li><h3><a href="boardList">게시판</a></h3>
						<ul class="sub">
							<li><a href="boardList">자유 게시판</a>
							<li><a href="">요청 게시판</a>
							<li><a href="">내 글 확인</a>
						</ul>
					</li>
					<li><h3><a href="cashup">잔액확인/충전</a></h3></li>
		</ul>
	</nav>
	</div>
</body>
</html>
