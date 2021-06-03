<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script  type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 	<script>
	
		function clkBtn(){
			
		
			let name = document.getElementById("name").value;
			let age = document.getElementById("age").value;			
			let dept = document.getElementById("dept").value;
			
			let data = {name,age,dept};
			
			$.ajax({
				type: "POST",                                 //1  type : "GET" OR "POST" 두가지를 사용할 수 있습니다.
				url: "http://localhost:8080/main",        //2  url : "/test/home" 통신을 원하는 url를 적어주시고요.
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
	
</head>
<body>
  <h1>post 데이터 입력</h1>
  
 		 <form id="tmpSendFrm" enctype="multipart/form-data" method="post">
			이름 : <input type="text" id="name" name="name" /> <br>
			나이 : <input type="text" id="age" name="age" /> <br>
			직업 : <input type="text" id="dept" name="dept" /> <br>
		
			<button type="button" onclick="clkBtn()">버튼</button>
		</form>
		
       <br><br><hr><br><br>
  
   <h1>Get 데이터 확인</h1>
   
       <table border="1" width="600px">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>직업</th>
					
				</tr>
			</thead>
				
			<tbody>
			
				<c:forEach items="${list}" var="testMember">
				 <tr>
				  <td>${testMember.id}</td>
				  <td>${testMember.name}</td>
				  <td>${testMember.age}</td>
				  <td>${testMember.dept}</td>
				 
				 </tr>
				</c:forEach>
				
			</tbody>
		</table>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       <!-- <form action="/members/" method ="post">
          이름 : <input type="text" name ="name" required/><br><br> required는 필수입력 테그
          주민번호 : <input type="text" name="security_num" patten = "\d{6}\-\d{7}" title = "123456-1234567 형식으로 입력해주세요"/><br><br>
           패스워드 : <input type="password" name="password"/><br><br>
           성별 : 남<input type="radio" name ="gender"/>
                 여<input type="radio" name ="gender"/>
                 <br><br>
           지역 : <select name ="city" size = "2" >
                 <optgroup label="">
                 <option value = "Chungju">청주</option>
                 <option value = "Deajeon">대전</option>
                 </optgroup>
                 
           
                 </select>
                 
                 <input type="submit" value = "전송">
       </form> -->
</body>
</html>