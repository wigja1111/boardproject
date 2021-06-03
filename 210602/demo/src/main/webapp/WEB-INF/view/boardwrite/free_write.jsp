<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
	table{
	margin:auto;
	}
    .centerplace{
        margin: auto;
        width: 70%;
        height: 500px;
        text-align: center;
    }
    #writearea{
        width: 80%;
        text-align: left;

    }
    
    #writer{
    float:left;
    }
    #title{
    float:left;
    }
</style>
 <script  type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 	<script>
	
		function clkBtn(){
			
		
			
			let title = document.getElementById("title").value;			
			let content = document.getElementById("content").value;
			let writer = document.getElementById("writer").value;
	
			
			let data = {title,content,writer};
			
			$.ajax({
				type: "POST",                                 //1  type : "GET" OR "POST" 두가지를 사용할 수 있습니다.
				url: "http://localhost:8080/boardwrite/free_write",     //2  url : "/test/home" 통신을 원하는 url를 적어주시고요.
				contentType : 'application/json',             //3  contentType :  contentType을 어떻게 설정 할거냐라는 겁니다.
				data:JSON.stringify(data),                    //4  data : 통신할 데이터를 넣는 부분입니다.
				success:(result)=>{
					console.log('success',result);
					alert("요청 성공");
				},
				error:(e)=>{
					console.log('error',e);
					alert("요청 실패");
				}
			})
		}
	</script>  
<body>
    <header>

    </header>
    <div class="centerplace">
        자유게시판 작성
        <hr>
        <form  method="post">
			
		
		 <table border="1">

		        <tr>
		            <th>작성자</th>
		            <td><input type="text" id="writer" name="writer" /></td>
		        </tr>
		        <tr>
		            <th>제목</th>
		            <td><input type="text" id="title" name="title" /></td>
		        </tr>
		        <tr>
		            <th>내용</th>
		            <td><textarea rows="10" cols="60" id="content" name="content"></textarea></td>
		        </tr>
   		 </table>
    
    
			<button type="button" onclick="clkBtn()">글쓰기</button>
		</form>

    </div>

</body>
</html>
