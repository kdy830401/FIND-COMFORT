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
	.outer{padding-top : 5px; padding-left : 10px; width : 200px; height: 250px; margin-left: 10px;} 

	h3 {text-align: center; margin-right: 7px;}

	.btn {margin-top: 10px; margin-left: 29px;}
	#button{
		width: 50px; height: 30px; color: black; font-size: 15px;
		border: none; border-radius: 10px; 	
	}
	
	html{width:300px; height: 275px;}
</style>

</head>
<body class="outer" >

	<form class="findId" name="findId" method = "POST" action="<%=request.getContextPath()%>/findId.me">
			<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="name" id="name" class = "btn-name" placeholder = "등록한 이름" autocomplete="off" required="">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" name="phone" id="phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력" autocomplete="off" required="" onkeyup = "addHypen(this);" maxlength="13">
			</div>
			<br>
	</section>
	<div class ="btn">
		<input type="submit" id="button" name="enter" value="찾기"  >
		<input type="button" id="button" name="cancle" value="취소" onClick="window.close();">
 	</div>
 </form>
 
 
 <script>
 
 	/* function id_search() { 
	 	var form = document.findId;

	 	if (form.name.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (form.phone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }

 	} */
 	
 	
	/*  form.method = "post";
	 form.action = "findIdResult.jsp"; //넘어간화면
	 form.submit();  */ 
	 
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
	 
	 
	/*  $(document).ready(function() {
	      // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
	      var strWidth;
	      var strHeight;

	      //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
	      if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
	          strWidth = $('.findId').outerWidth() + (window.outerWidth - window.innerWidth);
	          strHeight = $('.findId').outerHeight() + (window.outerHeight - window.innerHeight);
	      }
	      else {
	          var strDocumentWidth = $(document).outerWidth();
	          var strDocumentHeight = $(document).outerHeight();

	          window.resizeTo ( strDocumentWidth, strDocumentHeight );

	          var strMenuWidth = strDocumentWidth - $(window).width();
	          var strMenuHeight = strDocumentHeight - $(window).height();

	          strWidth = $('.findId').outerWidth() + strMenuWidth;
	          strHeight = $('.findId').outerHeight() + strMenuHeight;
	      }

	      //resize 
	      window.resizeTo( strWidth, strHeight ); */
	      
	    window.resizeTo(310,330);//팝업창 크기 재조절

	 
 </script>
 

</body>
</html>