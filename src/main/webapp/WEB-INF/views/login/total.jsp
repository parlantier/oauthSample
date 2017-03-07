<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- <script src="/resources/js/facebook.js"></script> -->
<script src="/resources/js/google.js"></script>
<script src="/resources/js/snsBtn.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.7.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-auth.js"></script>
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId : '135805423595994',
			xfbml : true,
			version : 'v2.8'
		}, FB.getLoginStatus(function(response) {
			statusChangeCallback(response);

		}));
		FB.AppEvents.logPageView();

	}

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
			/* 
			 * document.getElementById('status').innerHTML = 'Please log ' + 'into 
			 * this app.'; 
			 */
		} else {
			// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다. 
			// document.getElementById('status').innerHTML = 'Please log ' 
			// + 'into Facebook.'; 
		}
	}

	// /me는 현재 로그인된 페이스북 사용자를 의미한다.
	function getProFile(accessToken) {

		FB.api('me?fields=id,name,email,age_range,gender', {
			access_token : accessToken
		}, function(response) {
			// handling

			setFacebookProFile(response);

		});
	}

	function setFacebookProFile(resp) {

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

	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
</script>
<title>통합 로그인</title>
<meta charset="UTF-8">
</head>
<body>
	<script>
		(
						function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id))
								return;
							js = d.createElement(s);
							js.id = id;
							js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
	</script>

	<button id="authorize-button">구글 버튼</button>
	<div id="fb-root"></div>
	<div class="fb-login-button" data-max-rows="1" data-size="large"
		data-show-faces="false" data-auto-logout-link="false"
		onlogin="checkLoginState();"></div>


	<h3>사용자 정보입력</h3>
	<form action="/member/join" method="post">
		<div>
			닉네임:&nbsp;<input type="text" id="nickname" name="nickname" value="">
			<input type="button" id="nickBtn" value="중복확인">
		</div>
		<div>
			비번:&nbsp;<input type="text" id="password" name="password">
		</div>

		<p>성별:<input type="text" id="sex" name="sex" value=""></p>
		<p>나이: <input
			type="text" id="age" name="age" value=""></p>
		<p>이메일:
			<input type="text"
			id="email" name="email" value=""> <input type="button"
			id="emailBtn" value="이메일 중복확인">
		<button id="sendEmail">인증메일 발송</button>
		</p>
			<p>이메일 인증 번호:&nbsp;<input type="text">
			<button id="resendEmail">재발송</button></p>
			<p> <input type="submit"
			value="가입하기"></p>
		<div id="danger"></div>
	</form>

	<script>
		
	</script>
	<script async defer src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};handleClientLoad()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()">
	</script>

</body>
</html>