<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#humorMenu{
		width:1000px;
		margin:0 auto;
		overflow:auto;
	}
	#humorMenu li{
		float:left;
		width:15%;
		border-bottom:1px solid black;
		height:30px;
		line-height:30px;
	}
	#humorMenu li:nth-of-type(5n+2){
		width:40%;
		text-align:left;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.humorMenuTop{
		background-color:#ddd;
		border-top:1px solid black;
		height:50px !important;
		line-height:50px !important;
		font-weight:bold;
		text-align:center !important;
	}
	#pageNation {
		width:1000px;
		overflow:auto;
		margin:0 auto;
		text-align:center;
	}
	#pageNation li{
		display:inline-block;
		width:30px;
		text-align:center;
	}
	#humorWrite{
		text-align:right;
		width:1000px;
		margin:0 auto;
		padding-top:50px;
	}
</style>
<section>
	<div id='humorWrite'>
		<c:if test="${logStatus!='Y' }">글쓰기 </c:if>
		<c:if test="${logStatus=='Y' }"><a href='boardHumorWrite'>글쓰기</a></c:if>
	</div>
	<ul id="humorMenu">
		<li class='humorMenuTop'>번호</li>
		<li class='humorMenuTop'>제목</li>
		<li class='humorMenuTop'>작성자</li>
		<li class='humorMenuTop'>조회</li>
		<li class='humorMenuTop'>날짜</li>
		<c:forEach var="lst" items="${lst}">
			<li>${lst.no }</li>
			<li><a href="humorboardShow?no=${lst.no }">${lst.title }</a></li>
			<li>${lst.userid }</li>
			<li>${lst.hit }</li>
			<li>${lst.writedate }</li>
		</c:forEach>
	</ul>
	<ul id='pageNation'>
		<c:if test='${page.pageNum==1 }'>
			<li class='prev'>prev</li>
		</c:if>
		<c:if test='${page.pageNum>1 }'>
			<li class='prev'><a href='boardHumor?pageNum=${page.pageNum-1 }'>prev</a></li>
		</c:if>
		<c:forEach var="p" begin="${page.startPage }" end="${page.startPage+page.onePageCount-1 }">
			<c:if test="${p<=page.totalPage }">
				<c:if test="${p==page.pageNum }">
					<li style="font-weight:bold; color:red;">${p }</li>
				</c:if>
				<c:if test="${p!=page.pageNum }">
					<li><a href='boardHumor?pageNum=${p }'>${p }</a></li>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test='${page.pageNum>=page.totalPage }'>
			<li>next</li>
		</c:if>
		<c:if test='${page.pageNum<page.totalPage }'>
			<li class='next'><a href='boardHumor?pageNum=${page.pageNum+1 }'>next</a></li>
		</c:if>
	</ul>
</section>
</body>
</html>