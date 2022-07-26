<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
    Member myInfo = (Member)request.getAttribute("myInfo");

    %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello, World!</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/2deabb7324.js" crossorigin="anonymous"></script>
<!--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
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
		height:15vh;
	}
	/* 프로필 사진 이미지 조정 */
	img{
		width: 40%
	}
	
	
	.card {
		width: 3000px;
	    margin-bottom: 20px;
	}
	
	/* 프로필 및 메뉴 영역 정렬  */
	.m-r-0 {
	    margin-right: 250px;
	    
	}
	
	/* 프로필 사진 정렬  */
	.user-card-full .user-profile {
	    border-radius: 5px 0 0 5px
	    
	}
	
	.m-b-25 {
		
	    margin-bottom: 50px;
	    padding : 20px;
	}
	
	
	
	
	.sub-title{
		padding:50px;
		font-size: large;
		text-align: left;
		color: black;
		
	
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
	    line-height: 25px
	}
	
	.card-block {
	    padding: 1.2rem
	}
	
	.b-b-default {
	    border-bottom: 1px solid #e0e0e0;
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
	    margin-top: 20px
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
	
	#inputPassword6{
		margin: 15px
	}
	.form-control{
		font-size: x-small;
		border-top: none;
		border-left: none;
		border-right: none;
		border-radius: 1px;
		
	}
	.col-sm-5{
		padding : 8px;
		
	}
	.special{
		width: 120%;
		height: 120%;
	}
	.on{
		list-style: none;
		display: inline;
		padding: 11px;
		color : #EFEFEF;
		text-align: center;
		font-size :x-small;
	}
	.checked{
		padding:10px;
	}
	#checkPwd1{
		font-size:x-small;
	}
	#checkPwd2{
		font-size:x-small;
	}
	#checkPwd3{
		font-size:x-small;
	}
	#checkEmail{
		font-size:x-small;
	
	}

</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
<div class="special">
<div class="page-content page-container" id="page-content">
    <div class="padding">
    <br><br>
    <!-- 메인 메뉴 부분  -->
        <div class="row container d-flex justify-content-center">
                <div class="card user-card" style="width:1400px; height:1500px; position:absolute; border: none;">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white" style="width:250px;">    
				<form method="post" id="profileForm" action="<%= request.getContextPath() %>/updateMyImg.me" encType="multipart/form-data" >
                            <div id="titldImgArea" align="center">
                             <div class="myProfile" id="myProfile" style=" background : gray; width: 100px; height: 100px; margin: 0 auto; border-radius: 50px; cursor: pointer;" >
						
						<%if(myInfo.getChangeName().equals("null")){ %>
                          <i class="fa-solid fa-user fa-3x" style="padding:21px;"></i>
                          <% } else { %>                        
							<img src="<%= request.getContextPath()%>/profile_uploadFiles/<%= myInfo.getChangeName() %>" id="profile" style=" background : gray; width: 100px; height: 100px; margin: 0 auto; border-radius: 50px;">                              
                           <input type="hidden" value="<%= myInfo.getChangeName() %>" id="myImg">
                            <% } %>
                            </div>                     
							<!-- 파일 업로드 하는 부분 -->
							<div id="profileArea">
								<input type="file" id="profileImg" multiple="multiple" name="profileImg" style="display : none">
							</div>
							<div class="container">
								<div class="row no-gutters" id="profileLayout">
				           	 	</div>
			           	 	</div>
			           	 	<br>
