<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(()=>{
		$("#allCheckbox").change(function(){
			console.log("클릭");
			if($("#allCheckbox").is(":checked")){
				$("input[type=checkbox]").prop("checked",true);
	        }else{
	        	$("input[type=checkbox]").prop("checked",false);
	        }
			//attr은 속성값을 반환하지만 prop는 해당 속성이 있는지 없는지를 찾아 boolean값을 반환한다(속성값을 변경시킬 수도 있다.).
			//is는 prop보다 폭넓은 선택자의 역할로 $()선택자가 is()가 맞는지를 판단하여 boolean값을 반환한다.
			//속성의 경우 (:)를 이용해 구분하는 듯.
		});
		
		var checkContent = false;
		
		$(".memoImg").mouseover(function(){
			if(!checkContent){
				checkContent = true;
				$(this).prepend("<div class='contentListSub'>"+$(this).prev().html().replaceAll("\n", "<br/>")+"</div>");
			}
		});
		
		$(".memoImg").mouseleave(function(){
			if(checkContent){
				checkContent = false;
				$(".contentListSub").remove();				
			}
		});

		$('#modalFrm').on('submit',function(){
			event.preventDefault();
			if($("#title").val()==""){
				
				alert("타이틀은 필수 입력입니다.");
				return false;
			}
			if($("#content").val()==""){
				alert("컨텐츠은 필수 입력입니다.");
				return false;
			}
			if($("#Sdate").val()==""){
				alert("시작일 입력하세요.");
				return false;
			}
			if($("#Edate").val()==""){
				alert("종료일 입력하세요.");
				return false;
			}
			var params = $("#modalFrm").serialize();
			$.ajax({
				url:'boardPlanListUpdate',
				data:params,
				type:'get',
				success:function(r){
					//r에 리턴받은 값이 들어간다.
					console.log(r);
					alert("수정되었습니다.");
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
<style>
	.contentListSub{
		position:absolute;
		background-image:url(img/memo2.png);
		width:150px;
		height:230px;
	  	background-size:100%;
  		background-repeat:no-repeat;
  		background-position:50% 50%;
  		text-align:center;
  		padding:40px;
  		padding-top:80px;
  		font-weight:bold;
  		line-height:25px;
	}
	#myPlanListTitle{
		height:100px;
		line-height:100px;
		font-size:1.5em;
		font-weight:bold;
	}
	#myPlanList	{
		width:1100px;
		margin:0 auto;
		overflow:auto;
	}
	#myPlanList li{
		float:left;
		width:13%;
		height:50px;
		line-height:50px;
		border-bottom:1px solid gray;
	}
	#myPlanList li:nth-of-type(8n+4){
		width:30%;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	#myPlanList li:nth-of-type(8n+5){
		width:5%;
	}
	#myPlanList li:nth-of-type(8n+1){
		width:8%;
	}
	#myPlanList li:nth-of-type(8n+8){
		width:5%;
	}
	.listMenu{
		background-color:#ddd;
		font-weight:bold;
		font-size:1.2em;
		border-bottom:2px solid gray !important;
		border-top:2px solid gray;
	}
	#myPlanList input[type=checkbox]{
		zoom:1.3;
		margin-top:15px;
	}
	#deleteBtn{
		text-align:left;
		width:1090px;
		margin:0 auto;
		padding-left:10px;
		padding-top:10px;
	}
	#deleteBtn input{
		background-color:#ddd;
		height:30px;
		width:60px;
		border-radius:10px;
		font-size:1.1em;
	}
	.memoImg img{
		width:75%;
		margin-top:5px;
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
	.modalBox button {
		display: block;
		width: 80px;
		margin: 0 auto;
	}
	.hidden {
		display: none;
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
</style>
<section>
	<div id="myPlanListTitle">${logId}님의 ${month }월 목록입니다.</div>
	<form method='post' action='boardPlanListDelete'>
	<input type='hidden' name='month' value='${month }'/>
	<input type='hidden' name='year' value='${year }'/>
	<ul id="myPlanList">
		<li class="listMenu"><input type="checkbox" id="allCheckbox"/></li>
		<li class="listMenu">title</li>
		<li class="listMenu">color</li>
		<li class="listMenu">content</li>
		<li class="listMenu">show</li>
		<li class="listMenu">Sdate</li>
		<li class="listMenu">Edate</li>
		<li class="listMenu"></li>
		<c:forEach var="lst" items="${lst }">
			<li><input type="checkbox" name='datano' value="${lst.datano }"/></li>
			<li>${lst.title }</li>
			<li><input type="color" value="${lst.color }" disabled/></li>
			<li>${lst.content }</li>
			<li class='memoImg'><img src="img/memo.png"/></li>
			<li>${lst.sdate }</li>
			<li>${lst.edate }</li>
			<li><input type="button" value="수정" class="openBtn"/></li>
		</c:forEach>
	</ul>
	<div id='deleteBtn'>
		<input type='submit' value='delete'/>
	</div>
	</form>
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<form method='get' id='modalFrm'>
				<input type='text'placeholder='계획명을 입력하세요.' id='title' name='title'/>
				<input type='color' id='color' name='color'/><br/>
				<textarea placeholder='메모' id='content' name='content'></textarea><br/>
				<input type='date' id='Sdate' name='Sdate' readonly/> - 
				<input type='date' id='Edate' name='Edate'/><br/>
				<input type='hidden' id='datano' name='datano'/>
				<input type='submit' value='수정'/>
			</form>
		</div>
	</div>
	<script>
		const open = () => {
		  document.querySelector(".modal").classList.remove("hidden");
		  
		  var eindex = $(event.target).parent().index();
		  
		  var eedate = $('#myPlanList li').eq(eindex-1).html();
		  var esdate = $('#myPlanList li').eq(eindex-2).html();
		  var econtent = $('#myPlanList li').eq(eindex-4).html();
		  var ecolor = $('#myPlanList li').eq(eindex-5).children().attr('value');
		  var etitle = $('#myPlanList li').eq(eindex-6).html();
		  var edatano = $('#myPlanList li').eq(eindex-7).children().attr('value');
		  
		  $("#title").attr('value',etitle);
		  $("#content").html(econtent);
		  $('#Sdate').attr('value',esdate);
		  $('#Edate').attr('value',eedate);
		  $('#color').attr('value',ecolor);
		  $('#datano').attr('value',edatano);
		}
		
		const close = () => {
			location.reload();
		}
		
		var openBtn = document.querySelectorAll(".openBtn");
		for(var i=0; i<openBtn.length; i++){
			openBtn[i].addEventListener("click",open);
		}
		document.querySelector(".bg").addEventListener("click", close);	
	</script>
</section>
</body>
</html>