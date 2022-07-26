<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="comfort.model.vo.*, java.util.ArrayList"%>

<%
	Comfort comfort = (Comfort)request.getAttribute("comfort");
	ArrayList<Feature> featList = (ArrayList<Feature>)request.getAttribute("featureList");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList"); 
	ArrayList<Around> aroundList = (ArrayList<Around>)request.getAttribute("aroundList");
%>    
    
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">

    <title></title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
 	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comfort/owl.carousel.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comfort/owl.theme.default.min.css">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

	<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=n488rww3tj&submodules=geocoder"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
	<script src="<%= request.getContextPath() %>/js/owl.carousel.min.js"></script>
	
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
 		word-break: keep-all;
	}
  
/* 	p{ */
/* 	    color: color: rgba(0,0,0,0.7); */
/* 	    font-size: 15px; */
/* 	    line-height: 30px; */
/* 	    font-weight: 300; */
/* 	} */
	
	h1,h2,h3,h4,h5,h6 {
	    font-weight: bold;
	    line-height: inherit;
    }


  	#info h3 {
		font-weight: 600;
		font-size: 18px;
		margin: 10px 0 10px 0;
  	}
  	
	#info h2{
	    font-weight: bold;
	    font-size: 1.4rem;
	    text-transform: uppercase;
	    padding-bottom: 20px; 
	 
	}
	
  	#features h3 {
		font-weight: 600;
		font-size: 18px;
		margin: 10px 0 10px 0;
  	}
    
   	.details>h3{
	    color: #454545;
	}
	
	.heading{
	    margin-bottom: 30px;
	    text-align: center;
	}

	.heading h2{
	    font-weight: bold;
	    font-size: 1.4rem;
	    text-transform: uppercase;
	    padding-bottom: 20px; 
	 
	}
	
    
    #features, #location, #info{
    	background: #f9f9f9;
    }
    
    /*Information  */
    .information{
    	margin-left: 30px;

    }
    .information h3{
   		border-bottom: 1px solid #c9bfbf;
   		line-height: inherit;
	}
 
	
	/* 오버레이 css */
	.dnow-regionsContent .overlay-div {
 	    height: 60%; 
 	    width: 100%; 
	    position: absolute;
	    top: 200px;
	    background-color: #000;
	    opacity: 0.5;
	    
	}
	
	.dnow-regionsContent img {
    	max-height: 40rem;
	}
	
	/* around 영역 carousel */
	
	.text-content{
		margin-top: 200px;
	}
	
	.around{
		height: 500px;
	}
	
  	#aroundCarousel.owl-theme .owl-nav [class*=owl-] {
  		background: #f9f9f9;
	    border-radius: 2px;
	    font-size: 16px;
	    width: 30px;
	    height: 30px;
	    line-height: 30px;
	    text-align: center;
	    padding: 0;
  	}
  	
  	/* 슬라이드 영역 */
  	#slide.owl-theme .owl-nav [class*=owl-] {
  		background: #f9f9f9;
	    border-radius: 2px;
	    font-size: 16px;
	    width: 30px;
	    height: 30px;
	    line-height: 30px;
	    text-align: center;
	    padding: 0;
  }
  
   .slide-image{
  		height: 90vh;
  		object-fit: fill;
  }
	
  
	
	/* 특징소개 grid css */
	.cards{
	    display: grid;
	    grid-template-columns: repeat(auto-fit,minmax(300px,auto));
	    padding: 10px;
	    grid-gap: 40px;
	    justify-items: center;
	    
	}
	
	.card.card1, .card.card2, .card.card3{
	    border: 1px solid #f0f0f0;
   		padding: 1em 1em;
   		background: #fffff;
	}	
	
	.details{
		text-align: center;
     	padding: 5px 20px
    	
	}
	
	.details span {
	    background: rgba(0, 0, 0, 0.8);
	    border-radius: 40px;
	    color: #ffffff;
	    font-size: 25px;
	    font-weight: bold;
	    display: inline-block;
	    width: 50px;
	    height: 50px;
	    line-height: 50px;
	    text-align: center;
	    margin-bottom: 30px;
	    vertical-align: middle;
	  }
	  

	.container{
		padding-bottom: 60px;
	  	padding-top: 60px;
	}
	
	#map{
		padding: 10px;
     	border: 1px solid #f0f0f0;
	}
	
	/* gallery css */
	.no-gutters{
		padding: 10px;
	}
	
	.gallery-block.compact-gallery .item{
		overflow: hidden;
		margin-bottom: 0;
		background: black;
		opacity: 1;
	}
	
	.gallery-block.compact-gallery .item .image{
	  	transition: 0.8s ease;
	  	height: 230px;
	}
	
	.img-fluid{
		width: 100%;
	}
	
	
	
	@media (min-width: 576px) {
	
	  .gallery-block.compact-gallery .item .description {
	    opacity: 0; 
	  }
	
	  .gallery-block.compact-gallery .item a:hover .description {
	    opacity: 1; 
	  } 
	
	  .gallery-block .zoom-on-hover:hover .image {
	    transform: scale(1.3);
	    opacity: 0.7; 
	  }
	}

	#updateBtn{
	position: fixed;
	bottom : 40px;
	right: 50px;
	z-index: 1;
	}
	
    </style>

