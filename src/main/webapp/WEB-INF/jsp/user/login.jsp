<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body class="bg-dark">

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>

		<section class="contents d-flex justify-content-center bg-white">
			<div class="join-box my-5">
				<h1 class="text-center my-4">로그인</h1>
				<input id= "idInput" type="text" class="form-control mt-2" placeholder="아이디">
				<input id= "passwordInput" type="password" class="form-control mt-2" placeholder="비밀번호">
				<button id="loginBtn" type="button" class="btn btn-secondary btn-block mt-2">로그인</button>
				<a href="/user/join-view" class="mt-3">회원가입</a>
			</div>
		</section>

		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
		
	
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$("#loginBtn").on("click",function(){
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();

				// 유효성 검사
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/login"
					, data:{"loginId":id, "password":password}
					, success:function(data){
						if(data.result == "success"){
							alert(data.userName + " 님 환영합니다!");
							location.href="/post/list-view";
						} else {
							alert("잘못된 로그인 정보입니다. \n 다시 시도해 주세요");
						}
					}
					, error:function(){
						alert("로그인 단계에서 에러가 발생했습니다. \n 다시 시도해 주세요.");
					}
					
				})
			});
		});
	
	</script>

</body>
</html>