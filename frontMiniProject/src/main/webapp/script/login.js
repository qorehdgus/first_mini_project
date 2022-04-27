/**
 * 
 */
 
 $(()=>{
		$("#frm").submit(function(){
			console.log("서브밋")
			return formCheck();
		});
		function formCheck(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return false;
			}
			else if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				$("#userpwd").focus();
				return false;
			}
		};
	});