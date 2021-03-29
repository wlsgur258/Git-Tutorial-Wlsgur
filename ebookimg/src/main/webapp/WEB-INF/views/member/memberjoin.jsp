<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/main_css.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
		<%@include file="../home.jsp"%>
	<div align="center">
		<br>
		<br>
		<br>
		<h1>회원가입</h1>
		<section>
		</section>
		<table border="1">
			<form action="memberdo" method="post">
				<tr>
					<th>아이디</th>
					<td><input type="text" class="form-control" id="mid"
						name="mid" placeholder="ID" required>
					<td><button class="btn btn-primary" id="duplicate_check" type="button" onclick="check();">중복체크</button></td>
				<tr>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" name="name"
						placeholder="Name" required></td>
				</tr>
				<!-- password1 -->
				<tr>
					<th>패스워드</th>
					<td colspan="2"><input type="password" name="password"
						placeholder="Password" required></td>
				</tr>
				<tr>
					<th>패스워드확인</th>
					<td colspan="2"><input type="password" name="password2"
						placeholder="Password Confirm" required></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="2"><input type="date" name="birthday"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="2" align="center"><input type="radio"
						name="gender" value="남" checked>남성
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" name="gender" value="여">여성</td>
				</tr>
				<tr>
					<td align="center" colspan="3">
						<input type="submit" class="btn btn-primary" value="회원가입">
						&nbsp;&nbsp;
						<button type="reset" class="btn btn-primary">전체삭제</button>
					</td>
				</tr>
			</form>
		</table>
	</div>
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
</body>
<script>
	function check() {
		id = $("#mid").val();

		$.ajax({
			url : 'ID_Check',
			type : 'POST',
			dataType : 'text',
			contentType : 'text/plain; charset=utf-8;',
			data : id,

			success : function(data) {
				if (data == 0) {
					console.log("아이디 없음");
					alert("사용할 수 있는 아이디입니다.");
				} else {
					console.log("아이디 있음");
					alert("중복된 아이디가 존재합니다.");
				}
			},
			error : function() {}
		});
	}
</script>
</html>
