<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "notice.model.vo.Notice"%>
    <%Notice notice = (Notice)request.getAttribute("notice"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h1 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}
.page-title p {
  
  color: #333333;
  font-weight: 400;
  text-align: center;
}
#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-count {
  width: 40px;
  text-align: center;
}
.board-table .th-count2 {
  width: 75px;
  text-align: center;
}
.board-table .th-count3 {
  width: 60px;
  text-align: left;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;

}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #fffff;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

.notice{
	margin-top:100px;
}
/*버튼 */
#writeNoBtn{
    background-color:-internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
      width:10%; height: 30px; /*background: 52행과 똑같이*/color: black; font-size: 15px;
      border: none; border-radius: 25px;  
  }
  #title:hover{
  	cursor:pointer;
  }

</style>

<title>Insert title here</title>

</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
<section class="notice">
  <div class="page-title">
        <div class="container">
        	<h1>NOTICE</h1>
            <p>공지사항 입니다.</p>
        </div>
    </div>

    <!-- board seach area -->
   <!--  <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div> -->
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
        <form action="notice.re" id="detailForm" name="detailForm" method="post">
            <table class="board-table">
                <thead>
                <tr>
                	<!-- 게시판 넘버 넘겨주기 위해서 -->
                	<input type = "hidden" value = "<%=notice.getNoticeNo() %>" name = "no">
                	
                	
                    <td scope="col" class="th-num">제목</td>
                    <td scope="col" class="th-title">
                    <input type = "hidden" value = " <%=notice.getNoticeTitle() %>" name ="title">
                    <strong><%=notice.getNoticeTitle() %></strong></td>
                </tr>
                	
                <tr>
                    <td scope="col" class="th-num">작성자</td>
                    <td scope="col" class="th-title">
                    <input type = "hidden" value = "<%=notice.getAdminNo() %>" name ="name">
                    <%=notice.getAdminNo() %></td>
                    
                    
                    <td scope="col" class="th-count">작성일</td>
                    <td scope="col" class="th-count2">
                    <%=notice.getNoticeDate() %></td>
                    
                    
                    
                 <td scope="col" class="th-count">조회수</td>
                 <td scope="col" class="th-count3"><%=notice.getNoticeCount() %></td> 
				  </tr>
                  
                </thead>
                <tbody>
              
      
			
               <tr>
                    <td scope="col" class="th-num">글내용</td>
                    <td scope="col" colspan = "3" class="th-content">
                    <input type = "hidden" value = "<%=notice.getNoticeContent() %>" name ="content">
                    <%=notice.getNoticeContent() %></td>
                    <td></td>
                    <td></td>
                  
				  </tr>
                
               
              
                </tbody>
            </table>
        </div>
        <br><br>
         
        <div align="center">
    <% if(loginAdmin != null && loginAdmin.getAdminNo().equals(notice.getAdminNo())){ %> 
          <input type ="submit"  id = "writeNoBtn" value ="수정하기">
          <input type="button" id="writeNoBtn" onclick= "deleteNotice();" id="cancelBtn" value="삭제하기">
       <%} %> 
          <input type="button" id="writeNoBtn" onclick = "location.href='notice.li'"  id="cancelBtn" value="이전으로">
         </div>
        </form>
    </div>
    <script>
    function deleteNotice(){
    	var deleteNotice = confirm('정말 삭제하시겠습니까?');
    	if(deleteNotice){
    		alert("삭제되었습니다.");
			location.href='<%=request.getContextPath()%>/notice.del?no='+<%=notice.getNoticeNo()%>;
		}
    }
    
    </script>

</section>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>