<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member member = (Member)request.getAttribute("member");



%>
<!DOCTYPE html>
<html>
<head>

 <meta charset="UTF-8">
<!--  <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello, world!</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/2deabb7324.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
 font-family: 'GowunDodum-Regular';
}
	/* 카드 위치 조절  */
	.padding {
		padding: 190px
	
	}
	
	.m-b-25{
		width:18vw;
		height:15vh
	}
	
	/* 프로필 사진 이미지 조정*/
	img{
	
		width : 40%;
			
	}
	
	
	.card {
		
		width: 3000px;
	    border: none;
	    margin-bottom: 20px;
	}
	
	/* 프로필 및 메뉴 영역 정렬  */
	.m-r-0 {
	    margin-right: 150px;
	    
	}
	
	
	.m-b-25 {
		
	    margin-bottom: 50px;
	    padding : 20px;
	}
	
	
	/* 메뉴 바 부분 */
	.bg-c-lite-green {
	    background: white;
	    
	}
	
	.sub-title{
		padding:50px;
		font-size: large;
		text-align: left;
		color : black;
		
	
	}
	
	.sub-contents{
		
		font-size: small;
		color: black;
		text-decoration: none;
		
	}
	
	.user-profile {
	    padding: 10px
	}
	
	
	/* 이미지 형태 조정 */
	.img-radius {
	    border-radius: 48px;
	    height: 90px;
	    
	}
	
	h6 {
	    font-size: 14px
	}
	
	.card .card-block p {
	    line-height: 190px
	}
	
	.card-block {
	    padding: 1.2rem
	}
	
	.b-b-default {
	    border-bottom: 1px solid #e0e0e0
	}
	
	.m-b-20 {
	    margin-bottom: 20px
	}
	
	/* 카드 라인 높이 조절 부분 */
	
	.card .card-block p {
	    line-height: 120px;
	
	}
	
	
	.f-w-600 {
	    font-weight: 600;
	    font-size: 20px;
	    
	}
	
	.m-b-20 {
	    margin-bottom: 20px
	}
	
	.m-t-40 {
	    margin-top: 120px
	}
	
	.p-b-5 {
	    padding-bottom: 5px !important
	}
	
	.m-b-10 {
	    margin-bottom: 10px
	}
	
	/* Like 메뉴 부분  */
	.m-t-40 {
	    margin-top: 30px
	}
	
	.col-sm-5{
		padding : 8px;
		
	}
	.special{
		width: 120%;
		height: 120%;
	}
	.btn_photo{
		cursor: pointer;
		position: absolute;
		width: 35px;
		height: 35px;
		
	}


</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
<form method="post" action="<%= request.getContextPath() %>/updateForm.me">
<div class="special">
<div class="page-content page-container" id="page-content">
    <div class="padding">
    <br><br>
    <!-- 메인 메뉴 부분  -->
        <div class="row container d-flex justify-content-center">
     								   <!-- 카드 너비 조절 -->
                <div class="card user-card" style="width:1400px; height:1500px; position:absolute; border: none;" >
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white" style="width:260px;" >
                            	  <div class="myProfile" id="myProfile" style=" background : gray; width: 100px; height: 100px; margin: 0 auto; border-radius: 50px;" >
                        	<% if(member.getChangeName() == null){ %>
                        	<i class="fa-solid fa-user fa-3x" style="padding:21px;"></i>
                        	<% } else { %>
                            	<img name="profileImg" src="<%= request.getContextPath()%>/profile_uploadFiles/<%= member.getChangeName() %>" style=" background : gray; width: 100px; height: 100px; margin: 0 auto; border-radius: 50px;">
                            <% } %>
                            </div>
                            <br><br>

                                <h6 class="f-w-600" style="color:black;"><%= member.getUserName()%>님 반가워요!</h6>                                                         
                                        <p class="m-b-10 f-w-600" style="color: black">My Account</p>
                                <!-- 회원정보 수정 링크 -->                            
                               <input type="submit" class="update" style="background-color:transparent; border: none;"  value ="회원정보수정">
                               
                            </div>
                        </div>
                        
                          <!-- 내용 부분   -->
                        <div class="col-sm-8" style="text-align: center;">
                            <div class="card-block">
                            <br>
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Id</p>
                                        <%= member.getUserId()%>                                        
                                       <input type="hidden" maxlength="13" name="myId" value="<%= member.getUserId()%>"required >
                                    </div>
                                    <br>
                                    <input type="hidden" maxlength="13" name="myPwd" value="<%= member.getUserPwd()%>"required >
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Name</p>
                                        <%= member.getUserName() == null ? "-" : member.getUserName()%>
                                      <input type="hidden" maxlength="13" name="myName" value="<%= member.getUserName()%>" required>
                                        
                                    </div>
                                </div>
                                <br><br>
                                
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Phone</p>
                                        <%= member.getPhone() == null ? "-" : member.getPhone()%>
                                        <input type="hidden" maxlength="13" name="myPhone" value="<%= member.getPhone()%>" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Email</p>
                                    <%= member.getEmail() == null ? "-" : member.getEmail()%>
                                         <input type="hidden" maxlength="13" name="myEmail" value="<%= member.getEmail()%>"required >
                                    </div>
                                </div>
                               
                               <br><br>
							 <input type="hidden" maxlength="13" name="status" value="<%= member.getStatus()%>"required >
							  <input type="hidden" maxlength="13" name="myProfilePath" value="<%= member.getProfilePath()%>"required >
							   <input type="hidden" maxlength="13" name="myChangeName" value="<%= member.getChangeName()%>"required >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
</form>



</body>
</html>