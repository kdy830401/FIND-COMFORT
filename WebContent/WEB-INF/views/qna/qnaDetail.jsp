<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "qna.model.vo.Qna,qna.model.vo.Reply, java.util.ArrayList"%>
    <% Qna qna = (Qna)request.getAttribute("qna"); 
    ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
    %>
    

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	
<style>

.img-radius {
	    border-radius: 48px;
	    height: 90px;
	    
	}
	
	
	img{
	
		width : 100%;
			
	}


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
/* 
댓글 */

.comments-details button.btn.dropdown-toggle,
.comments-details .total-comments {
    font-size: 18px;
    font-weight: 500;
    color: #5e5e5e;
}
.comments-details {
    padding: 15px 15px;
}
.comments .comments .dropdown,
.comments .dropup {
    position: relative;
}
.comments button {
    background-color: transparent;
    border: none;
}
.comments .comment-box {
    width: 100%;
    float: left;
    height: 100%;
    background-color: #FAFAFA;
    padding: 10px 10px 10px;
    margin-bottom: 15px;
    border-radius: 13px;
    border: 1px solid #ddd;
}
.comments .add-comment {
    background-color: transparent;
    border: none;
    position: relative;
    margin-bottom: 50px;
}
.comments .commenter-pic {
    width: 50px;
    height: 50px;
    display: inline-block;
    border-radius: 100%;
    border: 2px solid #fff;
    overflow: hidden;
    background-color: #fff;
}
.comments .add-comment .commenter-name {
    width: 100%;
    padding-left: 75px;
    position: absolute;
    top: 20px;
    left: 0px;
}
.comments .add-comment input {
    border-top: 0px;
    border-bottom: 1px solid #ccc;
    border-left: 0px;
    border-right: 0px;
    outline: 0px;
    box-shadow: none;
    border-radius: 0;
    width: 100%;
    padding: 0;
    font-weight: normal;
}
.comments .add-comment input:focus {
    border-color: #03a9f4;
    border-width: 2px;
}
.comments .add-comment button[type=submit] {
    background-color: #03a9f4;
    color: #fff;
    margin-right: 0px;
}
.comments .add-comment button {
    background-color: #f5f5f5;
    margin: 10px 5px;
    font-size: 14px;
    text-transform: uppercase;
    float: right;
}
.comments .commenter-name .comment-time {
    font-weight: normal;
    margin-left: 8px;
    font-size: 15px;
}
.comments p.comment-txt {
    font-size: 15px;
    border-bottom: 1px solid #ddd;
    padding: 0px 0px 15px;
}
.comments .commenter-name {
    display: inline-block;
    position: relative;
    top: -20px;
    left: 10px;
    font-size: 16px;
    font-weight: bold;
}
.comments .comment-meta {
    font-size: 14px;
    color: #333;
    padding: 2px 5px 0px;
    line-height: 20px;
    float: right;
}
.comments .reply-box {
    display: none;
}
.comments .replied {
    background-color: #fff;
    width: 95%;
    float: right;
    margin-top: 15px;
}

