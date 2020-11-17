<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<title>회원가입</title>
</head>
<body>
<form method="post" action="joinAction.jsp">
	<div class="container">
		<div class="row mt-5">
			<div class="col-4"></div>
			<div class="col-4" align="center">
				<h1>회원가입</h1>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"><div>아이디</div><div><input name="mem_uid" type="text" class="form-control" id="id"></div>
			<label class="id_label" style="display:none;"></label></div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"><div>비밀번호</div> <div><input name="mem_passwd" type="password" class="form-control" id="pawd"></div>
			<label class="pawd_label" style="display:none;"></label></div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"><div>비밀번호 확인</div><div><input type="password" class="form-control" id="pawdcf"></div>
			<label class="pawdcf_label" style="display:none;"></label></div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"><div>이메일</div><div><input name="mem_email"type="email" class="form-control"></div></div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col-4"><input id="register" type="submit" class="btn btn-dark btn-lg btn-block" value="회원가입" /></div>
			<div class="col-4"></div>
		</div>
		
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
<script>
$(function(){
	$('#id').blur(function(){
		if($("#id").val().length == 0) {
			$(".id_label").text("아이디를 입력하세요");
			$(".id_label").css('color', 'red');
			$(".id_label").css('display', 'block');
			this.focus();
			$('#register').prop('disabled', true);
			return;
		}
		if($("#id").val().length <5 || $("#id").val().length > 13) {
			$(".id_label").text("아이디는 5~13자로 입력하세요");
			$(".id_label").css('color', 'red');
			$(".id_label").css('display', 'block');
			this.focus();
			$('#register').prop('disabled', true);
			return;
		} else {
			$(".id_label").css('display', 'none');
			$('#register').prop('disabled', false);
		}
	});
			
	$("#pawdcf").blur(function(){
		if($("#pawd").val() != $("#pawdcf").val()){
			$(".pawdcf_label").text("비밀번호가 일치하지 않습니다");
			$(".pawdcf_label").css('color','red');
			$(".pawdcf_label").css('display','block');
			$("#pawd").val("");
			$("#pawd").focus();
			$('#register').prop('disabled', true);
			return;
		}else{
			$(".pawdcf_label").text("");
			$(".pawdcf_label").css('display','none');
			$('#register').prop('disabled', false);
			
		}
	});
});

</script>
</html>