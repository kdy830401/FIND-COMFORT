<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, comfort.model.vo.*"%>

<%
	ArrayList<Comfort> bList = (ArrayList<Comfort>)request.getAttribute("bList");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">

    <title></title>
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comfort/search-style.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

    <style>
    
    
    /*  TYPOGRAPHY   */
	    @font-face {
	    font-family: 'GowunDodum-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
    *{
 		font-family: 'GowunDodum-Regular';
	}

	h2 {
		font-size: 4vmin;
	    font-weight: bold;
	    line-height: inherit;
    }


  	h3 {
		font-weight: 600;
		font-size: 3vmin;
		font-weight: bold;
	    line-height: inherit;
		margin: 2vmin 0 1vmin 0;
  	}
    
	
	.container a,span, p, h3{
		color:#fff;
	}
	
	.selectNo{
		font-size: 4vmin;
	    font-weight: bold;
	    line-height: inherit;
	    border: solid 1px;
	    display:inline-block;
	    width: 6vmin;
	    height : 6vmin;
	    text-align: center;
	    margin-bottom: 10px;
	    
	}
	.meta{
		font-size: 2vmin;
		margin-right: 1vmin;
	}
	
	
	.text-content :hover {
	  color: #3EC1D5;
	  text-decoration: none;
	}

	.dnow-regionsContent .overlay-div {
 	    height: 100%; 
 	    width: 100%; 
	    position: absolute;
	    background-color: #000;
	    opacity: 0.55;
	    
	}
	
	.card-img-overlay {
	  transition: all 0.3s ease 0s;
	  text-decoration: none;
	}
	
	.card-img-overlay:hover{
	    background-color: #000;
	    opacity: 0.7; 
    }
	
	.dnow-regionsContent img {
/*     	 height: 40vh; */
/*     	 max-width: 100%; */
		position: relative;
	}
	.dnow-regionsContent:hover{
		cursor: pointer;
	}
	
	.container{
		padding-bottom: 80px;
	  	padding-top: 80px;
	  	margin-top: 10vh;
	  	height: auto;
/* 	  	max-height: 65vh; */
 	  	max-width: 120vmin; 
	  	display: block;
	}
	
	.text-content{
		margin-left: 10vmin;
		bottom : 10vmin;
 		position: absolute; 
	}
	.item{
		margin-bottom: 40px;
	}
	
	.btn{
		
		font-size: 23px;
	    position: fixed; 
	    bottom: 40px;
	    right: 40px;
	    width: 40px; 
	}
	.btn:hover{
  		cursor:pointer;
  		background: #007bff;
  		color : #fff;
  	}
  	
	  	/* side move*/
	.sideMove {
		display: grid;
		place-content: center;
		position: fixed;
		right:10px;
		top :100px;
	  
	}
	.sideMove .side {
		 display: flex;
		 flex-direction: column;
		 background: #fff;
		 position: relative;
		 overflow: hidden;
		 padding: 0;
		 margin: 0;
		 box-shadow: 0 5px 5px -5px rgba(2, 136, 209, 0.15), 0 10px 10px -5px rgba(2, 136, 209, 0.15), 0 15px 15px -5px rgba(2, 136, 209, 0.15), 0 20px 20px -5px rgba(2, 136, 209, 0.15);
	}
	.sideMove .side_link {
		padding: 10px;
		list-style: none;
		text-align: center;
		position: relative;
		font-size: 12px;
		font-weight: bold;
		transition: 0.5s ease;
		cursor: pointer;
		user-select: none;
	}
	.sideMove .side_link:hover {
	  	color: #0288D1;
	}

	.sideMove .side_bar {
		 top: 0;
		 left: 0;
		 position: absolute;
		 background: #0288D1;
		 width: 5px;
		 height: 50%;
		 transition: 0.35s cubic-bezier(0.32, 1.4, 0.13, 1.4);
	}
	
	#roomNoMove{
		border: 0;
		outline:0;
		height: 40px;
		width : 60px;
		background: transparent;
		transition: border-color 0.2s;
	}
	
	#roomNoMove:focus {
		 padding-bottom: 6px;
		 font-weight: 700;
		 border-width: 3px;
		 border-image: linear-gradient(to right, #11998e, #38ef7d);
		 border-image-slice: 1;
	}
	
