<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "qna.model.vo.Qna"%>
    <%Qna qna = (Qna)request.getAttribute("qna"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>글쓰기</title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<style>
.outer{
      width: 600px;  background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
      margin-left: auto; margin-right: auto; margin-top: 150px;
   }
   

   
#updateNoBtn{
   background-color:-internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
      width: 30%; height: 30px; /*background: 52행과 똑같이*/color: black; font-size: 15px;
      border: none; border-radius: 25px;  
  }

.h2, h2 {
    font-size: 2rem;
    margin: 50px;
}

   
</style>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	
	
	
	<div class="outer">
	
	
	<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h2 class="text-center">BOARD</h2>
		<p class="text-center">회원 게시판 수정하기</p>
	</div>
	<div class="panel-body"> <!-- 패널 사용 -->
	
	<div class="container">
	<form action="qna.res" method="post">  
	<!-- board테이블에 저장하기 위한 form. 저장한 내용을 notie.wrs 를 통해서 넣을 것이다.  -->
	
	<!-- 부트스트랩 기본 폼 사용 -->
	
	<input type ="hidden" name ="no" value='<%=request.getAttribute("no")%>'>
	<!-- 제목	 -->
	<div class="form-group">
	<label for="title">공지사항 제목</label>
	<input type="text" class="form-control" name ="title" id="title" value='<%=request.getAttribute("title")%>' placeholder=" ">
	</div>
	
	<!-- 이름 입력 폼 -->
	<div class="row">
	<div class="col-md-6"> <!-- container 안에서 grid system 사용 -->
	<div class="form-group">
	<label for="name">작성자</label>
	<br>
	<h5><strong><%= request.getAttribute("name") %></strong></h5>
	</div>
	</div>
	
	
	<!-- 비밀번호 입력 폼  -->
	<div class="col-md-6">
	<div class="form-group">
	<label for="pass">작성 날짜</label>
	<input type ="date"  class="form-control" name="date" value ="date">
	</div>
	</div>
	
	</div>  <!-- container end -->
	
	
	
	<div class="form-group">
	<label for="content">작성내용</label>
	<textarea class="form-control" rows="10" name="content" id="content"><%=request.getAttribute("content")%></textarea>
	
	</div>
	
	
	
	<!-- 버튼 저장하기, 다시쓰기, 되돌아가기 -->
	<div align="center">
	<input type="submit" id="updateNoBtn" value="저장">
	<input type="button" id="updateNoBtn" onclick = "location.href='qna.de?no=<%=request.getAttribute("no")%>'" id="cancelBtn" value="취소">
	</div>
	<!-- 되돌아가기에서 onclick이벤트로 history.back(1) 왔던곳에서 1만큼 back (-1을 써도 된다)  -->
	
	</form> <!-- 내용폼 end -->
	<!-- 값 전달 폼의 위치에 따라서 작동여부에 영향이 가니까 주의 -->
	
	</div>
	</div> <!--panel end-->
	</div>
	
	</div>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>