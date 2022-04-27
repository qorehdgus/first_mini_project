<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.main {
		padding-top:50px;
		margin:0 auto;
		width:1000px;
	}
	.main li{
		text-align:left;
	}
	.content{
		height:500px;
		border-bottom:1px solid gray;
	}
	input[type=submit]{
		box-sizeing:border-box;
		background-color:white;
		position:relative;
		top:-15px;
	}
	#dagul{
		width:1000px;
		margin:0 auto;
	}
	#dagul li{
		text-align:left;
	}
</style>
<script>
	$(()=>{
		$('#dagulFrm').submit(function(){
			event.preventDefault();
			console.log("접근");
			$.ajax({
				url:"dagul",
				data:$("#dagulFrm").serialize(),
				type:"get",
				success:function(result){
					console.log("접근222");
					var $lst = $(result);
					var msg = "<ul>";
					$lst.each(function(idx,lst){
						msg+="<li>"+lst.userid+" "+lst.content+"</li>"
					});
					$("#dagul").html(msg);
					console.log(msg);
				}
			});
		});
	});
</script>
<section>
	<ul class="main">
		<li>글쓴이: ${vo.userid }</li>
		<li>제목: ${vo.title }</li>
		<li class="content">컨텐츠<br/>${vo.content }</li>
		<li><form method='get' id='dagulFrm'>댓글<br/>
			<textarea style="resize:none;" name='content' id='content'></textarea>
			<input type="hidden" name="no" value="${vo.no }"/>
			<input type="submit"value="댓글달기"/></form>
		</li>
	</ul>
	<div id="dagul"></div>
</section>
</body>
</html>