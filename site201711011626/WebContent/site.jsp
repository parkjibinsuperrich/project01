<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Site JSP</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@import
	url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

h3 {
	padding: 50px 0 10px;
	font-size: 11px;
	font-weight: normal;
	color: #5e5e5e;
	border-bottom: 1px solid #dcdcdc;
	text-align: center;
}

p {
	display: block;
	font-size: 11px;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

label {
	cursor: default;
}

ul, menu, dir {
	display: block;
	list-style-type: disc;
	margin-before: 1em;
	margin-after: 1em;
	margin-start: 0px;
	margin-end: 0px;
	padding-start: 40px;
}

#header_div1 {
	width: 240px;
	margin: 62px auto;
	font-family: 'Nanum Brush Script', serif;
	font-size: 100px;
	text-decoration: none;
	margin-bottom: 10px;
	margin-top: 10px;
}

#header_div1>a:HOVER {
	text-decoration: none;
}

#header_div {
	border: 1px solid #dadada;
	padding: 0px 0px 0px 300px;
	margin: 0px 350px;
}

#footer_id {
	border: 1px solid #dadada;
	padding: 0px 0px 0px 300px;
	margin: 0px 250px;
}

.account {
	list-style-type: none
}
</style>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="header_div1">
		<!--로고를 가운데로 오게하기위해  -->
		<a href="#">지블리</a>
	</div>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"> 
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<li><a href="insert.jsp">회원가입</a></li>
							<li class="active"><a href="login.jsp">로그인 <span
									class="sr-only">(current)</span></a></li>
							<li><a href="insert.jsp">베스트메뉴</a></li>
						</c:when>
						<c:otherwise>
							<li id="login_user">${sessionScope.loginUser.shopname}(${sessionScope.loginUser.shopid })</li>
							<li><a href="LoginOutAction">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="test.jsp">베스트메뉴</a></li>
					<li><a href="test.jsp">신상메뉴</a></li>
					<li><a href="JoinUpdate">회원정보</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

</body>
</html>