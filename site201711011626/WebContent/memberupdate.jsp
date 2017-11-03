<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Site JSP</title>
<link href="css/bootstrap.min.css"rel ="stylesheet">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
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
.account{
	list-style-type:none
}
.span_ck{
	font-size:12px;
	color:#e85a71;
	font-family: 'Nanum Gothic', serif; 
	display:none;
}
.div_index{
	margin: 0 auto;
	width:200px;
	padding-top: 15px;
}

</style>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#input_id").blur(function(){
			if($("#input_id").val()==""){
				$("#span_id").css("display","block");
			}else{
				$("#span_id").css("display","none");
			}
		});
		$("#input_pw").blur(function(){
			if($("#input_pw").val()==""){
				$("#span_pw").css("display","block");
			}else{
				$("#span_pw").css("display","none");
			}
		});
		$("#input_pw2").blur(function(){
			if($("#input_pw2").val()==""){
				$("#span_pw2").css("display","block");
			}else{
				$("#span_pw2").css("display","none");
			}
		});
		$("#input_pwanswer").blur(function(){
			if($("#input_pwanswer").val()==""){
				$("#span_pwanswer").css("display","block");
			}else{
				$("#span_pwanswer").css("display","none");
			}
		});
		$("#input_address").blur(function(){
			if($("#input_address").val()==""){
				$("#span_address").css("display","block");
			}else{
				$("#span_address").css("display","none");
			}
		});
		$("#input_name").blur(function(){
			if($("#input_name").val()==""){
				$("#span_name").css("display","block");
			}else{
				$("#span_name").css("display","none");
			}
		});
		$("#input_select").blur(function(){
			if($("#input_select").val()=="질문을 선택해주세요."){
				$("#span_select").css("display","block");
			}else{
				$("#span_select").css("display","none");
			}
		});
		$("#input_age").blur(function(){
			if($("#input_age").val()==""){
				$("#span_age").text("나이를 입력하세요.").css("display","block");
 				$("#span_age1").css("display","none");  
			}else if(!($.isNumeric($("#input_age").val()))){
				$("#span_age").text("숫자만 입력하세요.").css("display","block");
			}/* else if(($("#input_age").val().length>2) || ($("#input_age").val()==0)){
				$("#span_age").text("1~99세 이하만 입력하세요.").css("display","block");
			} */else if(($("#input_age").val()<22) || ($("#input_age").val()>40)){
				$("#span_age").text("22~40세 사이만 입력하세요.").css("display","block");
			}else{
				$("#span_age").css("display","none");
 				$("#span_age1").css("display","none"); 
			}
		});
		$("#input_major").blur(function(){
			if($("#input_major").val()==""){
				$("#span_major").css("display","block");
			}else{
				$("#span_major").css("display","none");
			}
		}); 
		$("#input_phone").blur(function(){
			if($("#input_phone").val()==""){
				$("#span_phone").css("display","block");
			}else if(!($.isNumeric($("#input_phone").val()))){
				$("#span_phone1").css("display","block");
				$("#span_phone").css("display","none");
			}else{
				$("#span_phone1").css("display","none");
				$("#span_phone").css("display","none");
			}
		});
		
		/*  */
		
		
	});

	$(document).on("click",".btn13",function() { 
		
		var 
		/* form = $("#firminsert"), */ 
		uid = $("#input_id"), 
		uname = $("#input_name"), 
		uage = $("#input_age"), 
		umajor = $("#input_major"), 
		upw = $("#input_pw"),
		upw2 = $("#input_pw2"),
		uaddress = $("#sample6_postcode"),
		uaddress2 = $("#sample6_address"),
		uaddress3 = $("#sample6_address2"),
		uselect = $("#input_select"),
		uphone = $("#input_phone");
		
		var id = $.trim(uid.val());
		var pw = $.trim(upw.val());
		var pw2 = $.trim(upw.val());
		var address = $.trim(uaddress.val());
		var address2 = $.trim(uaddress2.val());
		var address3 = $.trim(uaddress3.val());
		var name = $.trim(uname.val()); 
		var select = $.trim(uselect.val()); 
		var age = $.trim(uage.val());
		var major = $.trim(umajor.val());
		var phone = $.trim(uphone.val());
		
		
		if(id ==""){
			uid.focus();
			$("#span_id").css("display","block"); 
			return false;
		}
		
		
		if(address ==""){
			uaddress.focus();
			$("#span_address").css("display","block");
			return false;
		}
		if(address2 ==""){
			uaddress2.focus();
			$("#span_address").css("display","block");
			return false;
		}
		if(address3 ==""){
			uaddress3.focus();
			$("#span_address").css("display","block");
			return false;
		}
		if(name ==""){
			uname.focus();
			$("#span_select").css("display","block");
			return false;
		}
		
		
		
		$("#firminsert").submit();
		
		
	});

	/* function checked() {
		firminsert.submit();
	} 자바스크립트로 submit 시킨것*/ 
	
	
</script>
</head>
<body>

	<%@ include file="site.jsp" %>
	
	<h3>
		<strong>회원수정</strong>
	</h3>
	
	
	<div id="div_login">
	<form action="JoinUpdate" id="firminsert" name="firminsert" method="post">
	<c:forEach items="${memberupdate}" var="muDto">
	<div id="header_div"> 
		<table style="width: 80%">
		
			<tr>
				<th scope="row">아이디<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_id" name="shopid" readonly="readonly"
					fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
					fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="아이디"
					value="${sessionScope.loginUser.shopid}" type="text"><span id="span_id" class="span_ck">ID를 입력하세요</span></td>

			</tr>
		
			
			<tr>
				<th scope="row">이름<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_name" name="shopname"
					fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg=""
					class="ec-member-name" placeholder="이름" maxlength="30" value="${sessionScope.loginUser.shopname}"
					type="text"><span id="span_name" class="span_ck">이름을 입력하세요.</span></td>

			</tr>
				<tr>
				<th scope="row">주소<img src="img/site.PNG" alt="필수"></th>
				<td>
					<input id="sample6_postcode" name="member_addr"" fw-filter=""	
					fw-label="주소" fw-msg="" class="inputTypeText" placeholder="우편번호"  readonly="readonly"
					value="${sessionScope.loginUser.shopaddr}"  type="text">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" readonly="readonly" value="${sessionScope.loginUser.shopaddr2}"  name="member_addr2"><br>
					<input type="text" id="sample6_address2" placeholder="상세주소" value="${sessionScope.loginUser.shopaddr3}"  name="member_addr3">
					<span id="span_address" class="span_ck">주소를 입력하세요.</span></td>
				

			</tr>
			<tr>
				<th scope="row">휴대전화<img src="img/site.PNG" alt="필수"></th>
				<td><input id="mobile2" name="shopphone" maxlength="20"
					fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
					fw-msg="" value="${sessionScope.loginUser.shopphone}" type="text"></td>

			</tr>
			
			<tr>
				<th scope="row">이메일<img src="img/site.PNG" alt="필수"></th>
				<td><input id="email1" name="shopemail" fw-filter="isFill"
					fw-label="이메일" fw-alone="N" fw-msg="" value="${sessionScope.loginUser.shopemail}" type="text">
				</td>

			</tr>
		
		</table>
	</div>
	</c:forEach>

	</form>
	</div>
	<div class="div_index">
			<!-- <a href="javascript:checked()" class="btn_index btn13">등 록</a> <a -->
			<a href="#" class="btn_index btn13">회원수정</a> 
			<a href="index.html"class="btn_index btn24">취 소</a>
		</div>
</body>
</html>