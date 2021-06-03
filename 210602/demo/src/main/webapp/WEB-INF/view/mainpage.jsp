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
 <script  type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
<style>
  
  header{
        background-color: aqua;
        height: 100px;
    }
    .centerplace{
        width: 50%;
        margin: auto;
    }
    .board-section1{
        width: 48%;
        float: left;
    
    }
    .board-section2{
        width: 48%;
        float: right;
    }
    .board-section3{
        width: 48%;
        float: left;
    
    }
    .board-section4{
        width: 48%;
        float: right;
    }
    table{
        border-collapse: collapse;
        width: 100%;    
        margin-top : 20px;
        text-align: center;
        table-layout: fixed;
        margin-bottom: 10px;
    }
    td, th{
        border-bottom : 1px solid #353535;
        height: 50px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    th{
        font-size : 17px;
    }
</style>
<body>
    <header>

    </header>
    <div class="centerplace">

   
    <div class="board-section1">
           <div class="table_wrap" style="">
                <div style="">
                    <p style="float: left;">자유게시판</p>
                    <p style="float: right;"><a href="/boarddtail/boarddetail_Free">더보기</a></p>
                </div>
                <table id="products">
                    <thead>
                        <tr>
                         <th class="title_width">제목</th>
                        <th class="writer_width">작성자</th>
                        <th class="regdate_width">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                      	<c:forEach var ="list1" items="${list1}" >
					  		<tr>
					  			
					  			<td><a href='/board/get?bno=<c:out value = "${list1.title}"/>'><c:out value = "${list1.title}"/></a></td>
					  			<td><c:out value = "${list1.content}"/></td>
					  			<td><c:out value = "${list1.writer}"/></td>
					  		</tr>
					  		</c:forEach>
                     
                     </tbody>
                </table>
            </div>
        </div>
    <div class="board-section2">
        <div class="table_wrap">
            <div style="">
                <p style="float: left;">외주게시판</p>
                <p style="float: right;"><a href="/index.html">더보기</a></p>
            </div>
            <table id="products">
                <thead>
                    <tr>
                        
                        <th class="title_width">제목</th>
                        <th class="writer_width">작성자</th>
                        <th class="regdate_width">작성일</th>
                        
                    </tr>
                </thead>
                <tbody>
               
	                   		<c:forEach var ="list1" items="${list1}" >
					  		<tr>
					  			
					  			<td><a href='/board/get?bno=<c:out value = "${list1.title}"/>'><c:out value = "${list1.title}"/></a></td>
					  			<td><c:out value = "${list1.content}"/></td>
					  			<td><c:out value = "${list1.writer}"/></td>
					  		</tr>
					  		</c:forEach>
                 </tbody>
            </table>
        </div>
    </div>
    <div class="board-section3">
        <div class="table_wrap">
            <div style="">
                <p style="float: left;">홍보게시판</p>
                <p style="float: right;"><a href="/index.html">더보기</a></p>
            </div>
            <table id="products">
                <thead>
                    <tr>
                        <th class="bno_width">번호</th>
                        <th class="title_width">제목</th>
                        <th class="writer_width">작성자</th>
                        <th class="regdate_width">작성일</th>
                        <th class="updatedate_width">수정일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>제목 내용</td>
                        <td>작성자 내용</td>
                        <td>작성일 내용</td>
                        <td>수정일 내용</td>
                    </tr>
                   
                 </tbody>
            </table>
        </div>
    </div>
    <div class="board-section4">
        <div class="table_wrap">
            <div style="">
                <p style="float: left;">질문게시판</p>
                <p style="float: right;"><a href="/index.html">더보기</a></p>
            </div>
            <table id="products">
                <thead>
                    <tr>
                        <th class="bno_width">번호</th>
                        <th class="title_width">제목</th>
                        <th class="writer_width">작성자</th>
                        <th class="regdate_width">작성일</th>
                        <th class="updatedate_width">수정일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>제목 내용</td>
                        <td>작성자 내용</td>
                        <td>작성일 내용</td>
                        <td>수정일 내용</td>
                    </tr>
                   
                 </tbody>
            </table>
        </div>
    </div>
</div>
    <footer>

    </footer>

</body>
</html>