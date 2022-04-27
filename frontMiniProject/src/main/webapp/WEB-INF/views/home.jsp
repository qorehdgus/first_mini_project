<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#mainBox{
		opacity:0;
	}
</style>
<script>
var mainimg_opacity = 0;
var mainimg_img = 0;
var mainimg_inteval = 0;
mainimg_inteval=setInterval(img_show,50);

function img_show(){
	if(mainimg_opacity<=1){
		mainimg_opacity+=0.1
		$("#mainBox").css('opacity',mainimg_opacity);
	}else if(mainimg_img<=50){
		mainimg_img+=2.5;
		$("#explain>img").css('width',mainimg_img+'%')
	}else{
		clearInterval(mainimg_inteval);
	}
}
</script>
	<section>
		<br/>
		<div id="mainBox">
			<img src="<%=request.getContextPath() %>/img/flowers.png" id="mainimg"/>
			<div id="explain"></div>
		</div>
	</section>
</body>
</html>