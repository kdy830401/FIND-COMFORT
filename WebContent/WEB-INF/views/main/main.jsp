<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList,main.model.vo.*"%>
    <%
    ArrayList<Main> Tlist = (ArrayList<Main>)request.getAttribute("Tlist");
    ArrayList<Main> Slist = (ArrayList<Main>)request.getAttribute("Slist");
    ArrayList<Main> Alist = (ArrayList<Main>)request.getAttribute("Alist");
    %>
<!doctype html>
<html>
  <!-- Required meta tags -->
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 


	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
 	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comfort/owl.carousel.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comfort/owl.theme.default.min.css">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <title>Hello, world!</title>
	
    <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,100,700,300|Nothing+You+Could+Do' rel='stylesheet' type='text/css'>
	
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
	<script src="<%= request.getContextPath() %>/js/owl.carousel.min.js"></script>
	
	
	
<!-- style CSS -->

<style>


*{word-break: keep-all;}


@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{
 font-family: 'GowunDodum-Regular';
}

.logo{
	margin-top: 50px;
}

/* 슬라이드 */
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

   .slide-img{
  		height: 95vh;
  		object-fit: fill;
  }
	

 /* 맛집슬라이드*/
 .swiper-container {
	/*margin-top:150px;*/
	height:530px;
}

.swiper-slide {
	text-align:center;
	display:block; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}


.swiper-slide:hover{
cursor:pointer;
}

.swiper-slide img {
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}


	
/* 	
맛집 슬라이드 동그라미 스타일 */
.swiper-pagination-bullet { 
width: 10px; 
height: 10px; 
background: transparent;
border: 1px solid black; 
opacity: 1; 
}
/* 	
맛집 슬라이드 동그라미 스타일 */								 
.swiper-pagination-bullet-active { 
width: 20px; 
transition: width .5s;
border-radius: 5px;
background: black; 
border:1px solid transparent; 
}



 
/* 팀원소개 */

.introduce {   
    width: 60%;
    margin: auto;
    overflow: hidden;

    }
    
.introduce-item {
    width: 100%;
    height: auto;
    position: relative;
}
.introduce-item img { 
    width: 95%;
    height: 100%;
    object-fit: contain;

}

.inimg-item{ 
position:relative;
}


.intext-1{
position: absolute;
top: 0;
left:0;
bottom: 0;
width: 60%;
height:  100%;
background: rgba(0, 0, 0, 0.6);
color: white;
font-family: sans-serif;
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
opacity: 1;
transition: opacity 0.1s;
}


.intext-1:hover {
transition: width .5s;
opacity: 1;
width: 95%;
}

[class^="ingrid"]{
display:flex;
}


@media only screen and (min-width: 640px) {
.introduce{
      display: grid;
      grid-template-columns: 1fr 1fr;
      grid-colmun-gap: 50px;
}
	
}
.ingrid1 {
      display:  block;
      row-gap: 3px;

    
}
.ingrid2 {
      display: block;
      row-gap: 3px;
   
      
      
}
.ingrid3 {
      display: block;
      row-gap: 3px;
 
}

/*각 숙소 대표사진 */
.favorite {  
    overflow: hidden;
}
.favorite-item {
    position: relative;
}
.favorite-item img {
    width: 100%;
    height: 330px;
    object-fit: cover;
}

.img-item{ 
width: 100%;
position:relative;
}


.text-1{
position: absolute;
top: 0;
bottom: 0;
width: 100%;
height: 100%;
background: rgba(0, 0, 0, 0.6);
color: white;
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
opacity: 0;
transition: opacity 0.5s;
font-size:20px;

}


.text-1:hover {
cursor:pointer;
opacity: 1;
}

[class^="grid"]{
display:flex;
}

