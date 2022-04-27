	var now = new Date();
	
	var y = now.getFullYear();
	var m = now.getMonth();
	var d = now.getDate();
	var today_m = now.getMonth();
	
	$(()=>{
		$("#frm").submit(function(){
			event.preventDefault();
			return checkfrm();
		});
		//submit 폼 체크 함수
		function checkfrm(){
			if($("#planName").val()==""){
				alert("계획명을 입력하세요");
				return false;
			}
			if($("#dateStart").val()==""){
				alert("계획 시작일을 입력하세요");
				return false;
			}

			var dateS=$("#dateStart").val().split('-');
			var dateE=$("#dateEnd").val().split('-');
			
			var dateS_Date = new Date(dateS[0],dateS[1],dateS[2]);
			var dateE_Date = new Date(dateE[0],dateE[1],dateE[2]);
			
			if(dateS_Date.getTime()>=dateE_Date.getTime() && $("#dateEnd").val()!=""){
				alert("계획 종료일은 시작일보다 뒤에 있어야 합니다.");
				return false;
			}
		}
		//데이터를 쪼개서 만약 끝나는 날짜를 입력했다면 그 날짜가 시작일 뒤로 넘어가야 하고 입력 안했다면 검사를 안하게 함.(첫번째 입력폼 검사식.)
	});
	
	var checkPlus=false;
	var opacityData=0;
	var intervalID=0;
	
	function changeP(){
		if(!checkPlus){
			checkPlus=true;
			intervalID = setInterval(show,10);
		}else{
			checkPlus=false;
			intervalID = setInterval(hide,10);
		}
	}
	//fadein(),fadeout()함수를 비슷하게 직접 구현한 것.
	//처음에는 jquery함수를 ready이벤트 내에서만 쓸 수 있는 줄 알고 만들었으나
	//추후 알아보니 jquery변수 $()를 이용하면 스트립트문 내에서 언제든지 jquery함수를 사용할 수 있음.
	//고로 담부터는 쓸데없는 짓하지말고 fadein(),fadeout()쓰자.
	
	function show(){
		document.querySelector("#plusform").style.zIndex="2";
		if(opacityData<=1){
			opacityData+=0.1;
			document.querySelector("#plusform").style.opacity=opacityData;
		}
		else{
			clearInterval(intervalID);
		}
	}
	//뻘
	
	function hide(){
		if(opacityData>=0){
			opacityData-=0.1;
			document.querySelector("#plusform").style.opacity=opacityData;
		}
		else{
			document.querySelector("#plusform").style.zIndex="-1";
			clearInterval(intervalID);
		}
	}
	//짓
	
	var check_Alam=false;
	function AlamPage(){
		if(!check_Alam){
			check_Alam=true;
			$("#Alam").after("<button onclick='AlamPage_remove()'>닫기</button>");
			Alam_Interval=setInterval(AlamPage_sub,20);
			Alam_slide=setInterval(Alam_slide_f,10);
		}
	}
	//aram을 누르면 페이지가 생성되게 하는 함수
	
	var Alam_Interval_N=0;
	Alam_slide=0;
	function AlamPage_sub(){
		dtr4="<div class='alamP'>알람페이지 작성</div>";
		$("#Alam").after(dtr4);
		Alam_Interval_N+=1;
		if(Alam_Interval_N==5){
			Alam_Inteval_N=0;
			clearInterval(Alam_Interval);
		}
		//document.querySelector("#Alam").after(dtr4)=> 문자열이 고스란히 찍혀버림. 스크립트와 쿼리에서 after함수의 역할이 다른듯.
	}
	//알람 페이지 나타남 숫자 5는 임의로 써놓은 것으로 db연동시 해당 날짜에 입력된 계획의 수를 리턴 받아 그 갯수만큼 반복할 예정(setInterval시킬 예정)
	
	var Alam_slide_width=0;
	
	function Alam_slide_f(){
		Alam_slide_width+=10;
		$(".alamP").css('width',Alam_slide_width);
		if(Alam_slide_width==210){
			clearInterval(Alam_slide);
			Alam_slide_width=0;
		}
	}
	//동적인 느낌을 주기 위한 슬라이드 장치.
	//주의 할 점.
	//setInterval을 두개를 꼬아 놨더니 첫번쨰 inteval실행이 되고 두번쨰 inteval종료를 불러오기 전에 첫번쨰 inteval을 종료시키면 두번쨰 inteval을 영원히 종료할 수 없어짐.
	//그래서 toggle형식으로 안하고 닫기 버튼을 따로 만들어둠.
	
	function AlamPage_remove(){
		check_Alam=false;
		$(".alamP").remove();
		$(event.target).remove();
		Alam_Interval_N=0;
	}
	//닫기 버튼
	//원래 목표는 https://ui.toast.com/tui-calendar와 유사하게 구현할 예정이였음.
	//하지만 처음 설계를 디테일하게 가지 않고 구현한 것에 하나씩 추가하는 식으로 작업하니 에러사항이 너무 많음.
	//+ 원래는 해당 계획 일수 만큼 색깔 바로 구분하려 했으나 방법을 못 찾음. (각 날짜에 색깔바를 추가하는 방법은 구현했으나 새로 들어오는 계획들이 그 날짜만 밀어내고 다른 날짜의 바가 반영안됨.)
	//++ (새로 추가하는 데이터를 div 형식으로 추가해 반영하려 했으나 그러려면 달력 세팅을 처음부터 뜯어고쳐야함(*일주일 단위로 div를 추가로 감싸는 형식. - 확실한 거 아님.) -> 다른 함수들도 다시 짜야함....)
	//타협하자 그냥....
	
	//+ 게시판 추가할 것.
	//기본 틀은 webApp프로젝트의 tesk_menu2.html에 있음.
	
	//+드래그앤 드롭 이벤트 적용시켜볼 것.