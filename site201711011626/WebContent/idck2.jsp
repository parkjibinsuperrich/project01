<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	
	
	
	
</script>

</head>
<body>
<form action="IdckAction" id="firminsert" name="firminsert" method="post">
			${message}는 사용가능한 ID 입니다.	
			<input id="input_id" name="member_id"
					placeholder="아이디"	value="${message}" type="text">
			<button onclick="closeOk()">사용</button>
</form>
	
	
</body>
</html>