@media only screen and (min-width: 640px) {
.favorite {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
	
}


.text-small {
  font-size: 0.9rem;
}

a {
  color: inherit;
  text-decoration: none;
  transition: all 0.3s;
}


</style>

</head>

<body>
	<%@ include file = "../common/menubar.jsp" %>
  
  <!-- 메인 슬라이드 -->

  	<%if(Slist.size() > 3) {%>
	<div class="owl-carousel owl-theme" id="slide">
		<% for(int i = 1; i < Slist.size(); i++){ %>
	    <div class="item slide-img"> 
	    	<div class="carousel-item active slide-img" onclick = "location.href = '<%=request.getContextPath()%>/comfort.de?rNo=<%=Slist.get(i).getRoomNo()%>'" style = "cursor:pointer;">
	    	<img class="slide-img" src="<%= request.getContextPath() %>/image_uploadFiles/<%= Slist.get(i).getChangeName() %>" class="d-block w-100" alt="slide">
		   	</div>
	   	</div>
		<% } %>
	<% } %>
	</div>
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
			dots : false
		});
	</script> 



<!--  숙소소개 -->
<div class = "information">
<h1 class="text-center"><input type ="hidden" name = "no" value= "1"><%--<%=title %>--%></h1>
<br>
<%--<%=content %>--%>


<div class="center logo" align="center">
<img src = "images/logo.png" width="20%">
</div>
<br><br>
<h2 class="text-center"><strong>FIND COMFORT</strong></h2>
<br>

<h5 class="text-center">' 붐비는 전철과 시끌벅적한 거리, 외부와 사람들로부터 떨어져 먹먹한 고독의 시간을 누리고 싶을 때가 있다. '</h5>


<br>
<p class="text-center">도시와 일상에서 벗어나 자연이나 시골의 품 안에서가 아닌 온전히 자신 안에서 내면의 얼굴과 마주하는 고독의 시간. <br>
거부하려 해도 거부할 수 없는, 알 수 없는 다음으로 흐르는 시간과 그에 따라 아침이면 찾아드는 빛과 밤이면 내려앉는 어둠으로부터 완벽하게 벗어나기 위해서는 어디론가 떠나야만 한다.<br>
 불변의 법칙. 그 '어디'는 시공간을 초월한 사차원의 어딘가가 아니고서는 절대적으로 불가능할 것만 같다. 눈을 감아도 다음 날 아침이면 새로운 자극이 생겨나고, 
 <br>잠에 들어도 일상과의 연결은 진행형이기 때문이다.
  고립과 차단이라는 낭만적인 단어를 품으려는 바람은 적극적이고도 체계적으로 설계, 기획된 치밀하고도 정성스러운 공간에서만 이뤄질 수 있다.
  <br>여유는 있는 것이 아니라 찾는 것이다.세상과의 교집합에서 한걸음 떨어져 나올 수 있는 여유의 공간. 
 넉넉히 남음이 있어 느긋하고 차분하게 생각하거나 행동할 수 있는 마음의 상태는 갖고 있는 것이 아니라, 
 <br> 찾아야만 한다. 외부로 향한 시선을 자신에게로 돌리면서. 그것을 발견할 수 있는 고요한 그 '어디'를 찾고자한다면  FIND COMFORT로 떠나야만 한다.
  
 </p>

</div>

<br><br><br><br>

<br><br><br>


<!-- 대표숙소 갤러리 -->
<% if(Tlist.size() == 9){ %>
<h5 class="text-center">특별한 시간을 선물하는
<br>
Only - Comfort</h5>
<br>
<div class="favorite" id="favorite">
      <% for(int i = 0; i < 9; i++) {%>
	<div class="favorite-item" id="favorite-item">
        <div class="grid<%= i + 1 %>" id="grid<%= i + 1 %>">
          <div class="img-item">
          	<img class="img-fluid image" src="<%=request.getContextPath()%>/image_uploadFiles/<%=Tlist.get(i).getChangeName()%>" id ="s<%=i+1 %>" alt="favorite img"/>
            <div class="imgtext">
     	        <div class="text-1"  onclick = "location.href = '<%=request.getContextPath()%>/comfort.de?rNo=<%=Tlist.get(i).getRoomNo()%>'" id ="s2">
     	        	<%=Tlist.get(i).getRoomTitle()%>
   	        	</div>
       	    </div>
   	    </div>
      </div>
   </div>
      <% } %>
</div>
   
      

<%} %>