</head>

<body>
	<%@ include file = "../common/menubar.jsp" %>
<div class="comfort">
	<!-- 숙소이름 -->
	<div class="container">
		<div class="text-center">
			<div class="col-md-auto mb-5 mt-5">
          	 <h2 class="mb-3">
		  	 	<%= comfort.getRoomTitle() %>
           	</h2>
			</div>
		</div>
	</div>
	<!-- Carousel 슬라이드 -->
	<div class="owl-carousel owl-theme" id="slide">
	<%for(int i = 1; i < fileList.size(); i++){ %>
		<% if(fileList.get(i).getPhotoType() == 2) { %>
    <div class="item slide-img">
    	<img class="slide-image" src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>" class="d-block w-100" alt="slide">
   	</div>
   		<% } %>
	<% } %>
	</div>
	
	
	<!-- 숙소 소개 영역 -->
	<div class="container">
		<div class="text-center">
			<div class="col-md-auto mb-5 mt-5">
		  	 <h2 class="mb-4 slogan" id="slogan">
		  	 	<%= comfort.getSlogan() %>
          	 </h2>
          	 <h5>
		  	 	<%= comfort.getRoomTitle() %>
           	</h5>
			</div>
		</div>
 		<div class="row">
			<div class="text-center">
		  	 <p id="mainText">
		   		<%= comfort.getMainText() %>
           	</p>
      
			</div>
		</div>
	</div>
	
	<!-- 특징 소개 영역 그리드 버전 -->
	<section id="features">
	<div class="container">
      <div class="heading">
         <h2>FEATURES</h2>
       </div>
		<div class="cards">
		<% for(int i = 0; i < featList.size(); i++){ %>
        <div class="card card<%= i + 1 %>">
            <div class="details">
            	<span>0<%= i + 1 %></span>
                <h3 class="text-center" id="featureName<%= i %>"><%= featList.get(i).getFeatureName() %></h3>
                <p class="text-center" id="featureText<%= i %>">
                	<%= featList.get(i).getFeatureText() %>
                </p>
            </div>
        </div>
        <% } %>
    	</div>
   	</div>
	</section>
   	
       <!-- 갤러리 영역  -->
<!-- 	<section class="gallery-block compact-gallery"> -->
	  	<div class="container gallery-block compact-gallery">
            <div class="heading">
                <h2>Gallery</h2>
            </div>
            <div class="row no-gutters" id="galleryLayout">
            <% for(int i = 0; i < fileList.size(); i++){ %>
            	<% if(fileList.get(i).getPhotoType() == 1) { %>
            	<div class="col-md-6 col-lg-4 item zoom-on-hover">
                    <a class="lightbox" href="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">
                        <img class="img-fluid image" src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">
                    </a>
                </div> 
                <% } %>
               <% } %>
            </div>
        </div>
