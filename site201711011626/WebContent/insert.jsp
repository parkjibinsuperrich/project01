<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
a{
	padding: 0 8px;
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
		$("#sample6_postcode").blur(function(){
			if($("#sample6_postcode").val()==""){
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
	
		$("#input_phone").blur(function(){
			if($("#input_phone").val()==""){
				$("#span_phone").css("display","block");
			}else if(!($.isNumeric($("#input_phone").val()))){
				$("#span_phone2").css("display","block");
				$("#span_phone").css("display","none");
			}else{
				$("#span_phone2").css("display","none");
				$("#span_phone").css("display","none");
			}
		});
		
		
		
		
	});

	$(document).on("click",".btn13",function() { 
	
	
		
		var 
		/* form = $("#firminsert"), */ 
		uid = $("#input_id"), 
		uname = $("#input_name"), 
		upw = $("#input_pw"),
		upw2 = $("#input_pw2"),
		uaddress = $("#sample6_postcode"),
		uphone = $("#input_phone");
		
		
		var id = $.trim(uid.val());
		var pw = $.trim(upw.val());
		var pw2 = $.trim(upw2.val());
		var address = $.trim(uaddress.val());
		var name = $.trim(uname.val()); 
		var phone = $.trim(uphone.val());
		var hidden = $("#ckuid").val();
		var jbck = $("#jbck").val();
		var uid2 = $("#uid2").val();
		
		
		if(id ==""){
			uid.focus();
			$("#span_id").css("display","block"); 
			return false;
		}
		if(pw ==""){
			upw.focus();
			$("#span_pw").css("display","block"); 
			return false;
		}
		if(pw2 ==""){
			upw2.focus();
			$("#span_pw2").css("display","block"); 
			return false;
		}
		if(pw2 != pw){
			upw2.focus();
			$("#span_pw3").css("display","block"); 
			return false;
		}
		if(address ==""){
			uaddress.focus();
			$("#span_address").css("display","block");
			return false;
		}
		if(name ==""){
			uname.focus();
			$("#span_select").css("display","block");
			return false;
		}
		
		if(phone ==""){
			uphone.focus();
			$("#span_phone").css("display","block");
			return false;
		}else if(!($.isNumeric(phone))){
			uphone.focus();
			$("#span_phone2").css("display","block");
			return false;
		}
	
		if(hidden=="1"){
			uid.focus();
			$("#span_check1").css("display","block");
			return false;
		}
		/* if(jbck != id){
			uid.focus();
			$("#span_check1").css("display","block");
			return false;
		} */	
		
		if(uid2 != id){
			uid.focus();
			$("#span_check1").css("display","block");
			return false;
		}
		
		
		$("#firminsert").submit();
		
		 
	});

	/* function checked() {
		firminsert.submit();
	} 자바스크립트로 submit 시킨것*/ 
	$(document).on("click","#idck_btn",function() {
		
		var 
		/* form = $("#firminsert"), */ 
		uid = $("#input_id"); 
	
		
		var id = $.trim(uid.val());
		var jbck = $("#jbck").val();
		var uid2 = $("#uid2").val();
		
		
		if(id==""){
			$("#span_id").css("display","block");
			return false;
		}
		
		
		$("#span_check1").text("중복체크 해주세요").css("display","none");
		
		
		/* var id = $("#input_id").val();
		$("#jbck").val(id); */

		//새창의 크기
		cw=550;
		ch=300;
		//스크린의 크기
		sw=screen.availWidth;
		sh=screen.availHeight;
		//열 창의 포지션
		px=(sw-cw)/2;
		py=(sh-ch)/2;
		//검색할 ID값
		var id=$("#input_id").val();
	
		var url ="IdckAction?ckid="+id;
		window.open(url,"_blank_1",
					"toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no,left="
					+px+", top="+py +", width="+ cw+", height="+ch); 
	});
	
	 
</script>
</head>
<body>

	<%@ include file="site.jsp" %>
	
	<h3>
		<strong>기본정보 |</strong>다음은 회원가입을 위한 <strong>필수 입력</strong> 항목입니다.
	</h3>
	<div id="div_login">
	<form action="InsertAction" id="firminsert" name="firminsert" method="post">
	<div id="header_div">
		<table style="width: 80%">
			<tr>
				<th scope="row">아이디<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_id" name="member_id"
					placeholder="아이디"	value="" type="text">
					<input type="button" id="idck_btn" value="중복체크">
					<span id="span_id" class="span_ck">ID를 입력하세요</span>
					<span id="span_check1" style="display:none">아이디 중복 체크를 해주세요.</span></td>
					<input type="hidden" id="ckuid" name="ckuid" value ="1">
					<input type="hidden" id="jbck" name="jbck">
					<input type="hidden" id="uid2" name="uid2">
			</tr> 
			<tr>
				<th scope="row">비밀번호<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_pw" name="member_pw"
					type="password" placeholder="비밀번호"><span id="span_pw" class="span_ck">비밀번호를 입력하세요.</span></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_pw2" name="user_passwd_confirm"
					value="" type="password" placeholder="비밀번호 확인"><span id="span_pw2" class="span_ck">비밀번호를 입력하세요.</span>
					<span id="span_pw3" class="span_ck">비밀번호가 일치하지 않습니다.</span>
					</td>
			</tr>
			<tr>
				<th scope="row">이름<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_name" name="member_name"
					placeholder="이름" maxlength="30" value=""type="text">
					<span id="span_name" class="span_ck">이름을 입력하세요.</span></td>
			</tr>
			<tr>
				<th scope="row">주소<img src="img/site.PNG" alt="필수"></th>
				<td>
					<input id="sample6_postcode" name="member_addr""
					placeholder="우편번호"  readonly="readonly"value="" type="text">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" readonly="readonly" name="member_addr2"><br>
					<input type="text" id="sample6_address2" placeholder="상세주소" name="member_addr3">
					<span id="span_address" class="span_ck">주소를 입력하세요.</span></td>
			</tr>
			<tr>
				<th scope="row">휴대전화<img src="img/site.PNG" alt="필수"></th>
				<td><input id="input_phone" name="member_phone" maxlength="15"value="" type="text">
				<span id="span_phone" class="span_ck">휴대폰번호를 입력해주세요</span>
					<span id="span_phone2" class="span_ck">숫자만 입력해주세요</span>
				</td>

			</tr>
			
			<tr>
				<th scope="row">이메일<img src="img/site.PNG" alt="필수"></th>
				<td><input id="email1" name="member_email"value="" type="text">
				</td>

			</tr>
	
		</table>
	</div>

	</form>
	</div>
	<div class="div_index">
			<!-- <a href="javascript:checked()" class="btn_index btn13">등 록</a> <a -->
			<a href="#" class="btn_index btn13">등 록</a> 
			<a href="index.html"class="btn_index btn24">취 소</a>
		</div>
</body>
</html>