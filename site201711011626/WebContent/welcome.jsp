<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv='Refresh'content='3; url=IndexAction'>
<title>Welcome!</title>
<style>
	#welcome1 {
		width:768px;
		margin:0 auto;
		box-sizing: border-box;
		/* border:1px solid red; */
		
		height:500px;
		padding-top: 62px;
		position: relative;
	}
	#welcome1>img {
		position : absolute;
		top : 150px;
		right : 90px;
	
	
	}
	body,h1,ul,p,h3{
		margin:0px;
		padding:0px;
	}
	
	body{
		background-color: #f5f6f7;
		background: url('img/welcome1.jpg')100% 50%;
	}
	
	#wel_h3 {
	position : absolute;
	top : 50px;
	left : 50px;
	
	}
	


</style>
</head>
<script src="js/jquery-3.2.1.min.js"></script>
<body>
	<c:forEach items="${welcome}" var="mWelcome">
		<div id="welcome1">
			<div id="wel_h3">
			<h3> ${mWelcome} 님 와인 나라에 오신걸 환영합니다.</h3>
			<p> 3초 후 이동합니다... </p>
			</div>
			<img src="img/welcome.jpg" alt="환영이미지">
		</div>
	</c:forEach>
	

</body>
</html>
