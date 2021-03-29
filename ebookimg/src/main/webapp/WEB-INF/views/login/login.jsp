<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main_css.css">
<title>회원 로그인</title>
</head>
<body>
		<%@include file="../home.jsp"%>
<div align="center">
	<br>
	<br>
	<br>
	<h1>로그인</h1>
		<section>
		</section>
<table>
<form id="loginFrm" method="post">
	<tr>
		<th><div id="buttonB1">아이디</div></th>
		<td><input type="text" id="userId" name="userId" class="loginInput"></td>
    </tr>
	<tr>
		<th><div id="buttonB1">비밀번호</div></th>
		<td><input type="password" id="userPwd" name="userPwd" class="loginInput"></td>
	</tr>
	<tr><td colspan="2" align="center">
		<input type="button" class="btn btn-primary" value="로그인" id="submitBtn">
		<input type="reset" class="btn btn-primary" value="재입력"><p/><p/>
	</td></tr>
</table>
</form>
	<h5 align="center">
		<button class="btn btn-primary" onclick="location.href='memberjoin'">회원 가입</button>
		<button class="btn btn-primary" onclick="location.href='idSearch'">아이디 또는 비밀번호 찾기</button>
	</h5>
</div>
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
<script>
        $(function() {
            $('#submitBtn').mouseenter(function() {
                $(this).css('cursor','pointer') ;
            }).mouseout(function() {
                $(this).css('cursor','normal') ;
            }).click(function() {
                submitCheck() ;
            }) ;
        }) ;
        
        function submitCheck() {
            var userId  = $('#userId' ).val() ;
            var userPwd = $('#userPwd').val() ;
            $.ajax({
                type : "POST",
                url: 'logindo',
                data: {userId:userId, userPwd:userPwd},
                success: function(data) {
                    if(data == "false")
                        alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.');
                    else
                        location.href="main" ; // home.do로 돌아가시면 됩니다.
                }
            }) ;
        }
        
        $('.loginInput').keydown(function(key) {
            if(key.keyCode == 13) {
                $('#submitBtn').click() ;
            }
        }) ;
    </script>
</body>
</html>
