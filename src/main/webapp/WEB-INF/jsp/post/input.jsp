<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 입력</title>
	<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		<section class="contents d-flex justify-content-center">
			<div class="contents-box my-5">
				<h1 class="text-center">메모 입력</h1>
				<div class="d-flex align-items-center mt-4">
					<label class="col-2 font-weight-bold text-center">제목 : </label>
					<input id="titleInput" type="text" class="form-control">
				</div>
			
				<textarea id="contentInput" rows="10" class="form-control mt-3"></textarea>
				<input id="fileInput" type="file" class="mt-2 btn">
				<div class="d-flex justify-content-between mt-2">
					<a href="/post/list-view" class="btn btn-secondary">목록으로</a>
					<button id="saveBtn" type="button" class="btn btn-secondary">저장</button>
				</div>
			
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			
			$("#saveBtn").on("click", function(){
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0];
				
				if(title ==""){
					alert("제목을 입력하세요");
					return;
				}
				if(content ==""){
					alert("내용을 입력하세요");
					return;
				}
				
				
				var formData = new FormData();
				formData.append("title",title);
				formData.append("content",content);
				formData.append("file",file.files[0]);
				
				$.ajax({
					type:"post"
					,url:"/post/create"
					,data:formData
					,enctype:"multipart/form-data"	//파일업로드 옵션
					,processData:false
					,contentType:false
					,success:function(data){
						if(data.result=="success"){
							location.href="/post/list-view"
						} else{
							alert("메모작성에 실패했습니다.");
						}
					}
					,error:function(){
						alert("메모 저장 중 에러가 발생했습니다.");
					}
					
				});
				
			})
			
		});
	</script>

</body>
</html>