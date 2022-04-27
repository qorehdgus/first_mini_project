<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/miniProject/css/login.css" rel="stylesheet" type="text/css"/>
<script src="/miniProject/script/login.js"></script>
<div id="login_form">
		<div>로그인</div>
		<form method="post" action="/miniProject/login" id="frm">
			<div>
				<input type="text" name="userid" id="userid" placeholder="ID"/>
			</div>
			<div>
				<input type="password" name="userpwd" id="userpwd" placeholder="Password"/>
			</div>
			<div>
				<input type="submit" value="계속하기"/>
			</div>
			<div>
				<input type="checkbox" id="login_const"/><label for="login_const">&nbsp;로그인 상태유지</label>
				<a href="joinMember">회원가입</a>/<a href="">아이디 찾기</a>
			</div>
		</form>
	</div>
</body>
</html>