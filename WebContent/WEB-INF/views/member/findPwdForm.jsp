<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
	@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
  	 *{}
	.outer{align: center;  padding-left : 10px; width : 300px; height: 300px; } 

	h3 {text-align: center; margin-right: 7px;}

	.btn {margin-top: 10px; margin-left: 35px; padding-left:20px;}
	#button{
		width: 50px; height: 30px; color: black; font-size: 15px;
		border: none; border-radius: 10px; 	
	}
	
	
	.entire{position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);}
 /* 	align: center; display: block;  margin : auto; *//* 주석 : ctrl+shift+c */
</style>

</head>
<body>

	<%-- <form class="findPwd" name="findPwd" method = "POST" action="<%=request.getContextPath()%>/findPwd.me"> --%>
		<div class= "outer">
		<div class = "entire">
			<div class = "search-title">
				<h3>비밀번호 찾기</h3>
			</div>
<!-- 		<section class = "form-search"> -->
			<div class = "find-id">
				<label>아이디</label>
				<input type="text" name="id" id="id" class = "btn-name" placeholder = "등록한 아이디" autocomplete="off" required="">
			<br>
			<br>
			</div>
			<div class = "find-email">
				<label>이메일</label>
				<input type="email" name="email" id="email" class = "btn-email" placeholder = "입력하신 이메일로 비밀번호가 발송됩니다." style= "width:260px;" autocomplete="off" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i">
			</div>
			<br>
<!-- 	</section> -->
	<div class ="btn">
		<input type="button" id="findbutton" name="enter" value="찾기"  >
		<input type="button" id="cancelbutton" name="cancle" value="취소" onClick="window.close();">
 	</div>
 	</div>
 	</div>
<!--  </form> -->
 
 
 <script>
 
	    window.resizeTo(600,400);//팝업창 크기 재조절

	    $('#findbutton').click(function(){
	    	
	    	var ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
	    	var ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	    	var ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	    	var ranValue4 = ['!','@','#','$'];
	    	
	    	var tempPwd = "";
	    	
	    	
	    	
	    	for(i=1 ; i<4; i++) {
	    		var ranPick1 = Math.floor(Math.random()* ranValue1.length);
	    		var ranPick2 = Math.floor(Math.random()* ranValue2.length);
	    		var ranPick3 = Math.floor(Math.random()* ranValue3.length);
	    		var ranPick4 = Math.floor(Math.random()* ranValue4.length);
	    		tempPwd = tempPwd + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
	    		console.log(tempPwd);
	    	} 
	    	
	    	
	    	var id = $('#id').val();
	    	var email = $('#email').val();
	    	
	    	$.ajax({
	    		url: '<%= request.getContextPath() %>/findPwd.me',
	    		type: "post",
	    		data: {id: id, email: email, tempPwd: tempPwd},
	    		success: function(data){
	    			console.log(data);
	    			
	    			if(data > 0){
		    			alert('이메일로 임시 비밀번호가 발급되었습니다.');
	    			} else {
		    			alert('임시 비밀번호 발급 실패 : 아이디나 이메일을 확인해주세요.');
	    				
	    			}
	    		},
	    		error: function(data){
	    			console.log(data);
	    		}

	    	}); 
	    	
	    });
	    
	 
 </script>
 

</body>
</html>