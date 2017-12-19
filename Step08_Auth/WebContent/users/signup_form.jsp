<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
<script src="../js/jquery-3.2.1.js"></script>
</head>
<body>
<h3>회원 가입 페이지 입니다.</h3>
<form action="signup.jsp" method="post" id="signupForm">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id" /> <button id="checkId">중복 확인</button><br />
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" id="pwd" /><br />
	<label for="email">이메일</label>
	<input type="text" name="email" id="email" /><br />
	<button type="submit">가입</button>
</form>
<script>
	var isCheckId = false;
	
	//중복 확인 버튼을 클릭 했을 때,
	$("#checkId").click(function(){
		//입력한 id를 읽어온다.
		var id = $("#id").val();
		//문자열을 ajax 요청을 통해서 서버에 전송
		$.ajax({
			method:"post",
			url:"checkid.jsp",
			data:{id:id},
			success:function(data){
				if(data.response){//존재하는 아이디이면,
					alert("이미 사용하는 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
				}else{//존재하지 않으면
					alert("사용가능한 아이디입니다.");
				}
				
				isCheckId = true;
			}
		});
		
		return false;// 안 해놓으면, signup.jsp 로 넘어간다.
	});
	
	//가입 버튼을 클릭했을 때,
	$("#signupForm").submit(function(){
		if(!isCheckId){//중복 확인을 하지 않았다면,
			alert("아이디 중복 확인 하세요!");
			return false;
		}
	});
</script>
</body>
</html>