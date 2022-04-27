<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
	var now = new Date();
	
	var y = now.getFullYear();
	var m = now.getMonth();
	var d = now.getDate();
	
	function yearList(){
		$("#yearList").html("<img src='/miniProject/img/left.png' class='moveImg' onclick='leftmove()'/> "+y+"년 <img src='/miniProject/img/right.png' class='moveImg' onclick='rightmove()'/>");
		monthList();
	}
	
	function monthList(){
		var monthMsg="";
		for(var i=1; i<=12; i++){
			monthMsg+="<li><a href='boardPlanList?year="+y+"&month="+i+"'>"+i+"월</a></li>";
		}
		$("#monthList").html(monthMsg);
		
		$("#monthList li").mouseover(function(){
			$(this).css('background-size','320px').css('transition-duration','0.2s');
		});
		
		$("#monthList li").mouseleave(function(){
			$(this).css('background-size','300px').css('transition-duration','0.2s');
		});
		
		//#monthList li가 항상 다시 만들어 지기 때무에 마우스 오보ㅓ, 리브 이벤트가 다시 만들어진 id를 찾아가려면 메소드도 새로 적재해야한다.
		//그래서 위치를 monthList()안에 넣어 새로 적재하게 만듬.
	}
	
	function leftmove(){
		y-=1;
		yearList();
	}
	
	function rightmove(){
		y+=1;
		yearList();
		
	}
	
	$(()=>{
		
		yearList();
		
	});
	</script>
	<style>
		#monthList {
		width:1000px;
		margin:0 auto;
		}
		#monthList li{
			float:left;
			width:230px;
			height:200px;
			box-sizing:border-box;
			line-height:200px;
			font-size:2em;
			margin:10px;
			background-image:url(/miniProject/img/calender2.png);
			background-size:300px;
			background-repeat:no-repeat;
			background-position:50% 50%;
		}
		#yearList{
			font-size:2em;
			font-weight:bold;
		}
		.moveImg{
			width:30px;
			cursor:pointer;
		}

	</style>
	<section>
		<br/><br/>
		<div id="yearList"></div>
		<br/><br/>
		<ul id="monthList"></ul>
	</section>
</body>
</html>