<!--     </section> -->
    
    <!-- Location 영역 -->
    <section id="location">
	    <div class="container">
	      <div class="heading">
	         <h2>Location</h2>
	       </div>
	       <p class="text-center" id="locationText">
	       	<%= comfort.getLocationText() %>
	       	</p>
	       
			<div id="map" style="width:100%; height: 500px;"></div>
		</div>
	</section>
	
	<!-- Around 영역 -->
	 <section id="around">
	 	<div class="container">
	   		<div class="heading">
	        	<h2>AROUND</h2>
	       	</div>
			<div class="owl-carousel owl-theme" id="aroundCarousel">
			
				<% for(int i = 0; i < aroundList.size(); i++){ %>
	    		<div class="item2">
	    			<div class="dnow-regionsWrap">
		      			<div class="dnow-regionsContent">
		        			<div class="card bg-dark text-white">
		            			<img class="around" src="<%= request.getContextPath() %>/image_uploadFiles/<%= aroundList.get(i).getChangeName() %>" alt="aroundImg<%= i %>">
		            			<div class="overlay-div"></div>
		            			<div class="card-img-overlay d-flex align-items-center container">
		               				<div class="row">
		                  				<div class="text-content">
		                     				<h3 class="card-title" id="aroundName<%= i %>">
		                        				<%= aroundList.get(i).getAroundName() %>
		                     				</h3>
		                     				<p id="aroundText<%= i %>">
		                       			 		<%= aroundList.get(i).getAroundText() %>
					                    	</p>
					                  	</div>
				              	 	</div>
			            		</div>
				         	</div>
				      	</div>
	   				</div> 		
	  	 		</div>
	  	 		<% } %>
			</div>
		</div>
 	</section> 
 
 	<!-- 숙소 정보 영역 -->
	<section id="info">
      
 	<div class="container">
    	<div class="heading">
         <h2>Information</h2>
       	</div>
       	<div class="row">
          <div class="col-md-3">
            <hr>
            <h2 id="roomTitle"><%= comfort.getRoomTitle() %></h2>
          </div>
          <div class="col-md-4 information">
            <h3 id="address">주소</h3>
            <p><%= comfort.getAddress() %></p>
            
            <h3>전화</h3>
            <p id="roomPhone"><%= comfort.getRoomPhone() %></p>
            
            <h3>타입</h3>
            <p id="roomType"><%= comfort.getRoomType() %></p>
            
            <h3>지역</h3>
            <p id="locationType"><%= comfort.getLocationType() %></p>
     	 </div>
          <div class="col-md-4 information">
            <h3>인원</h3>
            <p id="roomPeople"><%= comfort.getRoomPeople() %></p>
            
            <h3>객실수</h3>
            <p id="roomCount"><%= comfort.getRoomCount() %></p>
            
            <h3>객실가격대</h3>
            <p id="roomPrice"><%= comfort.getRoomPrice() %></p>
            
            <h3>체크인 / 아웃</h3>
            <p><%= comfort.getCheckInTime() %> / <%= comfort.getCheckOutTime() %></p>
     	 </div>
     	</div>
    </div>
	</section>
	<% if(loginAdmin != null){ %>
	<div class="btn">
		<input type="button" class="btn btn-danger" id='updateBtn' value='수정하기'>
	</div>
	<% } %>
 </div>
 
 <br>
 <br>
 <br>
    
<script>
	$(document).ready(function(){
		var roomNo = "<%= comfort.getRoomNo() %>";
		$('#updateBtn').click(function(){
			location.href="<%= request.getContextPath() %>/comfortUpdateForm.re?rNo=" + roomNo;
		});
	});
		
		
</script>

<!-- 슬라이드 스크립트 -->
<script>
	$('#slide').owlCarousel({
		items: 1, //한 화면에 나오는 이미지 수
		margin: 10, //항목 사이의 간격을 10
		loop: true, // 무한 반복
		nav: true, // 내비게이션 버튼 추가
		navText: ["<i class='fa fa-angle-left'></i>","<i class='fa fa-angle-right'></i>"], // 내비게이션 위에 '이전/다음' 버튼 추가
		autoplay: true, // 자동 스크롤 실행
		autoplayTimeout: 3000, // 자동 스크롤 시간 간격
		autoplayHoverPause: true, // 마우스 포인터를 올리면 자동 스크롤 일시 정지
		dots :false
	});
</script> 

<!--갤러리 스크립트 -->
<script>
    
    baguetteBox.run('.compact-gallery', { animation: 'slideIn'});
    
</script>  

<!-- around(owl-carousel) 스크립트 -->
<script>
	
	$('.owl-carousel').owlCarousel({
		items: 2, //한 화면에 나오는 이미지 수
		margin: 10, //항목 사이의 간격을 10
		loop: true, // 무한 반복
		nav: true, // 내비게이션 버튼 추가
		navText: ["<i class='fa fa-angle-left'></i>","<i class='fa fa-angle-right'></i>"], // 내비게이션 위에 '이전/다음' 버튼 추가
		autoplay: true, // 자동 스크롤 실행
		autoplayTimeout: 3000, // 자동 스크롤 시간 간격
		autoplayHoverPause: true, // 마우스 포인터를 올리면 자동 스크롤 일시 정지
		dots :false
    
	})
</script>

<!-- 네이버 지도 api 스크립트 -->
<script>


	// 맵초기화 지도 객체 생성
	var map = new naver.maps.Map('map', { 
		scaleControl: false,	// 우측하단 scale 표시 
		mapDataControl: true,	// 좌측하단 @ Naver Corp 표시 
		zoomControl: true,		// 지도 줌 컨트롤
		scrollWheel: false,
		zoom: 17				// 지도 줌 레벨 
	}); 


	// 주소값 변수저장
	var addrVal = "<%= comfort.getAddress() %>";
	
	naver.maps.Service.geocode({ address: addrVal }, function(status, response) { 
		if (status === naver.maps.Service.Status.ERROR) { 
			return alert('Something wrong!'); 
			} 
		// response는 json형태로 정보를 반환
		var new_position = new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x)
		map.setCenter(new_position); 
		
		console.log(response);
		
		var marker = new naver.maps.Marker({ 
				position: new_position, 
				map: map 
			}); 
		});

</script>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>