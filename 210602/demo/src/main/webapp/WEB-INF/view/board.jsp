<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script  type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
</head>
<body>
  <h1>Get 데이터 출력</h1>
  
  
  <table border="1">
  		<colgroup>
  			<col width ="50">
  			<col width ="130">
  			<col width ="100">
  			<col width ="100">
  		</colgroup>
  		<tr>
  			<th>id1</th>
  			<th>name</th>
  			<th>age</th>
  			<th>dept</th>
  		</tr>
  		<c:forEach var ="list" items="${list}" >
  		<tr>
  			<td><c:out value = "${list.id}"/></td>
  			<td><a href='/board/get?bno=<c:out value = "${list.name}"/>'><c:out value = "${list.name}"/></a></td>
  			<td><c:out value = "${list.age}"/></td>
  			<td><c:out value = "${list.dept}"/></td>
  		</tr>
  		</c:forEach>
  		
  		<tr>
  			<td colspan="4" align="right">
  				<input type="button" value ="글쓰기" onclick="">
  				
  			</td>
  		</tr>
  </table>
 	
</body>
</html>