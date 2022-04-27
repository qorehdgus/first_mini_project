<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
<script>
	$(()=>{
		//ck에디터5
		ClassicEditor
        .create( document.querySelector( '#content' ) )
        .catch( error => {
            console.error( error );
        } )
		//https://ckeditor.com/docs/ckeditor5/latest/installation/advanced/saving-data.html
		//ckeditor 출력.
		
		$("#boardHumorFrm").submit(function(){
			if($("#title").val()==null || $("#title").val()==""){
				alert("타이틀을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if($("#content").val()==null || $("#content").val()==""){
				alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
			return true;
		});
	});
</script>
<style>
	ul{
		width:1000px;
		margin:0 auto;
		padding-top:50px;
	}
	.ck{
		height:500px;
	}
	input[type=text]{
		width:100%;
		box-sizing:border-box;
	}
</style>
<section>
	<form method="post" action="boardHumorWriteOk" id="boardHumorFrm">
		<ul>
			<li><input type="text" id="title" name="title" placeholder="타이틀을 입력하세요."/></li>
			<li><textarea id="content" name="content"></textarea></li>
			<li><input type="submit" value="작성"/></li>
    	</ul>
    </form>
</body>
</html>
</section>
</body>
</html>