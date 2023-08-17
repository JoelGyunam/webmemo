<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 보기</title>
	<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		<section class="contents d-flex justify-content-center">
			<div class="contents-box my-4">
				<h1 class="text-center">메모 보기</h1>
				<div class="d-flex align-items-center mt-4">
					<label class="col-2 font-weight-bold text-center">제목 : </label>
					<input id="titleInput" type="text" class="form-control" value="${post.subject }">
				</div>
			
				<textarea id="contentInput" rows="10" class="form-control mt-3">${post.content }</textarea>
				<img alt="" src="${post.imagePath} ">
				<div class="d-flex justify-content-between mt-2">
					<div>
						<a href="/post/list-view" class="btn btn-secondary">목록으로</a>
						<button id="deleteBtn" data-post-id="${post.id}" type="button" class="btn btn-danger">삭제하기</button>
					</div>
					<button id="saveBtn" type="button" data-post-id="${post.id}" class="btn btn-secondary">수정하기</button>
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
			
			$("#deleteBtn").on("click",function(){
				let postId = $(this).data("post-id");

				if(confirm("메모를 삭제할까요?")){
					$.ajax({
						type:"delete"
						,url:"/post/delete"
						,data:{"id":postId}
						,success:function(data){
							if(data.result=="success"){
								alert("메모를 삭제했습니다.");
								location.href="/post/list-view"
							} else{
								alert("삭제에 실패했습니다.");
							}
						}
						,error:function(){
							alert("메모 삭제 중 에러가 발생했습니다.");
						}
					});
				}
			});
			
			$("#saveBtn").on("click", function(){
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				let postId = $(this).data("post-id");
				
				if(title ==""){
					alert("제목을 입력하세요");
					return;
				};
				if(content ==""){
					alert("내용을 입력하세요");
					return;
				};
				
				$.ajax({
					type:"put"
					,url:"/post/update"
					,data:{"id":postId, "subject":title, "content":content}
					,success:function(data){
						if(data.result=="success"){
							location.href="/post/list-view"
						} else{
							alert("메모수정에 실패했습니다.");
						}
					}
					,error:function(){
						alert("수정사항을 저장 중 에러가 발생했습니다.");
					}
					
				});
				
			})
			
		});
	</script>

</body>
</html>