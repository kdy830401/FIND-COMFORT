<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0096)file:///C:/Users/%EA%B9%80%EB%8C%80%EC%97%B4/DOCUME~1/%EC%B9%B4%EC%B9%B4%EC%98%A4~1/1_JOIN~1.HTM -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
  <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --><!-- 일단 이렇게 진행 -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script> <!-- WEB-INF만 인식해서 ../ 만 누르면 WebContent 그 안에 js -->
<!-- request.getContextPath() : WebContent -->
<style>
	@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }
   *{margin: 0; padding: 0; box-sizing: border-box;}
   body{
      /*font-family: */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      /*background: 사진 넣기 or 결정(no-repeat center; 설정하기)*/
      background-size: cover; 
      font-family: 'GowunDodum-Regular';  
   }
   body::before {
      content: "";
      /* position : absolute; */ z-index: 1;
      top: 0; right: 0; bottom: 0; left: 0;
      /*background-color : rgba(0,0,0,.7);*/
   }
   .signup-form{position: relative; z-index: 2;margin-top:300px;}
   .signup-form h1 {
      font-size: 32px; color: black;
      text-align: center;
      margin-bottom: 60px;
   }
   .int-area {width: 400px; position: relative; margin-top: 20px;}
   .int-area: first-child{margin-top: 0;}
   .int-area input {
      width: 400px;
      padding: 50px 20px 10px;
      background-color: transparent;
      border: none;
      border-bottom: 1px solid black;
      font-size: 18px; color: black;
      outline: none;
   }
   
   .int-area label{
      position: absolute; left: 10px; top: 15px;
      font-size: 18px; color: black;
      transition: top .5s ease;
   }
   
   .int-area label.warning{
      color: red !important;
      animation: warning .3s ease;
      animation-iteration-count: 3;
   
   }
   
   @keyframes warning {
      0% {transform: translateX(-8px);}
      25% {transform: translateX(8px);}
      50% {transform: translateX(-8px);}
      75% {transform : translateX(8px);}
   }
   
    .int-area input:focus + label,/*커서 대면 움직임*/
    .int-area input:valid + label{
      top: -2px;
      font-size: 13px; color: black;
   }
   
   .btn-area {margin-top: 30px;}
   .btn-area button{
      width: 400px; height: 50px; /*background: 52행과 똑같이*/ color: black; font-size: 20px;
      border: none; border-radius: 25px;      
   }
   
   .caption{
      margin-top: 20px;
      text-align: center;
   }
   
   .caption a{
      font-size: 15px; color: black; text-decoration: none;
   }

/*    .email{
      width: 20%;
   }
    */
    
   
   .id-area{}
   .checkid-area{}
   
   #id_1{
   display: block;
   }
   #id{
    width: 400px;
    padding: 50px 20px 10px;
    background-color: transparent;
    border: none;
    border-bottom: 1px solid black;
    font-size: 18px;
    color: black;
    outline: none;
    
   }
   
   #id-input{
   	position: relative;
   	   
   }
   #duplcheck{
   	overflow: visible;
   	width: 60px;
   	height: 30px;
   	font-size: 13px;
   	padding : 0;
   	background-color: black;
   	color: white;
   	position: absolute;
   	display: inline-block;
   	right: 5px;
   	top: 40px;
   	border-radius: 5px;
   }
   #duplcheck:hover{
   	cursor: pointer;
   }
   #id_dup{
   }
  
  *{font-family: 'GowunDodum-Regular';}
