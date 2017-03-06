<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
window.fbAsyncInit = function() {
    FB.init({
      appId      : '135805423595994',
      xfbml      : true,
      version    : 'v2.8'
    }, FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	    
	    if (response.status === 'connected') {
	        console.log('Logged in.');
	      }
	      else {
	        FB.login();
	      }

	}));
    FB.AppEvents.logPageView();
    
   
  };
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>
</body>
</html>