<!-- 			           	 	<input type="submit" class="btn btn" id="basicProfile" value="기본 프로필 "  style=" background: #EFEFEF; color: black; font-size: small;"> -->
			           	 
			           	 	
                           		<input type="button" class="btn btn" id="changeMyProfile" value="프로필 변경"  style=" background: #EFEFEF; color: black; font-size: small;">
			           	 	
			           	 	
			           	 	<script>
								// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
								$(function(){
									$("#profileArea").hide();
									
									$("#myProfile").click(function(){
										$("#profileImg").click();
									});
								});
								
								

			
					
								// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수 (이미지 미리보기)
						        var sel_files = [];
								
								$(document).ready(function(){
									$('#profileImg').on('change' , handleImgsFilesSelect);
								});
								
						        function handleImgsFilesSelect(e) {
						            var files = e.target.files;
						            var filesArr = Array.prototype.slice.call(files);
						 
						            filesArr.forEach(function(f) {
						                if(!f.type.match("image.*")) {
						                    alert("jpg,jpeg,png,bmp 확장자만 가능합니다.");
						                    return;
						                }
						 
						                sel_files.push(f);
						 
						                var reader = new FileReader();
						                reader.onload = function(e) {
						                
						                	var imgTag = $('<img>');
						                	imgTag.attr('class', 'img-fluid image');
						                	imgTag.attr('src', e.target.result);
						                	imgTag.css({'width' : '100%', 'height' : '100%' , 'border-radius' : '50px'});
						                	
						                	$('#myProfile').html(imgTag);

						                }
						                reader.readAsDataURL(f);
						            });
						        }
			           	 	</script>
                                <br><br><br>		                       
 										<h6 class="f-w-600" style="color:black;" ><%= myInfo.getUserName() %>님 반가워요!</h6>                                
                                        <p class="m-b-10 f-w-600" style="color: black">My Account</p>
                                <!-- 회원정보 수정 링크 -->                            
 					 </div>
			           	 	</form>
                                   <input type="button" class="update" style="background-color:transparent; border: none;"  value ="회원정보수정" id="update">         
                        </div>
                        </div>       
                         <!-- 내용 부분   -->
                        <div class="col-sm-8" >
                            <div class="card-block" style="padding: 30px; margin: 5px;">
                                    <div class="col-sm-13">
                                        <h6 class="m-b-20 p-b-5 b-b-default m-b-10 f-w-600">Id</h6>
                                        <br>
                                        <%= myInfo.getUserId()%>    
                                     	 <input type="hidden" maxlength="13" name="myId" value="<%= myInfo.getUserId()%>" required >
                                    </div>
                                    <br><br>
                            <!--email 변경 -->
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Email</h6>    
                               <form id="emailUpdate" action="<%= request.getContextPath() %>/updateEmail.me" method="post">                           
									<div class="email col-sm-6">
									<br>
									
									  <input type="email" class="form-control" id="inputEmail" placeholder="E-mail" name="myEmail" value="<%= myInfo.getEmail().equals("-") ? "" : myInfo.getEmail() %>">  
									  
									</div>
                              		 <span id="checkEmail"></span>
									 <br><br>                                                          
									<button type="button" class="btn btn" id="newInputEmail" value="이메일 변경" style="font-size: small; background: #EFEFEF; color: black; margin: 10px 0px; width: 50%;">이메일 변경</button>
                                <br><br>
                           </form>
                                <!-- 비밀번호 변경 -->
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Password</h6>
                                
                      <form action="<%= request.getContextPath() %>/updatePWd.me" method="post">                              
                                <div class="col-sm-6">                               
  								<div class="form-group">  
  								<br> 
   									<input type="password" id="inputPwd" class="form-control" name="myPwd" style="margin:1px;" aria-describedby="passwordHelpInline" placeholder="현재 비밀번호" >
  								</div>
  								
  								<span id = "checkPwd1" style="color : black;"></span>
  								<br><br>
                                </div>
                                <div class="col-sm-6">                             
  								<div class="form-group">
   									<input type="password" id="newInputPwd" class="form-control" name="newPwd" style="margin:1px;" aria-describedby="passwordHelpInline" placeholder="새 비밀번호">
  									<span id = "checkPwd2" style="color : black;"></span>	
  									<ul class="checked">
  										<li class="on" id ="eng"><i class="fa-solid fa-check"></i>영문</li>
  										<li class="on" id ="num"><i class="fa-solid fa-check"></i>숫자</li>
  										<li class="on" id ="str"><i class="fa-solid fa-check"></i>특수문자</li>
  										<li class="on" id ="gap"><i class="fa-solid fa-check"></i>9자 이상 15자 이하</li>
  									</ul>
  								</div>
                                </div>
                             	<div class="col-sm-6">                             
  								<div class="form-group">
   									<input type="password" id="newInputPwd1" class="form-control" style="margin:1px;" aria-describedby="passwordHelpInline" placeholder="새 비밀번호 확인">
   									<span id = "checkPwd3" style="color : black;"></span>	
   									
  								</div> 																                                     
                                </div>                               
                                <br><br>
                                <input type="button" class="btn btn" id="pwdSubmit" value="비밀번호 변경"  style="font-size: small; margin: 10px 0px; width: 50%; background: #EFEFEF; color: black;">
                               </form> 
                                   <div class="modal-dialog">
							  <div class="modal fade" id="myModal" role="dialog">
							    <div class="modal-dialog">
							      
							      <div class="modal-content">
							        
							        <div class="modal-body">
							        <br>
							          <h6 id="message">회원 탈퇴 시 FIND COMFORT와 함께한 정보들이 삭제 됩니다. <br><br>정말 탈퇴하시겠습니까?</h6>
							        </div>
							        <div class="modal-footer">
							        
							          <button type="button" class="btn" id="secession" data-dismiss="modal" style="background : #EFEFEF; font-size: x-small;" onclick="deleteMember();">탈퇴하기</button>
							          <button type="button" class="btn" id="closePopup" data-dismiss="modal" style="background : #EFEFEF; font-size: x-small;">취소</button>
							        </div>
							      </div>
							      
							    </div>
							  </div>
							</div>    
        
                               	<br><br>  	
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600"></h6>       
    
                               		<button type="submit" class="btn btn-light" id="logout" onclick="logout();"style="font-size: small; background: #EFEFEF; color: black; margin: 10px 0px; width: 50%;">로그아웃</button>
                               	<br><br>
                               		<button type="button" class="btn btn-link" id="deleteInfo" data-dismiss="modal" style="color:black; font-size: 5px;">회원탈퇴</button>
                               	<br><br>               
							<script>
									function deleteMember(){
								
											location.href = '<%= request.getContextPath()%>/delete.me';
										}
									
									function logout(){
											location.href = '<%=request.getContextPath()%>/logout.me';
									}
							</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script>

	// 사진 첨부시 바로 변경하는 스크립트
