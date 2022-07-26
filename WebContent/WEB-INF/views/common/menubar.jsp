<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" %>
 <% 
   Member loginUser = (Member)session.getAttribute("loginUser");
   Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
   
%>
<!doctype html>
<html>
<head>
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
     
<style>
	
	@font-face {
	    font-family: 'GowunDodum-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	*{
	 font-family: 'GowunDodum-Regular';
	}
	
	
	
	.navbar:hover{
	background: rgba(0, 0, 0, 0.1);
	 
	}
	
	
	.mask-custom {
	  background-color: rgba(255, 255, 255, .15);
	} /*네비바 투명하게 만들기*/  
	
	
	/*로고*/
	.navbar-brand {
	   margin-left:60px;
	  font-size: 1.75rem;
	  letter-spacing: 4px;
	  font-weight : bold;
	
	}
	
	#navbarSupportedContent{
	             /*메뉴 오른쪽으로 만들기*/
	   margin-left: 50px;
	  font-weight : bold;
	
	}
	
	#navbarSupportedContent:hover{
	  font-weight : bold;
	  font-family:sans-serif;
	}
	
	

</style>
<title>FIND COMFORT</title>
  </head>
  <body>
  
  
  <header>
  <!-- Navbar -->
  
  
  <nav class="navbar navbar-expand-lg navbar-light fixed-top mask-custom shadow-0">
    <div class="container-fluid">
      <a class="navbar-brand" style="cursor:pointer;" href="<%=request.getContextPath()%>"><span style="color: #000000;">FIND</span><span style="color: #000000;"> COMFORT</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        
      
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/comfort.li">COMFORT </a>
          </li>
     
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/notice.li">NOTICE </a>
          </li>
            <%if(loginUser != null || loginAdmin != null ){ %>
           <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/qna.li">BOARD</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/logout.me">LOGOUT</a>
          </li>
          <% } %> 
          <% if(loginUser != null && loginAdmin == null){ %>
          <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/myPage.me">MYPAGE</a>
          </li>
          <% } else if(loginUser == null && loginAdmin == null) {%>
          <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/loginForm.me">LOGIN </a>
          </li>
    		<li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/joinForm.me">JOIN </a>
          </li>
          <li class="nav-item">
          	<a class="nav-link" href="<%=request.getContextPath()%>/loginForm.ad">ADMIN</a>
          </li>
          <%} %>
          
        </ul>
    </div>
      </div>
     
 
  </nav>
  </header>

   </body>
</html>