</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
   <section class="signup-form">
      <h1><strong>JOIN</strong></h1>
      <form action="<%= request.getContextPath()%>/insert.me" method="post" id="joinForm" name="joinForm" onsubmit="return insertValidate();">
         <div class="int-area" id="int-area-id"><!-- div는 블록요소니까 한줄 한줄 씩 들어가겠쪄???? id / pw / button -->
               <div id="id-input">
               		<input type="text" name="id" id="id" autocomplete="off" required="" placeholder="아이디를 입력해주세요." >
             		<label>아이디</label>
               		<!-- <input type="submit" id="duplcheck" value="중복확인"> -->
               </div>
               <br><span id="checkId"></span>
		      
         </div>
         
         <div class="int-area">
         	
            <input type="password" name="pw" id="pw" autocomplete="off" required="" placeholder="영문 대/소문자,숫자,특수문자 !@#$ 9~15자" onblur="requirement1();">
         	<label>비밀번호</label>
         	<br><span id="checkPw"></span>
         </div>
         <div class="int-area">
         	
            <input type="password" name="pw2" id="pw2" autocomplete="off" required="" placeholder="비밀번호를 다시 입력해주세요." onblur="requirement2();">
         	<label>비밀번호 확인</label>
         	<br><span id="checkPw2"></span>
         </div>
         <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" required="" placeholder="이름을 입력해주세요.">
         	<label>이름</label>
         </div>
         <div class="int-area">
            <input class="email" type="text" name="email" id="email" autocomplete="off" required="" width="10%" placeholder="abcd@abcd.com">
         	<label>이메일</label>
         </div>
         <div class="int-area">
            <input type="text" name="phone" id="phone" autocomplete="off" required="" placeholder="-없이 입력해 주세요" onkeyup="addHypen(this);" maxlength="13">
            <label>핸드폰 번호</label>
         </div>
         
         <div class="btn-area">
            <button id="btn" type="submit">가입하기</button>
         </div>
      </form>
      <!-- <div class="caption">
         <a href="file:///C:/Users/%EA%B9%80%EB%8C%80%EC%97%B4/DOCUME~1/%EC%B9%B4%EC%B9%B4%EC%98%A4~1/1_JOIN~1.HTM">홈으로 돌아가기</a>
      </div> -->
   </section>


   <script>
   		/* var id = document.getElementById('id');
   		var checkId = document.getElementById('checkId') */
   		var pw = document.getElementById('pw');
   		var pw2 = document.getElementById('pw2');
   		var checkPw = document.getElementById('checkPw');
   		var checkPw2 = document.getElementById('checkPw2');
   		/* var phone = document.getElementById('phone'); */
   		var btn = document.getElementById('btn');
   		var idRegExp = /^[a-z][a-z\d]{4,12}$/; 
   		var pwdRegExp = /^[a-zA-Z0-9!@#$]{9,15}$/;//ab5264270!!
   		/* var pwdRegExp = /^[a-z][A-Z\d][!@#$]{9,15}$/; */
   		/* var checkPwdRegExp = /^[a-z][a-z\d][!@#$]{9,15}$/; */
   		
   		
   	/* 	btn.addEventListener('click', () => {
       		if(id.value == "") {
           		label = id.nextElementSibling
           		label.classList.add('warning')
           		setTimeout(() => {
               		label.classList.remove('warning')
           		}, 1500)
      		 } else if(pw.value == "") {
           		label = pw.nextElementSibling
           		label.classList.add('warning')
           		setTimeout(() => {
               	label.classList.remove('warning')
           		}, 1500)
       			}
   		})
       */
       	<%-- var isUsable = false;
   		var isIdChecked = false;
   		
   		$('#id').on('change paste keyup', function(){
   			isIdChecked = false;
   		});
       
       	function requirement(){
   			if(!idRegExp.test(id.value)){
   				checkId.innerHTML = "4~12자 영문, 숫자";
   				checkId.style.color = "red";
   			} else {
   				$.ajax({
   					url:'<%= request.getContextPath()%>/checkId.me',
   					type: 'post',
   					data: {inputId: id.value},
   					success: function(data){
   						console.log(data);
   						if(data == 0){
   							$('#checkId').text('사용 가능합니다.').css({'color':'green','float':'left','display':'inline-block'});
   							isUsable = true;
   							isIdChecked = true;
   						} else if(data == 1){
   							$('#checkId').text('사용 불가능합니다.').css({'color':'red', 'float': 'left', 'display':'inline-block'});
   							isUsable = false;
   							isIdChecked = false;
   						}
   					},
   					error: function(data){
   						console.log(data);
   					}
   				});
   			}
   		} --%>
       	
       	/* function insertValidate(){
       		if(isUsable && isIdChecked){
       			return true;
       		} else {
       			alert('아이디 중복확인을 해주세요');
       			return false;
       		}
       	}
   		       */  
        
   		function requirement1(){
   			if(!pwdRegExp.test(pw.value)){
   				checkPw.innerHTML = "영문 대/소문자,숫자,특수문자 !@#$ 9~15자";
   				checkPw.style.color="red";
   			} else {
   				checkPw.innerHTML = "";
   				/* checkPw.next(); */
   			}
   			
   		}
   		
   		function requirement2(){
   			if(pw.value != pw2.value){
   				checkPw2.innerHTML = "비밀번호가 틀립니다. 다시 입력해주세요."
   				checkPw2.style.color = "red";
   			} else{
   				checkPw2.innerHTML = "";
   				/* checkPw2.next(); */
   			}
   		}
   		
   		function addHypen(obj) {
   			var number = obj.value.replace(/[^0-9]/g, "");
   			var phone = "";
   			
   		  if(number.length < 4) {
   	        return number;
   	    } else if(number.length < 7) {
   	        phone += number.substr(0, 3);
   	        phone += "-";
   	        phone += number.substr(3);
   	    } else if(number.length < 11) {
   	        phone += number.substr(0, 3);
   	        phone += "-";
   	        phone += number.substr(3, 3);
   	        phone += "-";
   	        phone += number.substr(6);
   	    } else {
   	        phone += number.substr(0, 3);
   	        phone += "-";
   	        phone += number.substr(3, 4);
   	        phone += "-";
   	        phone += number.substr(7);
   	    }
   	    obj.value = phone;
   	}
   		
   		
   		var isUsable = false;
   		var isIdChecked = false;
   		
   		$('#id').on('change paste keyup', function(){
   			isIdChecked = false;
   		});
   		
   		$('#id').change(function(){
   			var id = $('#id');
   			var checkId = $('#checkId');
   			
   			if(!id || id.val().length < 4){
   				$('#checkId').text('아이디는 4자리 이상이어야 합니다.').css({'color':'red'});
   				id.focus();
   			} else {
   				$.ajax({
   					url: '<%= request.getContextPath()%>/checkId.me',
   					type: 'post',
   					data: {userId : id.val()},//userId로 servlet에 넘겨준다
   					success: function(data){
   						console.log(data);
   						if(data == '0'){
   							$('#checkId').text('사용 가능합니다.').css({'color':'green'});
   							isUsable = true;
   							isIdChecked = true;
   						} else {
   							$('#checkId').text('사용 불가능합니다.').css({'color':'red'});
   							id.focus();
   							isUsable = false;
   							isIdChecked = false;
   						}
   					},
   					
   					error: function(data){
   						console.log(data);
   					}
   				
   				});
   			}
   		
   		});
   		
   		function insertValidate(){
   			if(isUsable && isIdChecked){
   				return true;
   			} else {
   				$('#checkId').text('아이디 중복확인을 해주세요.');
   				return false;
   			}
   			
   		}
   		
   		console.log($('#id').val);
   		
   	
   </script>

</body></html>