<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/resources/js/facebook.js"></script>
<script src="/resources/js/google.js"></script>
<script>
$(function(){
	
	$("#emailBtn").on("click", function(){
		var email = $("#email").val();
		console.log(email);
		$.ajax({
			type : "POST",
			url : "/member/checkEmail",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				
				email : email
			}),
			success : function(result){
				
				console.log(result);
			}			
		});
		
	});
	
	$("#nickBtn").on("click", function(){
		var nickname = $("#nickname").val();
		console.log(nickname);
		$.ajax({
			type : "POST",
			url : "/member/checkNickname",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				
				nickname : nickname
			}),
			success : function(result){
				
				console.log(result);
			}			
		});
		
	});
	
	
});
</script>
<title>통합 로그인</title>
<meta charset="UTF-8">
</head>
<body>

	<button id="authorize-button">구글 버튼</button>
	<button id="facebookBtn">페이스북 버튼</button>
	<!-- <fb:login-button scope="public_profile,email,user_birthday"
		onlogin="checkLoginState();">
	</fb:login-button> -->

	<h3>사용자 정보입력</h3>
	<form action="/member/join" method="post">
		<div>닉네임:&nbsp;<input type="text" id="nickname" name="nickname" value="">
		<input type="button" id="nickBtn" value="중복확인">
		</div>
		<div>비번:&nbsp;<input type="text" id="password" name="password">
		</div>		
		
		<input type="text" id="sex" name="sex" value="">
		<input type="text" id="age" name="age" value="">
		<input type="text" id="email" name="email" value="">
		<input type="button" id="emailBtn" value="이메일 중복확인">
		<input type="submit" value="가입하기">
	</form>
<!-- <script>
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	// 토큰을 가져온다

	// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
	// 앱에서 현재의 로그인 상태에 따라 동작하면 된다.
	// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다.
	if (response.status === 'connected') {
		// 페이스북을 통해서 로그인이 되어있다.
		// 토큰을 가져온다
		var accessToken = response.authResponse.accessToken;
		getProFile(accessToken);
	} else if (response.status === 'not_authorized') {
		// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
		/* document.getElementById('status').innerHTML = 'Please log '
				+ 'into this app.'; */
	} else {
		// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
		//document.getElementById('status').innerHTML = 'Please log '
		//		+ 'into Facebook.';
	}
}

// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다.
// onlogin 핸들러를 아래와 같이 첨부하면 된다.
function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}
//로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
// 이 호출은 statusChangeCallback()에서 이루어진다.

// /me는 현재 로그인된 페이스북 사용자를 의미한다.
function getProFile(accessToken) {

	FB.api('me?fields=id,name,email,age_range,gender', {
		  access_token : accessToken
	} , function(response) {
		//handling
		
		setFacebookProFile(response);
		
	});
}

function setFacebookProFile(resp){
	
	var email = resp.email;
	var sex = resp.gender;
	var age = resp.age_range.min;
	console.log(resp);
 	console.log(email);
	console.log(sex);
	console.log(age);
	$("#sex").val(sex);
	$("#age").val(age);
	$("#email").val(email);
	
}

</script> -->
<script async defer src="https://apis.google.com/js/api.js" 

      onload="this.onload=function(){};handleClientLoad()" 

      onreadystatechange="if (this.readyState === 'complete') this.onload()">

</script>

</body>
</html>