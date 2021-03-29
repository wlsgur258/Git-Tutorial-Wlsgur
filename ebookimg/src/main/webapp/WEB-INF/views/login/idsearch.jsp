<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>ID 찾기</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
		<%@include file="../home.jsp"%>
		<br>
		<br>
		<h1 align="center">ID 찾기</h1>
	<div align="center">
		<table>
			<form action="idsearchdo" method="post">		
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="2"><input type="date" id="birthday" name="birthday"></td>
				</tr>
				<tr>
					<td align="center" colspan="3">
					<input type="button" class="btn btn-primary" value="ID찾기" id="submitBtn">
					&nbsp;&nbsp;
					<input type="reset" value="재입력" class="btn btn-primary"></td>
				</tr>
			</form>
		</table>
	</div>
	<div align="center">
	<br>
	<br>
	<h1 align="center">비밀번호 찾기</h1>
		<table>
			<form action="pwsearchdo" method="post">
				<tr>
					<th>아이디</th>
					<td colspan="2"><input type="text" id="bid" name="bid"></td>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" id="pname" name="pname"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="2"><input type="date" id="pbirthday" name="pbirthday"></td>
				</tr>
				<tr>
					<td align="center" colspan="3">
					<input type="button" class="btn btn-primary" value="비밀번호찾기" id="submitBtnn">
					&nbsp;&nbsp;
					<input type="reset" value="재입력" class="btn btn-primary"></td>
			</form>
		</table>
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
            var name  = $('#name' ).val() ;
            var birthday = $('#birthday').val() ;
            $.ajax({
                type : "POST",
                url: 'idsearchdo',
                data: {name:name, birthday:birthday},
                success: function(data) {
                    if(data == "false")
                        alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.');
                    else
                        location.href="id&pwsearch" ; // home.do로 돌아가시면 됩니다.
                }
            }) ;
        }
        
        $('.loginInput').keydown(function(key) {
            if(key.keyCode == 13) {
                $('#submitBtn').click() ;
            }
        }) ;
        
        $(function() {
            $('#submitBtnn').mouseenter(function() {
                $(this).css('cursor','pointer') ;
            }).mouseout(function() {
                $(this).css('cursor','normal') ;
            }).click(function() {
                submitCheck2() ;
            }) ;
        }) ;
        
        function submitCheck2() {
            var bid = $('#bid').val();
            var pname  = $('#pname' ).val() ;
            var pbirthday = $('#pbirthday').val() ;
            $.ajax({
                type : "POST",
                url: 'pwsearchdo',
                data: {bid:bid, pname:pname, pbirthday:pbirthday},
                success: function(data) {
                    if(data == "false")
                        alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.');
                    else
                        location.href="id&pwsearch" ;
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