/*======Responsive CSS=======*/
@media (max-width: 767px){
.comments .commenter-name {
    font-size: 13px;
    top: -5px;
}
.comments .commenter-pic {
    width: 40px;
    height: 40px;
}
.comments .commenter-name a{
  display: block;
}
.comments .commenter-name .comment-time{
  display: block;
  margin-left: 0px;
}
}
.comment-box{
	background : #EFEFEF;
	
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
        	<h1>BOARD</h1>
            <p>회원 게시판입니다.</p>
        </div>
    </div>

  <!-- board list area -->
    <div id="board-list">
        <form action="qna.re" id="detailForm" name="detailForm" method="post">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                	<!-- 게시판 넘버 넘겨주기 위해서 -->
                	
                	
                    <td scope="col" class="th-num">제목</td>
                    <td scope="col" class="th-title">
                    <input type = "hidden" value = " <%=qna.getQnaTitle() %>" name ="title">
                	<input type = "hidden" value = "<%=qna.getQnaNo() %>" name = "no">
                    <strong><%=qna.getQnaTitle() %></strong></td>
                </tr>
                	
                <tr>
                    <td scope="col" class="th-num">작성자</td>
                    <% if(qna.getUserId() != null) { %>
                    <td scope="col" class="th-title">
                    <input type = "hidden" value = "<%=qna.getUserId() %>" name ="name">
                    <%=qna.getUserId() %></td>
                    <%} else { %>
                    <td scope="col" class="th-title">
                    <input type = "hidden" value="관리자" name ="name">
                                        관리자</td>
                    <%} %>
                    
                    
                    
                    <td scope="col" class="th-count">작성일</td>
                    <td scope="col" class="th-count2">
                    <%=qna.getQnaDate() %></td>
                    
                    
                    
                 <td scope="col" class="th-count">조회수</td>
                 <td scope="col" class="th-count3"><%=qna.getQnaCount() %></td> 
				  </tr>
                  
                </thead>
                <tbody>
              
      
			
               <tr>
                    <td scope="col" class="th-num">글내용</td>
                    <td scope="col" colspan = "3" class="th-content">
                    <input type = "hidden" value = "<%=qna.getQnaContent() %>" name ="content">
                    <%=qna.getQnaContent() %></td>
                    <td></td>
                    <td></td>
                  
				  </tr>
                </tbody>
            </table>
        </div>
        <br><br>
      <div align="center">
    <% if(loginUser != null && loginUser.getUserId().equals(qna.getUserId()) || loginAdmin != null){%> 
          <input type ="submit"  id = "writeNoBtn" value ="수정하기">
          <input type="button" id="writeNoBtn" onclick= "deleteQna();" id="cancelBtn" value="삭제하기">
       <%} %> 
          <input type="button" id="writeNoBtn" onclick = "location.href='qna.li'" id="cancelBtn" value="이전으로">
         </div>
        </form>
    </div>  
   
  </section> 
<%-- <form  method="post" encType="multipart/form-data" action="<%= request.getContextPath() %>/reply.re"> --%>
 <br><br>	
 
 
 

<div class="container">
  <div class="row">
    <div class="col-12">
      <div class="comments">
        <div class="comments-details">
        </div>
        <div class="comment-box add-comment">
          <span class="commenter-pic" style="background : #EFEFEF">
          <% if(loginUser != null && loginUser.getChangeName() != null){ %>
            <img src="<%=request.getContextPath()%>/profile_uploadFiles/<%=loginUser.getChangeName() %>" class="img-fluid">
          <%} %>
          </span>
          
          <span class="commenter-name">
            <input type="text" id = "replyContent" placeholder="댓글을 입력해주세요" name="Add Comment" class="inputComment">
            <button type="button" id = "back" class="btn btn-default">취소</button>
            <button type="submit" class="btn btn-default" id = "replys"  style="background : black;">댓글 달기</button>
          	<% if(loginUser != null) {%>
          	<input type="hidden" value="<%= loginUser.getUserId() %>" name="userId" id="userId">
          	<% } else if(loginAdmin != null){ %>
          	<input type="hidden" value="<%= loginAdmin.getAdminNo() %>" name="adminId" id="adminId">
          	<%} %>
          </span>
        </div>
        
        <script>
        $(function(){
        	$('#back').click(function(){
        		$('#replyContent').val('');
        	});
        });
        </script>
        
      
      
      
        <!-- 댓글 달리는 공간 -->
       <div id = "1">
           <% for(int i = 0; i <list.size(); i++){ %>
             <div>  
        <div class="comment-box" id = "2">
         <span class="commenter-pic">
         <% if(list.get(i).getUserId() != null && list.get(i).getChangeName() != null) { %>
            <img src="<%=request.getContextPath()%>/profile_uploadFiles/<%=list.get(i).getChangeName()%>" class="profile" >
          <% } %>
          </span>
          <%if(list.get(i).getUserId() != null) {%>
          <span class="commenter-name"><%= list.get(i).getUserId() %></span>
          <%} else{ %>
          <span class="commenter-name">관리자</span>
          <%} %>
            <span class="comment-time"> <%= list.get(i).getQnaReplyDate()%></span>
          <p class="comment-txt more" id="reply"> <%= list.get(i).getQnaReplyContent() %></p>
      	<!-- <button type="submit" class="btn btn-default" id = "remove" class="submitBtn" style="background : black; color :white;">삭제</button>  -->
        </div>
         </div>
   		<%} %>
   		</div>
  
   	
    </div>
  </div>
</div>
</div>
<!-- </form> -->
         
         
   
<script>
    function deleteQna(){
    	var deleteQna = confirm('정말 삭제하시겠습니까?');
    	if(deleteQna){
    		alert("삭제되었습니다.");
			location.href='<%=request.getContextPath()%>/qna.del?no='+<%=qna.getQnaNo()%>;
		}
    }
 
  

	
	$('#replys').on("click",function(){
		if($('#replyContent').val() == ""){
			
			alert("댓글을 빼먹었지롱~")
		} else {
			
			if($('#replys').next('input').attr("id") == "adminId"){
				var writer = $('#adminId').val();
			} else {
				var writer = $('#userId').val();
			}
			var qId = "<%=qna.getQnaNo()%>";
				//댓글작성 인풋
				
			$.ajax({
				url:"<%=request.getContextPath()%>/reply.bo",
				type: 'post',
				//       넘겨줄 데이터
				data : {writer:writer, content:$('#replyContent').val(),qId:qId},
				success: function(data){
					$replyTable = $('#1');
					$replyTable.html('');
					console.log(data);
					
					for(var i in data){
						if(data[i].userId != null){
							if(data[i].changeName != null){
								var $img = "profile_uploadFiles/"+ data[i].changeName;
								var $div = $('<div>').attr('class','comment-box');
								var $span = $('<span>').attr('class','commenter-pic');
								var $profil = $('<img>').attr({'src':$img,'class':'profile'}); 
								var $writerId = $('<span>').text(data[i].userId).attr( 'class', 'commenter-name' );
								var $date = $('<span>').text(data[i].qnaReplyDate).attr('class','comment-time');
								var $content = $('<p>').text(data[i].qnaReplyContent).attr('class','comment-txt more');
								$div.append($span);
								$span.append($profil);
								$div.append($writerId);
								$div.append($date);
								$div.append($content);
								$replyTable.append($div);
								
							} else{
								var $div = $('<div>').attr('class','comment-box');
								var $span = $('<span>').attr('class','commenter-pic');
		// 						var $profil = $('<img>').attr({'src':$img,'class':'profile'}); 
								var $writerId = $('<span>').text(data[i].userId).attr( 'class', 'commenter-name' );
								var $date = $('<span>').text(data[i].qnaReplyDate).attr('class','comment-time');
								var $content = $('<p>').text(data[i].qnaReplyContent).attr('class','comment-txt more');
								$div.append($span);
		// 						$span.append($profil);
								$div.append($writerId);
								$div.append($date);
								$div.append($content);
								$replyTable.append($div);
							}
						} else {
						var $div = $('<div>').attr('class','comment-box');
						var $span = $('<span>').attr('class','commenter-pic');
// 						var $profil = $('<img>').attr({'src':$img,'class':'profile'}); 
						var $writerId = $('<span>').text("관리자").attr( 'class', 'commenter-name' );
						var $date = $('<span>').text(data[i].qnaReplyDate).attr('class','comment-time');
						var $content = $('<p>').text(data[i].qnaReplyContent).attr('class','comment-txt more');
						
						$div.append($span);
// 						$span.append($profil);
						$div.append($writerId);
						$div.append($date);
						$div.append($content);
						$replyTable.append($div);	
						}
						
					}
					$('#replyContent').val('');
					
				},
				error:function(data){
					console.log(data);
				}
				});
		}
	
	});
	
</script>

<%@ include file = "../common/footer.jsp" %>
</body>
</html>