<br><br><br><br><br>
<br><br><br>
<br><br><br>


<!-- 맛집 슬라이드 -->
<!-- 클래스명은 변경하면 안 됨 -->
 <!-- 맛집 슬라이드 -->
<!-- 클래스명은 변경하면 안 됨 -->
<h5 class="text-center aroundMain"> 오 직 파 인 드 컴 폴 트 에 서 만</h5>
	
  <br>
  <% if(!Alist.isEmpty()){ %>
<div class="swiper-container">
	<div class="swiper-wrapper">
	<%for(int i = 0; i < Alist.size(); i++){ %>
		<div class="swiper-slide" onclick = "location.href = '<%=request.getContextPath()%>/comfort.de?rNo=<%=Alist.get(i).getRoomNo()%>'">
			<img src="<%=request.getContextPath()%>/image_uploadFiles/<%=Alist.get(i).getChangeName()%>" width="400px" height="230px">
			<br><br>
			<p>
				<strong>
					"<%=Alist.get(i).getAroundName()%>"
				</strong>
			</p>
				<%=Alist.get(i).getAroundText()%>
		</div>

		<% } %>
	<% } %>
	</div>
	<div class="swiper-pagination"></div>
	<!-- 네비게이션 -->
</div>





<script>
   new Swiper('.swiper-container', {

	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 10, // 슬라이드간 간격
	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,
	mousewheel : true,

	loop : true, // 무한 반복
	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		dynamicBullets: true,
		dynamicMainBullets: 2,
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	}
});
   
   
 </script>

   
   <br><br><br><br><br><br>
      <br><br>
   
   
    <!-- 팀원 소개 -->
<h5 class="text-center"><img src ="images/album.png" width=15px;> I N T R O D U C E</h5>
<p class="text-center">"우 리" 들 을 소 개 합 니 다</p>
 <div class ="ohye" style = "background: #f9f9f9; width:100%;"> 
<div class="introduce" id="introduce"> 
      <div class="introduce-item" id="introduce-item">
        <div class="ingrid1" id="ingrid1">
          <div class="inimg-item">
                  <img src="images/주희1.jpg"  alt="favorite img"/>
            <div class="inimgtext">
              <div class="intext-1" style="font-family: 'GowunDodum-Regular'">주희,<br>숙소를 찾으시나요? WITH FIND COMFORT</div>
            </div>
          </div>
          <div class="inimg-item">
                 <img src="images/민경.jpg" alt="favorite img"/>
            <div class="inimgtext">
              <div class="intext-1" style="font-family: 'GowunDodum-Regular'">민경,<br>멋지고 아름다운 숙소, FIND COMFORT</div>
            </div>
          </div>

    
        </div>
      </div>

      <div class="introduce-item" id="introduce-item">
        <div class="ingrid2" id="ingrid2">
          <div class="inimg-item">
                  <img src="images/대열1.jpg" alt="favorite img"/>
                 <div class="inimgtext">
              <div class="intext-1" style="font-family: 'GowunDodum-Regular'">대열,<br> 세상에 하나뿐인 편안함 FIND COMFORT</div>
            </div>
          </div>
          
          <div class="inimg-item">
                 <img src="images/동호1.jpg" alt="favorite img"/>
            <div class="inimgtext">
              <div class="intext-1" style="font-family: 'GowunDodum-Regular'">동호,<br>디테일한 부분도 놓치지 않는 FIND COMFORT</div>
            </div>
          </div>

    
        </div>
        </div>
      </div>
 </div>
 <!-- </div> -->
   <br><br><br><br><br>
   
	<%@ include file = "../common/footer.jsp" %>
  
   
  </body>
</html>