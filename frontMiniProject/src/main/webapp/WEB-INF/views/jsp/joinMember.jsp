<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/miniProject/script/joinMember.js"></script>
<link href="/miniProject/css/joinMember.css" rel="stylesheet" type="text/css"/>
<section>
		<div id="member">
			<div class="title">회원가입</div>
			<form method="post" action="insertMember" id="frm">
				<div><span>ID* </span><input type="text" name="userid" id="userid"/></div>
				<div><span>Password* </span><input type="password" name="userpwd" id="userpwd"/></div>
				<div><span>Name* </span><input type="text" name="username" id="username"/></div>
				<div><span>Tel </span><input type="text" name="tel" id="usertel"/></div>
				<div><span>E-mail </span><input type="text" name="email" id="useremail"/></div>
				<button>등록</button>
			</form>
		</div>
	</section>
</body>
</html>