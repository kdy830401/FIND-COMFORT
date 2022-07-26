<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- 일단 이렇게 진행 -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
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
		font-family: 'GowunDodum-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		/*background: 사진 넣기 or 결정(no-repeat center; 설정하기)*/
		background-size: cover;	
	}
	body::before {
		content: "";
		position : absolute; z-index: 1;
		top: 0; right: 0; bottom: 0; left: 0;
		/*background-color : rgba(0,0,0,.7);*/
	}
	.login-form{position: relative; z-index: 2;}
	.login-form h1 {
		font-size: 32px; color: black;
		text-align: center;
		margin-bottom: 60px;
	}
	.int-area {width: 400px; position: relative; margin-top: 20px;}
	.int-area: first-child{margin-top: 0;}
	.int-area input {
		width: 400px;
		padding: 20px 10px 10px;
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
		animation: warnign .3s ease;
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
		width: 100%; height: 50px; /*background: 52행과 똑같이*/ color: black; font-size: 20px;
		border: none; border-radius: 25px;	font-family: 'GowunDodum-Regular';	
	}
	
	.caption{
		margin-top: 20px;
		text-align: center;
	}
	
	.caption a{
		font-size: 15px; color: black; text-decoration: none;
	}
	
	h1{font-family: 'GowunDodum-Regular';}
	
	*{font-family: 'GowunDodum-Regular';}
	
</style>
</head>
<body>
	<section class="login-form">
		<h1>LOGIN</h1>
		<form action="<%= request.getContextPath()%>/login.me">
			<div class="int-area"><!-- div는 블록요소니까 한줄 한줄 씩 들어가겠쪄???? id / pw / button -->
				<input type="text" name="id" id="id" autocomplete="off" required>
				<label for="id">회원 아이디</label>
			</div>
			<div class="int-area">
				<input type="password" name="pw" id="pw" autocomplete="off" required>
				<label for="pw">회원 비밀번호</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit" >로그인</button>
			</div>
		</form>
		<div class="caption">
			<ul>
				<li>아이디를 잊으셨나요?<a id="findId" onclick="findId();" style="cursor: pointer;">&nbsp;아이디 찾기</a></li>
				
				<li>비밀번호를 잊으셨나요?<a id="findPwd" onclick="findPwd();" style="cursor: pointer;">&nbsp;비밀번호 찾기</a></li>
			</ul>
		</div>
	</section>


	<script>
	
	function findId(){
	
		window.open('findIdForm.me','findIdForm','width=315,height=300');
	}
	

	 function findPwd(){
		window.open('findPwdForm.me','findPwdForm','width=315,height=300');
	} 
	
		var id = $('#id');
		var pw = $('#pw');
		var btn = $('#btn');
		
		$(btn).on('click', function(){
			if($(id).val() == "") {
				$(id).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				}, 1500);
			} else if($(pw).val() == ""){
				$().next('label').addclass('warning')
			}
		});
		
	
	</script>
</body>
</html>