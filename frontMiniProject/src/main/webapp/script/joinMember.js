/**
 * 
 */
 $(()=>{
		$("#frm").submit(function(){
			return formCheck();
		});
		function formCheck(){
			if($("#userid").val()==""){
				alert("아이디는 필수 입력 항목입니다.\n* 필수 입력");
				$("#userid").focus();
				return false;
			}
			var reg=/^[a-zA-Z]{1}\w{3,11}$/;
			if(!reg.test($("#userid").val())){
				alert("아이디 양식이 잘못되었습니다.\n아이디 양식\n- 첫 글자는 영문이여야한다.\n- 4~12자 여야 한다.\n- 영문,숫자 이외에는 사용할 수 없다.");
				$("#userid").focus();
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호는 필수 입력 항목입니다.\n* 필수 입력");
				$("#userpwd").focus();
				return false;
			}
			reg=/^\w{4,12}$/;
			if(!reg.test($("#userpwd").val())){
				$("#userpwd").focus();
				alert("비밀번호는 4~12자 여야 합니다.");
				return false;
			}
			if($("#username").val()==""){
				alert("성함은 필수 입력 항목입니다.\n* 필수 입력");
				$("#username").focus();
				return false;
			}
			reg=/^[가-힣]{1,7}$/;
			if(!reg.test($("#username").val())){
				alert("성함은 7자 이내의 한글이름만 입력가능합니다.")
				$("#username").focus();
				return false;
			}
			reg=/^[0-9]{9,20}$/;
			if($("#usertel").val()!=""){
				if(!reg.test($("#usertel").val())){
					alert("9~20자리 숫자만 입력가능합니다.")
					$("#usertel").focus();
					return false;	
				}
			}
			reg = /^\w{4,12}[@][a-zA-Z]{2,8}[.][a-zA-Z]{1,5}([.][a-zA-Z]{1,5})?$/;
			if($("#useremail").val()!=""){
				if(!reg.test($("#useremail").val())){
					alert("이메일을 잘못 입력하셨습니다.")
					$("#useremail").focus();
					return false;	
				}
			}
		};
	});