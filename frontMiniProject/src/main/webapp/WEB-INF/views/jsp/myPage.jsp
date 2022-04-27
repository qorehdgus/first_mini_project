<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/miniProject/script/myPage.js"></script>
<link href="/miniProject/css/myPage.css" rel="stylesheet" type="text/css"/>
<link href="/miniProject/lib/main.css" rel="stylesheet"/>
<script src="/miniProject/lib/main.js"></script>
<script>

function planFrmSubmit(){
	event.preventDefault();
	if(document.querySelector("#title").value==""){
		alert("타이틀을 입력하세요");
		document.querySelector("#title").focus();
		return false;
	}
	if(document.querySelector("#Sdate").value==""){
		alert("시작일을 입력하세요");
		document.querySelector("#Sdate").focus();
		return false;
	}
	if(document.querySelector("#Edate").value==""){
		alert("종료일을 입력하세요");
		document.querySelector("#Edate").focus();
		return false;
	}
	var params = $("#planFrm").serialize();
	$.ajax({
		url:'planIn',
		data:params,
		type:'get',
		success:function(){
			//r에 리턴받은 값이 들어간다.
			alert("입력되었습니다.");
		}
	})
}

document.addEventListener('DOMContentLoaded', function() {
	
	var calendarEl = document.getElementById('calendar');

	var test2 = ${lst};
	console.log(test2);
	console.log(test2[0]);

	var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyBhsXk2ZA7BM2TdPiiT6bv99JpN8Tq1b-Q',
	customButtons: {
		setPlanButton: {
			text: '계획입력',
		    click: function() {
		    	if(${logId!=null}){
			    	document.querySelector(".modal").classList.remove("hidden");	    			    		
		    	}else{
		    		alert("로그인 하셔야 이용하실 수 있습니다.");
		    	}
		    }
		}
	},
    headerToolbar: {
    	left: 'prev,next today',
    	center: 'title',
    	right: 'setPlanButton'
    },
    locale: "ko",
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    selectable: true,
    
    eventSources:[{
    	googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
    	color:'#B9C087'
    },
    {
    	events:test2
    }],

    eventClick: function(info) {
    	alert('Event: ' + info.event.title);
    	alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    	alert('View: ' + info.view.type);
    	console.log(info);
    },
    eventDrop:function(info){
    	console.log(info.event.startStr);
    	console.log(info.event.endStr);
    }
});
	calendar.render();
});

</script>
<style>
  #calendar {
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  .modalBox input[type=text] {
  	width:350px;
  }
  .modalBox input[type=date]{
  	width:195px;
  }
  .modalBox input[type=text], .modalBox input[type=date]{
  	border:solid 1px gray;
  	box-sizing:border-box;
  	background-image:url(/miniProject/img/calender.png);
  	background-size:20px;
  	background-repeat:no-repeat;
  	background-position: 10px 50%;
  	padding-left:40px;
  	height:30px;
  	margin-bottom:5px;
  	border-radius:20px;
  }
  .modalBox textarea{
  	resize:none;
  	width:400px;
  	height:50px;
  }
  button[title='계획입력']{
  	width:100px;
  }
  .modal {
    	position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		z-index:4;
	}
	.modal .bg {
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.6);
	}
	.modalBox {
		position: absolute;
		background-color: #fff;
		padding: 15px;
  		text-align:center;
	}
	.hidden {
		display: none;
	}
</style>
<section>
		<div>
			<nav id="myPageMenu">
				<ul>
					<li><a href="myPage"><img src="<%=request.getContextPath() %>/img/calender.png"/><span> Calender</span></a></li>
					<li><img src="<%=request.getContextPath() %>/img/menu.png"/><span id="Alam" onclick="AlamPage()"> Alam</span></li>
				</ul>
			</nav>
			<article id="myPageMain">
				<div id="calendar"></div>
			</article>
		</div>
		<div class="modal hidden">
			<div class="bg"></div>
			<div class="modalBox">
				<span style='font-size:1.2em; font-weight:bold;'>input your plan</span><br/><br/>
				<form method='get' id='planFrm' onsubmit='return planFrmSubmit()'>
					<input type='hidden' value='${logId}' name='userid'/>
					<input type='text'placeholder='계획명을 입력하세요.' id='title' name='title'/> 
					<input type='color' id='color' name='color'/><br/>
					<textarea placeholder='메모' id='content' name='content'></textarea><br/>
					<input type='date' id='Sdate' name='Sdate'/> - 
					<input type='date' id='Edate' name='Edate'/><br/>
					<input type='submit' value='입력'/>
				</form>
			</div>
		</div>
		<script>
			const close = () => {
				location.reload();
			}
			document.querySelector(".bg").addEventListener("click", close);	
		</script>
	</section>
</body>
</html>


