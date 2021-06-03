<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
<script  type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function del(boardid) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?boardid='+boardid;
		}
	}	
</script>
 
 	<script>
	
		function clkBtn(){
			
		
			let boardid ;
			let title = document.getElementById("title").value;			
			let content = document.getElementById("content").value;
			
			boardid = ${list3.boardid };   //게시글 번호 넣어주기
			
			let data = {boardid,title,content};
			
			$.ajax({
				type: "POST",                                 //1  type : "GET" OR "POST" 두가지를 사용할 수 있습니다.
				url: "http://localhost:8080/boardwrite/update_write",     //2  url : "/test/home" 통신을 원하는 url를 적어주시고요.
				contentType : 'application/json',             //3  contentType :  contentType을 어떻게 설정 할거냐라는 겁니다.
				data:JSON.stringify(data),                    //4  data : 통신할 데이터를 넣는 부분입니다.
				success:(result)=>{
					console.log('success',result);
					alert("수정 성공");
				},
				error:(e)=>{
					console.log('error',e);
					alert("수정 실패");
				}
			})
		}
	</script>  
<body>

<h2>게시판</h2>
<br><br><br>
<div id="outter">
	<table border="1">
	
		<tr>
			<td>수정제목:<input type="text" id="title" name="title" value="${list3.title }"/></td>
		</tr>
		<tr>
			<td>
				작성자: ${list3.writer }
				<span style="float: right;"><fmt:formatDate value="${list3.date }" pattern="yyyy.MM.dd"/></span>
			</td>
		</tr>
		<tr>
			<td>수정내용
			<textarea rows="10" cols="60" id="content" name="content" >${list3.content }</textarea>
			
			
			</td>
		</tr>
	</table>
		<div style="float: right;">
			<button type="button" onclick="clkBtn()">수정</button>
			<input type="button" value="삭제" onclick="del(${list3.boardid})">
			<input type="button" value="글 목록" onclick="location.href='/boarddtail/boarddetail_Free';">
</div>
</div>
</body>
</html>