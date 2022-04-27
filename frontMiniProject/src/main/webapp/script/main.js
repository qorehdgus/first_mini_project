/**
 * 
 */

 $(()=>{
		
		$(window).scroll(function(){
			if(window.scrollY!=0){
				$("#top").css('top','0px').css('transition-duration','0.5s');
			}else{
				$("#top").css('top','10px').css('transition-duration','0.5s');
			}	
		});
		$(window).resize(function(){
			if(window.innerWidth<800){
				$("#login").css('display', 'none');
			}else{
				$("#login").css('display', 'block');
			}			
		});
		
		$("#hover ul").fadeOut(0);
		
		$("#hover").on('mouseenter',function(){
			$("#hover>span").html("게시판 △");
			$("#hover ul").fadeIn(100);
		});
		
		$("#hover").on('mouseleave',function(){
			$("#hover>span").html("게시판 ▼");
			$("#hover ul").fadeOut(100);
		});
	});