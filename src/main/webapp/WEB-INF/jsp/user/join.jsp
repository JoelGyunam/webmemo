<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body class="bg-dark">

	<div id="wrap">
	
		<header class="d-flex align-items-center p-3">
			<h1 class="ml-3">Memo</h1>
		</header>
		<section class="contents d-flex justify-content-center bg-white">
			<div class="join-box my-5">
				<h1 class="text-center my-4">회원가입</h1>
				<input id= "idInput" type="text" class="form-control mt-2" placeholder="아이디">
				<input id= "passwordInput" type="password" class="form-control mt-2" placeholder="비밀번호">
				<input id= "passwordConfirmInput" type="password" class="form-control mt-2" placeholder="비밀번호 확인">
				<input id= "nameInput" type="text" class="form-control mt-2" placeholder="이름">
				<input id= "emailInput" type="text" class="form-control mt-2" placeholder="이메일">
				<button id="joinBtn" type="button" class="btn btn-secondary btn-block mt-2">가입</button>
			</div>
		</section>
		<footer class="d-flex align-items-center justify-content-center">
			<div class="text-secondary">Copyright © Joelonseoul 2023.  All rights Reserved.</div>	
		</footer>
	
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$("#joinBtn").on("click",function(){
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();

				// 유효성 검사
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				if(password != passwordConfirm){
					alert("비밀번호가 일치하기 잔습니다.");
					return;
				}
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				if(email == ""){
					alert("이메일을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":id, "password":password, "name":name, "email":email}
					, success:function(data){
						if(data.result == "success"){
							location.href="/user/login-view";
						} else {
							alert("가입에 실패했습니다. \n 다시 시도해 주세요");
						}
					}
					, error:function(){
						alert("가입 단계에서 에러가 발생했습니다. \n 다시 시도해 주세요.");
					}
					
				})
			});
		});
	
	</script>

</body>
</html>