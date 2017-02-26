<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사용자가 인증된경우 14행의 내용을 출력한다  -->
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="name"/>님 환영합니다
	</sec:authorize>
	<ul>
		<li><a href="<c:url value='/home/main' />" >/home/main</a></li>
		<li><a href="<c:url value='/member/main' />">/member/main</a></li>
		<li><a href="<c:url value='/manager/main' />">/manager/main</a></li>
		<li><a href="<c:url value='/admin/main' />">/admain/main</a></li>

	<!-- 인증된 경우에만 로그아웃 링크를 출력하도록 했다 -->
		<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value='/j_spring_security_logout' />">
			/j_spring_security_logout</a></li>
		
		</sec:authorize>
	</ul>


</body>
</html>