// 	$('#profileImg').change(function(){
// 		$('#profileForm').submit();
// 	});
	
		
	
	$('#changeMyProfile').on("click", function(){
		if($('#myImg').val() != null){
			if($('#profileImg').val() == ""){
				var bool = confirm('프로필 사진을 삭제하시겠습니까?');
				if(bool){
					$('#profileForm').submit();
					alert('프로필 사진이 삭제되었습니다.');
				}
			} else{
				$('#profileForm').submit();
			}
		} else {
			if($('#profileImg').val() == ""){
				alert("사진파일을 첨부하여 주세요.");
			} else{
				$('#profileForm').submit();
			}
		}
	});
		
	
	
				
	
	
	// 회원 탈퇴 알림창
	 	 $(document).ready(function(){
		  $("#deleteInfo").on('click' , function(){
		    $("#myModal").modal("show");
		  });
	 	 });
		  $("#closePopup").on('click' , function(){
			  $("#myModal").modal("hide");
		}); 

 	
	// 이메일 유효성 검사
	$(function(){
 	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 	$('#newInputEmail').click(function(){
 		if(!regExp.test($('#inputEmail').val())){
 			alert('이메일을 확인해주세요.')
 		}else{
 			$('#emailUpdate').submit();
 			alert('이메일이 변경되었습니다.')
 		}
 	})
 	
	});
	

		$(function(){
		var pat = /^(?=.*[a-zA-Z])(?=.*[!@#$])(?=.*[0-9]).{9,15}$/;
		$('#newInputPwd').blur(function(){
			if(!pat.test($('#newInputPwd').val())){
				$('#checkPwd2').text('형식에 맞지 않는 비밀번호 입니다.').css('color' , 'red');
// 				$('#newInputPwd').focus();
				return false;		
			}else{
				$('#checkPwd2').text('사용가능한 비밀번호 입니다.').css('color', '#546DE5');
				return true;
			}
		 	});
		});
			
 	// 현재 비밀번호가 입력되지 않고 제출을 눌렀을 때 '현재 비밀번호를 입력해주세요 출력' 
	$(function(){
	$('#inputPwd').blur(function(){	
		
		if($('#inputPwd').val() == '' && $('#newInputPwd').val() == '' || $('#inputPwd').val() == ''){
			$('#checkPwd1').text('현재 비밀번호를 입력해주세요.').css('color' , 'red');
			$('#inputPwd').focus();
			return false;
		}else{
			$('#checkPwd1').text('');	
			return true;
		}
	});	 
		
	}); 
		
	$('#pwdSubmit').click(function(){
		
		var pwd = $('#inputPwd')	
 		var newPwd = $('#newInputPwd');
 		var newPwd2 = $('#newInputPwd1');
 		var pat = /^(?=.*[a-zA-Z])(?=.*[!@#$])(?=.*[0-9]).{9,15}$/;
 		
	// 비밀 번호 형식이 안 맞으면 '형식에 맞지 않는 비밀번호 입니다 출력'
 		if(newPwd.val().trim() != newPwd2.val().trim() || !pat.test(newPwd.val())){
 			alert('비밀번호가 다릅니다.');
 			newPwd2.val('');
 			newPwd2.focus();
 			return false;
 			
	// 현재 비밀번호 일치하고, 새비밀번호 와 새비밀번호 확인 일치 '사용가능한 비밀번호입니다.' 알림창
 		} else if(newPwd.val().trim() == '' || newPwd2.val().trim() == ''){
 			alert('비밀번호를 입력해주세요');
 			return false;
 		} else{

 			console.log($('#inputPwd').val());
 			$.ajax({
 				url:'<%=request.getContextPath()%>/updatePWd.me',
 				type: 'post',
 				data: {myPwd:$('#inputPwd').val(),newPwd:$('#newInputPwd').val()},
 				success: function(data){
 					console.log(data);
 					if(data > 0){
 						alert('비밀번호가 변경되었습니다.');
 						var url = '<%=request.getContextPath()%>/myPage.me';
 						location.replace(url);
 						
 					} else {
 						alert('현재 비밀번호가 다릅니다.');
 					}
 				},
 				error: function(data){
 					console.log(data);
 				}		
 			})
 			

 		}
	});
	
	
	// 비밀번호 변경 숫자 , 영어 , 특수문자 , 9~15 별로 유효성 검사
	$(function(){
	
	var pat1 = /[a-zA-Z]/;
	var pat2 = /[0-9]/;
	var pat3 = /[!@#$]/;
	var pat4 = /^[a-zA-Z0-9!@#$]{9,15}$/;
	
	
	$('#newInputPwd').keyup(function(){
		if(!pat1.test($('#newInputPwd').val())){
			$('#eng').css('color','#EFEFEF');
			return false;
		}else{
			$('#eng').css('color','#546DE5');
			$('#checkPwd2').text('');
			return true;
		}
	});
	
	
	$('#newInputPwd').keyup(function(){
		if(!pat2.test($('#newInputPwd').val())){
			$('#num').css('color','#EFEFEF');
			return false;
		}else{
			$('#num').css('color','#546DE5');
			return true;
		}
	});
	
	
	$('#newInputPwd').keyup(function(){
		if(!pat3.test($('#newInputPwd').val())){
			$('#str').css('color','#EFEFEF');
			return false;
		}else{
			$('#str').css('color','#546DE5');
			return true;
		}
	});
	
	$('#newInputPwd').keyup(function(){
		if(!pat4.test($('#newInputPwd').val())){
			$('#gap').css('color','#EFEFEF');
			return false;
		}else{
			$('#gap').css('color','#546DE5');
			$('#checkPwd2').text('');
			return true;
		}
	});
	
	});
		
</script>

</body>
</html>
