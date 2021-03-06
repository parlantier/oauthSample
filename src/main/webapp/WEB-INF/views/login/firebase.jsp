<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.3.0/firebase-auth.js"></script>
<script src="https://apis.google.com/js/api.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>하이</h1>
	<button id="googleBtn">구글로그인</button>
	<button id="facebookBtn">facebook로그인</button>
	<button id="sendEmail">이메일보내기</button>
	<button id="snsBtn">비밀번호찾기</button>


	<script src="https://www.gstatic.com/firebasejs/3.6.10/firebase.js"></script>
	<script>
		// Initialize Firebase
		var auth
		var config = {
			apiKey : "AIzaSyA6C4WJBlorzppyuN3iJkBlf-tKDes3fVw",
			authDomain : "memowepapp-a42d7.firebaseapp.com",
			databaseURL : "https://memowepapp-a42d7.firebaseio.com",
			storageBucket : "memowepapp-a42d7.appspot.com",
			messagingSenderId : "339527950810"
		};
		firebase.initializeApp(config);
		auth = firebase.auth();
		// 여러 인증업체 연결
		var provider = new firebase.auth.GoogleAuthProvider();
		var provider = new firebase.auth.FacebookAuthProvider();
		
		var googleProvider = new firebase.auth.GoogleAuthProvider();
		var facebookProvider = new firebase.auth.FacebookAuthProvider();
		googleProvider.addScope('profile');
		googleProvider.addScope('email');
		googleProvider.setCustomParameters({
			'include_granted_scopes' : true,
			'prompt' : 'consent'
		});
		//googleProvider.setCustomParameters('include_granted_scopes');

		$("#googleBtn").on("click", function() {

			firebase.auth().signInWithPopup(googleProvider).then(

			function(result) {
				// This gives you a Google Access Token. You can use it to access the Google API.
				var token = result.credential.accessToken;
				// The signed-in user info.
				var user = result.user;
				// ...
				user.reauthenticate(result.credential);
				console.log(result);
				console.log("제공자데이터");
				console.log(user.providerData);
				if (user != null) {
					var userId = user.providerData[0].uid;

					googleAjax(userId, token);
					user.providerData.forEach(function(profile) {
						console.log("Sign-in provider: " + profile.providerId);
						console.log("  Provider-specific UID: " + profile.uid);
						console.log("  Name: " + profile.displayName);
						console.log("  Email: " + profile.email);
						console.log("  Photo URL: " + profile.photoURL);
						console.log(profile);
					});
				}

			});
		});	

		$("#facebookBtn")
				.on(
						"click",
						function() {

							firebase
									.auth()
									.signInWithPopup(facebookProvider)
									.then(
											function(result) {
												// This gives you a Google Access Token. You can use it to access the Google API.
												var token = result.credential.accessToken;
												// The signed-in user info.
												var user = result.user;
												console.log(user.providerData);
												// ...
												if (user != null) {
													console.log("디버그0");
													googleAjax();
													user.providerData
															.forEach(function(
																	profile) {
																console
																		.log("Sign-in provider: "
																				+ profile.providerId);
																console
																		.log("  Provider-specific UID: "
																				+ profile.uid);
																console
																		.log("  Name: "
																				+ profile.displayName);
																console
																		.log("  Email: "
																				+ profile.email);
																console
																		.log("  Photo URL: "
																				+ profile.photoURL);
																console
																		.log(profile);

															});
												}
											});
						});

		function googleAjax(userId, token) {
			console.log("디버그");
			var googleURL = "https://people.googleapis.com/v1/people/" + userId
					+ "?key=AIzaSyCLxZq7qPoyK_Fuhmp5_NehcppLdllvyBU";
			var googleTokenURL = "https://people.googleapis.com/v1/people/"
					+ token + "?key=AIzaSyCLxZq7qPoyK_Fuhmp5_NehcppLdllvyBU";
			$.getJSON(googleTokenURL, function(data) {
				console.log("테스트1");
				console.log(data);
			});

		}

		// 이메일 보내기 버튼 핸들러
		$("#sendEmail").on("click", function() {

			firebase.auth().onAuthStateChanged(function(user) {
				if (user) {
					// User is signed in.
					console.log("이메일 체크: ");
					console.log(user);
					user.sendEmailVerification().then(function() {
						// Email sent.
						console.log("이메일 전송완료");
					}, function(error) {
						// An error happened.
						console.log("이메일 전송 실패");
					});

				} else {
					// No user is signed in.
					console.log("로그인상태아님");
					firebase.auth().signInWithPopup(googleProvider).then(
						function(result){		
							var user = firebase.auth().currentUser;
							console.log("이메일:");
							console.log(result);
							console.log(user);
							
						});
				}
			});

		});
		
		// 비밀번호 찾기 버튼
		// 이메일을 입력받아 메일보내기
		$("#snsBtn").on("click", function(){
			
			var auth = firebase.auth();
			var emailAddress = prompt("이메일 주소를 입력하세요");

			auth.sendPasswordResetEmail(emailAddress).then(function() {
			  // Email sent.
				console.log("이메일 보내기 성공");
			}, function(error) {
			  // An error happened.
				console.log("이메일 보내기 실패")
				
			});
		
			
		});
		
		
	</script>

	 
	





</body>
</html>