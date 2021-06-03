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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
</head>
<style>
    header{
        height: 200px;
        background-color: #000000;
        
        
    } 
    nav{
        background-color: antiquewhite;
    }
    .header-div{
        
        font-size: 10px;
        color:#ffffff;
        text-align: center;   
        
    }
    .mainbody{
        
        height: 1000px;
        margin: auto;
        text-align: center;
        width: 50%;
    }
    footer{
        height: 300px;
        background-color: aquamarine;
    }
 

    a{
  	text-decoration : none;
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
    .off-screen {
	display: none;
    }
    #board-num {
	width: 500px;
	margin: auto;
    display: inline;
    
    }
    #board-num a {
        display: inline-block;
        padding: 3px 5px;
        margin-right: 10px;
        font-family:Tahoma;
        background: #ccc;
        color: #000;
        text-decoration: none;  
    }
    #board-num a.active {
        background: #333;
        color: #fff;
    }

    .bno_width{
        width: 10%;
    }
    .title_width{
        width: 40%;
    }
    .writer_width{
        width: 20%;
    }
    .regdate_width{
        width: 10%;
    }
    .updatedate_width{
        width: 10%;
    }
    .board-search{
        width: 20%;
    }

    .board-newwrite{
        text-align: end;
    }

</style>  
<body>
    <header >
       
        <div class="header-div">
            <h1>안녕</h1>
            <a href="/main.html">dd</a>
        </div>
        
    </header>
        <div class="mainbody">
            <form action="" id="setRows">
                <p>
                    한 페이지당
                    <input type="text" name="rowPerPage" value="3" style="width: 30px;">
                    개의 게시물 보이기
                </p>
            </form>


            <div class="table_wrap">
            
                <table id="products">
                    <thead>
                        <tr>
                            
                            <th class="title_width">제목</th>
                            <th class="writer_width">작성자</th>
                            <th class="regdate_width">작성일</th>
                            <th class="updatedate_width">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
          			 	<c:forEach var ="list2" items="${list2}" >
					  		<tr>
					  			
					  			<td><a href='detail?boardid=<c:out value = "${list2.boardid}"/>'><c:out value = "${list2.title}"/></a></td>
					  			<td><c:out value = "${list2.content}"/></td>
					  			<td><c:out value = "${list2.writer}"/></td>
					  			<td><c:out value = "${list2.click_num}"/></td>
					  		</tr>
					  	</c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="margin-top: 10px;">
                    <select >
                        <option value="search-title">글제목</option>
                        <option value="search-content">글내용</option>
                        <option value="search-writer">작성자</option>
                    </select>
               
                    <input class="board-search" type="text" placeholder="검색어를 입력해 주세요." >
                    <input type="submit" value="검색">
                        <div class="board-newwrite"> 
                                <input type="button" value="글쓰기" onClick="location.href='/boardwrite/free_write'">
                        </div>
                </div>
            </div>
       
        </div>


    <footer>
        
    </footer>



</body>
    <script>
              var $setRows = $('#setRows');

            $setRows.submit(function (e) {
                e.preventDefault();
                var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

            //		console.log(typeof rowPerPage);

                var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
                if (!rowPerPage) {
                    alert(zeroWarning);
                    return;
                }
                $('#board-num').remove();
                var $products = $('#products');

                $products.after('<div id="board-num">');


                var $tr = $($products).find('tbody tr');
                var rowTotals = $tr.length;
            //	console.log(rowTotals);

                var pageTotal = Math.ceil(rowTotals/ rowPerPage);
                var i = 0;

                for (; i < pageTotal; i++) {
                    $('<a href="#"></a>')
                            .attr('rel', i)
                            .html(i + 1)
                            .appendTo('#board-num');
                }

                $tr.addClass('off-screen')
                        .slice(0, rowPerPage)
                        .removeClass('off-screen');

                var $pagingLink = $('#board-num a');
                $pagingLink.on('click', function (evt) {
                    evt.preventDefault();
                    var $this = $(this);
                    if ($this.hasClass('active')) {
                        return;
                    }
                    $pagingLink.removeClass('active');
                    $this.addClass('active');

                    // 0 => 0(0*4), 4(0*4+4)
                    // 1 => 4(1*4), 8(1*4+4)
                    // 2 => 8(2*4), 12(2*4+4)
                    // 시작 행 = 페이지 번호 * 페이지당 행수
                    // 끝 행 = 시작 행 + 페이지당 행수

                    var currPage = $this.attr('rel');
                    var startItem = currPage * rowPerPage;
                    var endItem = startItem + rowPerPage;

                    $tr.css('opacity', '0.0')
                            .addClass('off-screen')
                            .slice(startItem, endItem)
                            .removeClass('off-screen')
                            .animate({opacity: 1}, 300);

                });

                $pagingLink.filter(':first').addClass('active');

            });


            $setRows.submit();
    </script>
</html>