/* 	#find{
		font-size: 9px;
		font-weight: 600;
		background: transparent;
		border-width: 0.5px;
		border-color: #f9f9f9;
	} */

    </style>

</head>

<body>
	<%@ include file = "../common/menubar.jsp" %>
	
	
	
 
	
	
	
		
	<div class="container">
		<% if(bList.isEmpty()){ %>
		<div align="center">
			<h2>등록된 게시글이 없습니다.</h2>
		</div>
		<%} else{ %>
			<% for(Comfort c : bList){ %>
		<div class="item col-md-12">
	    	<div class="dnow-regionsContent">
				<input type="hidden" class = "select" value="<%= c.getRoomNo() %>">
	        	<div class="card bg-dark text-white">
	        	<% for(Attachment a : fList) { %>
	        		<% if(c.getRoomNo() == a.getRoomNo()){ %>
					<img src="<%= request.getContextPath() %>/image_uploadFiles/<%= a.getChangeName() %>" alt="thubmNail" >
					<% } %>
				<% } %>
	               	<div class="overlay-div"></div>
	               		<div class="card-img-overlay d-flex align-items-center">
		                	<div class="row">
		           				<div class="text-content">
		           					<span class = "selectNo">
		           					<%= c.getRoomNo() %>
		           					</span>
		                			<h2><i>#</i><i><%= c.getRoomTitle() %></i>
									</h2>
		                  			<h3>
										<%= c.getSlogan() %>
		                 			</h3>
		                 			<span class="meta date-type">
										<i class="fa fa-calendar"></i> <%= c.getModifyDate() %>
									</span>
									<span class="meta author-meta">
										<i class="fa fa-user"></i>
										<%= c.getAdminName() %>
									</span>
									
	            				</div>
	             			</div>
	             		</div>
	           	 </div>
			</div>
		</div>
		<% } %>
	<% } %>
	</div>
	<div class="btn">
	<% if(loginAdmin != null){ %>
	<input type="button" class="btn btn-outline-primary" onclick="location.href='<%= request.getContextPath() %>/comfortWriteForm.wr'" id="writeComfort" value="+">
	<% } %>
	</div>
	
	<script>
		$('.dnow-regionsContent').click(function(){
			var roomNo = $(this).children().eq(0).val();
			console.log(roomNo);
			location.href="<%= request.getContextPath() %>/comfort.de?rNo=" + roomNo;
		})
	</script>
	
	



	
 <div class="searchBox">
    <input id="searchInput" class="searchInput"type="text" name="" placeholder="Search">
    <button class="searchButton">
      <i class="material-icons">
        search
      </i>
    </button>
  </div>
	<script>
	$('#searchInput').keypress(function(key){
		if(key.keyCode == 13){
			
		// height 변수에 comfort1의 아이디를 가진 위치값 저장
			var roomNo = $(this).val();
			var offset = "";
			$('.select').each(function(index, item){
				if($(this).val() == parseInt(roomNo)){
					offset = $(this).parent().eq(0).offset();
				}
			});
			
		if(offset == ""){
			alert("없는 숙소 게시글 번호입니다.")
			
		}
		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
		$("html, body").animate({scrollTop: offset.top},400);;
			
		}
	});

</script>


<!-- 	<div class="sideMove"> -->
<!-- 		<div class="side"> -->
<!-- 			<div class="side_link" id="sideRoom"> -->
<!-- 				<input type="text" name="roomNoMove" id="roomNoMove" placeholder="숙소검색"> -->
<!-- <!-- 				<input type="button"  id="find" value="이동"> --> -->
<!-- 			</div> -->
<!-- 			<div class="side_bar"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<script> 
// 	$('#roomNoMove').keypress(function(key){
// 		if(key.keyCode == 13){
			
// 		// height 변수에 comfort1의 아이디를 가진 위치값 저장
// 			var roomNo = $(this).val();
// 			var offset = "";
// 			$('.select').each(function(index, item){
// 				if($(this).val() == parseInt(roomNo)){
// 					offset = $(this).parent().eq(0).offset();
// 				}
// 			});
			
// 		if(offset == ""){
// 			alert("없는 숙소 게시글 번호입니다.")
			
// 		}
// 		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
// 		$("html, body").animate({scrollTop: offset.top},400);;
			
// 		}
// 	});

 </script> -->



<%@ include file = "../common/footer.jsp" %>

                    
</body>
</html>