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
				if(result.indexOf("0") != -1){
					$("#danger").text("유효한 이메일이 아닙니다");
					$("#danger").css("color", "red");
				}
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
				if(result.indexOf("0") != -1){
					$("#danger").text("유효한 닉네임이 아닙니다");
					$("#danger").css("color", "red");
				}
			}			
		});
		
	});
	
	$("#sendEmail").on("click", function(){
		
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
	
	
});