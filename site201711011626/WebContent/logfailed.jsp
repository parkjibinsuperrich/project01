<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Site JSP</title>
<link href="css/bootstrap.min.css"rel ="stylesheet">
<link href="css/login.css"rel ="stylesheet">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
#header_div1 {
	width: 240px; 
	margin: 62px auto;
	font-family: 'Nanum Brush Script', serif;	
	font-size: 100px;
	text-decoration:none;
	margin-bottom: 10px;
	margin-top: 10px;
	
}

#login{
	font-family: 'Nanum Pen Script', serif;
	font-size: 50px;
	border: solid 1px #dadada;
}

#header_div1>a:HOVER {
	text-decoration: none;
}

#idpw_div {
	width: 240px;
	margin: 62px auto;
	
}
#login_bt{
	padding:10px;
}
.div_input {
	background-color: white;
	margin-bottom: 14px;
	padding: 10px 35px 10px 15px;
	width: 408px;
	height: 29px;
}

#logfailed{
	font-size:15px;
	color:red;
}

</style>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	$(document).on("click",".float",function() { 
		
		
		
		
		$("#firminsert").submit();
		
		
	});

	/* function checked() {
		firminsert.submit();
	} 자바스크립트로 submit 시킨것*/ 
	
	
</script>
<script src="js/bootstrap.min.js"></script>
</head>
<body> 
	
			<%@ include file="site.jsp" %>
			
			<div id="login" class="login">
  <div class="heading">
    Login♥ 
    <form action="LoginAction" id="firminsert" name="firminsert" method="post">

      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" name="id" class="form-control" placeholder="Username or email">
          </div>
 
        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" name="pw" class="form-control" placeholder="Password">
        </div>
       </form>
       <span id = "logfailed">아이디와 패스워드를 확인해주세요.</span>
		<div id="login_bt">
       <a herf="#"><img src="img/login.PNG" class="float" alt="Fl" width="200" height="45" ></a>
       </div>
     
 		</div>
 </div>
		
			 
</body>
</html>