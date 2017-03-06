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
				}
			}			
		});
		
	});
	
	
	
});