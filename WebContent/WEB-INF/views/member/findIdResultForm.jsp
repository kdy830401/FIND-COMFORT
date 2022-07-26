<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
    String findId = (String)request.getAttribute("findId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{text-align: center;}

</style>
</head>
<body>

	 <form name="idresult" method="post">
      <%
      	if(findId != null){
      %>
      <div class = "container" >
      	<div class = "found-success">
      	  <br>
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=findId %> </div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="닫기" onClick="window.close()">
       	</div>
       </div>
       <%
      	} else {
       %>
 
        <div class = "container">
      	<div class = "found-fail">
      	  <br>
      	  <br>
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <%-- <input type="button" id="btnjoin" value="회원가입" onClick="location.href='<%=request.getContextPath()%>/joinForm.me'"> --%>
       	</div>
       </div>
       
   
	                
   </div>  
   
   <%
   }
   %> 
  </form>
  
  <script>
  		window.resizeTo(300,300);
  </script>

</body>
</html>