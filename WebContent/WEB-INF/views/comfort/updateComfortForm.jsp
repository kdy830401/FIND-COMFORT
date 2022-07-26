<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="comfort.model.vo.*, java.util.ArrayList"%>
    
<%
	Comfort comfort = (Comfort)request.getAttribute("comfort");
	ArrayList<Feature> featList = (ArrayList<Feature>)request.getAttribute("featureList");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList"); 
	ArrayList<Around> aroundList = (ArrayList<Around>)request.getAttribute("aroundList");
	
	String[] selectedRoomType = new String[9];
	switch(comfort.getRoomType()){
		case "게스트하우스" : selectedRoomType[0] = "selected"; break;
		case "렌탈하우스" : selectedRoomType[1] = "selected"; break;
		case "펜션" : selectedRoomType[2] = "selected"; break;
		case "한옥" : selectedRoomType[3] = "selected"; break;
		case "캠핑&아웃도어" : selectedRoomType[4] = "selected"; break;
		case "호스텔" : selectedRoomType[5] = "selected"; break;
		case "리조트" : selectedRoomType[6] = "selected"; break;
		case "민박" : selectedRoomType[7] = "selected"; break;
		case "호텔" : selectedRoomType[8] = "selected"; break;
	}
	String[] selectedLocationType = new String[13];
	switch(comfort.getLocationType()){
		case "제주" : selectedLocationType[0] = "selected"; break;
		case "서울" : selectedLocationType[1] = "selected"; break;
		case "강원" : selectedLocationType[2] = "selected"; break;
		case "부산" : selectedLocationType[3] = "selected"; break;
		case "경기" : selectedLocationType[4] = "selected"; break;
		case "충청" : selectedLocationType[5] = "selected"; break;
		case "경상" : selectedLocationType[6] = "selected"; break;
		case "전라" : selectedLocationType[7] = "selected"; break;
		case "인천" : selectedLocationType[8] = "selected"; break;
		case "광주" : selectedLocationType[9] = "selected"; break;
		case "대전" : selectedLocationType[10] = "selected"; break;
		case "대구" : selectedLocationType[11] = "selected"; break;
		case "울산" : selectedLocationType[12] = "selected"; break;
	}	
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">

    <title></title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
   <style>
    
    
    /*  TYPOGRAPHY   */
	
	
	h2 {
		font-size: 4vmin; /* vmin: 뷰포트 너비 또는 높이를 기준으로 하는 최소값(둘중 작은거) */
	    font-weight: bold;
    }

  	h3 {
		font-size: 3vmin;
		font-weight: bold;
		margin: 2vmin 0 1vmin 0;
  	}

	.form__group {
	  position: relative;
	  padding: 15px 0 0;
	  margin-top: 10px;
	}
	
	.form__field {
	  font-family: inherit;
	  width: 100%;
	  border: 0;
	  border-bottom: 2px solid #e9ecef;
	  outline: 0;
	  font-size: 1rem;
	  padding: 7px 15px;
	  background: transparent;
	  transition: border-color 0.2s;
	}
	.form__group textarea,.lg{
	  margin-top: 10px;
	  display: block;
	  width: 100%;
	  resize: none;
	}

	.form__field::placeholder { /* form__field 클래스 내 placeholder를 선택 */
	  color: transparent;
	}
	.form__field:placeholder-shown ~ .form__label {
	/* :placeholder-shown placeholder 텍스트가 보이는 상태인지 아닌지 체크할 수 있는 가상클래스
		a ~ b : a태그 뒤에 있는 모든 b 태그를 선택
	*/
	 	font-size: 1.1rem;
	 	font-weight: 400;
	  	cursor: text;
	 	top: 20px;
		color: #868e96;	
	}
	
	.form__label {
	  position: absolute;
	  top: 0;
 	  display: block; 
	  transition: 0.2s;
	  font-size: 1rem;
	  font-weight: 600;
	  color: #495057;
	}
	
	.form__field:focus {
	  padding-bottom: 6px;
	  font-weight: 700;
	  border-width: 3px;
	  border-image: linear-gradient(to right, #11998e, #38ef7d);
	  border-image-slice: 1;
	}
	.form__field:focus ~ .form__label {
	  position: absolute;
	  top: 0;
	  display: block;
	  transition: 0.2s;
	  font-size: 1rem;
	  color: #11998e;
	  font-weight: 700;
	}
	
	/* reset input */
	.form__field:required, .form__field:invalid {
	  box-shadow: none;
	}
	
	/* demo */
	
	.container{
		padding-bottom: 60px;
	  	padding-top: 50px;
	}
	.img-lay{
		padding-bottom: 60px;
		padding-top: 0px;
	}
	select{
		margin-top:10px;
	}

  	/*IMAGE UPLOAD CSS */
	.outer {
		width:100%; height:auto; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	p{
		font-weight: 600;
		font-size: 20px;
	}
	.insertArea, form{
		margin-top:50px;
		width:100%;
		}
/* 	#contentImgArea0:hover, #contentImgArea1:hover, #contentImgArea2:hover {
		cursor:pointer;
		background: rgba(0, 0, 0, 0.8);	
		color: #fff;
		transition-duration: 0.5s;
	}
	
	#contentImgArea0, #contentImgArea1, #contentImgArea2{
		width:90px; 
		height:90px; 
		display:flex;
		flex-direction: column;
		text-align:center; 
		margin: auto;
		margin-top: 70px;
		margin-bottom: 70px;
	} */
  
	#insertThumbTable{
		margin: auto;
	}
	
	#slideLayout, #galleryLayout, #thumbLayout{
		justify-content: center;
	}
	
	}
	
	.no-gutters{
		padding: 10px;
	}
	
	.img-fluid{
		height: 100%;
	}
	
	
	/* AROUND INPUT */
	.around{
		margin-bottom: 30px;
	}
	.btn-dark{
		width: 10%;
		
		font-weight: 600;
		margin-bottom: 20px;
	}
	.btn-dark:hover{
  		cursor:pointer;
  		background: rgba(0, 0, 0, 0.1);
  	}
  	
  	/* side move*/
	.sideMove {
	  display: grid;
	  place-content: center;
	  height: 100vh;
	  position: fixed;
	  right:15px;
	  bottom : 20px;
	  
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
	  flex: 1;
	  padding: 20px;
	  list-style: none;
	  text-align: center;
	  position: relative;
	  font-size: 15px;
	  font-weight: bold;
	  transition: 0.5s ease;
	  cursor: pointer;
	  user-select: none;
	}
	.sideMove .side_link:hover {
	  color: #0288D1;
	}
	.sideMove .side_link:hover:nth-of-type(2) ~ .side_bar {
	  top: 25%;
	}
	.sideMove .side_link:hover:nth-of-type(3) ~ .side_bar {
	  top: 50%;
	}
	.sideMove .side_link:hover:nth-of-type(4) ~ .side_bar {
	  top: 75%;
	}
	.sideMove .side_bar {
	  top: 0;
	  left: 0;
	  position: absolute;
	  background: #0288D1;
	  width: 5px;
	  height: 25%;
	  transition: 0.35s cubic-bezier(0.32, 1.4, 0.13, 1.4);
	}
	.btn-outline-primary {
		margin-bottom : 20px;
	}
	.btn{
		margin-bottom: 20px
	}
    </style>
</head>   	
	
<body>

	<%@ include file = "../common/menubar.jsp" %>

	<div class="container">
			<!-- 파일업로드를 위해 enctype을 지정해줘야 된다. -->
		<form action="<%= request.getContextPath() %>/comfort.re" method="post" encType="multipart/form-data" id="writeFrom"><!-- 파일올리는 거기 때문에 -->
		<input type="hidden" id="roomNo" name="roomNo" value="<%= comfort.getRoomNo() %>">
			<div class="outer" id="comfort1">
				<div class="text-center">
					<div class="col-md-auto mb-5 mt-5">
		         		<h2 class="mb-3">
			  	 		COMFORT(1/3)
		          		</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="숙소명" name="roomTitle" id="roomTitle" value="<%= comfort.getRoomTitle() %>" required >
			  				<label for="roomTitle" class="form__label">숙소명</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group">
							<input type="text" class="form__field" placeholder="주소" name="address" id="address" value="<%= comfort.getAddress() %>" required >
			  				<label for="address" class="form__label">주소</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="전화" name="roomPhone" id="roomPhone" value="<%= comfort.getRoomPhone() %>"required >
			  				<label for="roomPhone" class="form__label">전화</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<select class="form__field" id="roomType" name="roomType" required>
								<option value="" ></option>
								<option value="1" <%= selectedRoomType[0] %>>게스트하우스</option>
								<option value="2" <%= selectedRoomType[1] %>>렌탈하우스</option>
								<option value="3" <%= selectedRoomType[2] %>>펜션</option>
								<option value="4" <%= selectedRoomType[3] %>>한옥</option>
								<option value="5" <%= selectedRoomType[4] %>>캠핑&아웃도어</option>
								<option value="6" <%= selectedRoomType[5] %>>호스텔</option>
								<option value="7" <%= selectedRoomType[6] %>>리조트</option>
								<option value="8" <%= selectedRoomType[7] %>>민박</option>
								<option value="9" <%= selectedRoomType[8] %>>호텔</option>
							</select>
			  				<label for="roomType" class="form__label">숙소타입</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="인원" name="roomPeople" id="roomPeople" value="<%= comfort.getRoomPeople() %>" required >
			  				<label for="roomPeople" class="form__label">인원</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="객실수" name="roomCount" id="roomCount" value="<%= comfort.getRoomCount() %>" required >
			  				<label for="roomCount" class="form__label">객실수</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="객실가격대" name="roomPrice" id="roomPrice" value="<%= comfort.getRoomPrice() %>" required >
			  				<label for="roomPrice" class="form__label">객실가격대</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="체크인시간" name="checkInTime" id="checkIn" value="<%= comfort.getCheckInTime() %>" required >
			  				<label for="checkIn" class="form__label">체크인시간</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="체크아웃시간" name="checkOutTime" id="checkOut" value="<%= comfort.getCheckOutTime() %>" required >
			  				<label for="checkOut" class="form__label">체크아웃시간</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<select class="form__field" id="locationType" name="locationType" required>
								<option value=""></option>
								<option value="1" <%= selectedLocationType[0] %>>제주</option>
								<option value="2" <%= selectedLocationType[1] %>>서울</option>
								<option value="3" <%= selectedLocationType[2] %>>강원</option>
								<option value="4" <%= selectedLocationType[3] %>>부산</option>
								<option value="5" <%= selectedLocationType[4] %>>경기</option>
								<option value="6" <%= selectedLocationType[5] %>>충청</option>
								<option value="7" <%= selectedLocationType[6] %>>경상</option>
								<option value="8" <%= selectedLocationType[7] %>>전라</option>
								<option value="9" <%= selectedLocationType[8] %>>인천</option>
								<option value="10" <%= selectedLocationType[9] %>>광주</option>
								<option value="11" <%= selectedLocationType[10] %>>대전</option>
								<option value="12" <%= selectedLocationType[11] %>>대구</option>
								<option value="13" <%= selectedLocationType[12] %>>울산</option>
							</select>
			  				<label for="locationType" class="form__label">지역</label>
						</div>
					</div>
				</div>
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="숙소슬로건" name="slogan" id="slogan" value="<%= comfort.getSlogan() %>" required >
	  				<label for="slogan" class="form__label">숙소슬로건</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="숙소메인설명" name="mainText" id="mainText" required >"<%= comfort.getMainText() %>"</textarea>
	  				<label for="mainText" class="form__label">숙소메인설명</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="숙소위치설명" name="locationText" id="locationText"required >"<%= comfort.getLocationText() %>"</textarea>
	  				<label for="locationText" class="form__label">숙소위치설명</label>
				</div>
			</div>
			<div class="outer" id="comfort2">
				<div class="text-center">
					<div class="col-md-auto mb-5 mt-5">
		         		<h2 class="mb-3">
			  	 		COMFORT(2/3)
		          		</h2>
					</div>
				</div>
				<div class="col-12">
				<% for(int i = 0; i < featList.size(); i++){ %>
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="특징명" name="featureName<%= i+1 %>" id="featureName<%= i+1 %>" value="<%= featList.get(i).getFeatureName() %>" required >
	  				<label for="featureName<%= i+1 %>" class="form__label">특징명<%= i+1 %></label>
	  				<input type="hidden" name="origin_featureName<%= i+1 %>" value="<%= featList.get(i).getFeatureName() %>">
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="특징설명" name="featureText<%= i+1 %>" id="featureText<%= i+1 %>" required ><%= featList.get(i).getFeatureText() %></textarea>
	  				<label for="featureText<%= i+1 %>" class="form__label">특징설명<%= i+1 %></label>
				</div>
				<% } %>
			</div>
		</div>
		    <div class="outer" id="comfort3">
				<h2 align="center">COMFORT(3/3)</h2>
					<div class="insertArea">
						<div class="contentImgArea">
							<p align="center">THUMBNAIL</p>
								<div class="container img-lay">
									<div class="row no-gutters" id="thumbLayout">
										<%for(int i = 0; i < fileList.size(); i++){ %>
											<% if(fileList.get(i).getPhotoType() == 0){ %>
										<div class="col-md-6 col-lg-4" id="imgAreaThumb">
											<img id="contentImgThumb1" class="img-fluid image" src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">  
										</div>
										<div class="fileArea">
											<input class="upload" type="file" id="Img1" multiple="multiple" name="thumbImage_<%= fileList.get(i).getFileNo() %>" onchange="loadImg(this,1)" >
										</div>
										<% } %>
									<% } %>
									</div>
								</div>
						</div>
				
						<div class="contentImgArea">
							<p align="center">GALLERY</p>
								<div class="container img-lay">
									<div class="row no-gutters" id="galleryLayout">
										<%for(int i = 0; i < fileList.size(); i++){ %>
											<% if(fileList.get(i).getPhotoType() == 1){ %>
										<div class="col-md-6 col-lg-2" id="imgAreaGallery<%= 1 + i %>">
										<img id="contenImgGalleryImg<%= i + 1 %>" class="img-fluid image" src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">  
										</div>
										<div class="fileArea">
											<input class="upload" type="file" id="galleryImg<%= 1 + i %>" multiple="multiple" name="galleryImage_<%= fileList.get(i).getFileNo() %>" onchange="loadImg(this,<%= i + 1%>)">
										</div>
											<% } %>
										<% } %>
									</div>
								</div>
						</div>
						
						<div class="contentImgArea">
							<p align="center">SLIDE</p>
								<div class="container img-lay">
									<div class="row no-gutters" id="slideLayout">
										<%for(int i = 0; i < fileList.size(); i++){ %>
											<% if(fileList.get(i).getPhotoType() == 2){ %>
										<div class="col-md-6 col-lg-2" id="imgAreaSlide<%= i + 1 %>">
											<img id="contentImgSlide<%= i + 1 %>" class="img-fluid image-lay" src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">  
										</div>
										<div class="fileArea">
											<input class="upload" type="file" id="slideImg<%= 1 + i %>" multiple="multiple" name="slideImage_<%= fileList.get(i).getFileNo() %>" onchange="loadImg(this,<%= i + 1%>)">
										</div>
											<% } %>
										<% } %>
									</div>
								</div>
						</div>
				
				<!-- 파일 업로드 하는 부분 -->
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$(".fileArea").hide();
						
						$('[id^="imgArea"]').each(function(index, item){
							$(this).click(function(){
								$(this).next().children().first().click();
							});
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				
					function loadImg(input, num){
						if(input.files && input.files[0]){
								
							var reader = new FileReader();
							
							reader.onload = function(e){
								switch(num){
								case 1: $("#contentImgThumb1").attr("src", e.target.result); break;
								case 2: $("#contenImgGalleryImg2").attr("src", e.target.result); break;
								case 3: $("#contenImgGalleryImg3").attr("src", e.target.result); break;
								case 4: $("#contenImgGalleryImg4").attr("src", e.target.result); break;
								case 5: $("#contenImgGalleryImg5").attr("src", e.target.result); break;
								case 6: $("#contenImgGalleryImg6").attr("src", e.target.result); break;
								case 7: $("#contenImgGalleryImg7").attr("src", e.target.result); break;
								case 8: $("#contenImgGalleryImg8").attr("src", e.target.result); break;
								case 9: $("#contenImgGalleryImg9").attr("src", e.target.result); break;
								case 10: $("#contenImgGalleryImg10").attr("src", e.target.result); break;
								case 11: $("#contenImgGalleryImg11").attr("src", e.target.result); break;
								case 12: $("#contenImgGalleryImg12").attr("src", e.target.result); break;
								case 13: $("#contenImgGalleryImg13").attr("src", e.target.result); break;
								case 14: $("#contentImgSlide14").attr("src", e.target.result); break;
								case 15: $("#contentImgSlide15").attr("src", e.target.result); break;
								case 16: $("#contentImgSlide16").attr("src", e.target.result); break;
								case 17: $("#contentImgSlide17").attr("src", e.target.result); break;
								case 18: $("#contentImgSlide18").attr("src", e.target.result); break;
								
								}
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				</script>
				
					</div>
				</div>
				
		    <div class="outer" id="comfort4">
				<div class="text-center">
					<div class="col-md-auto mb-5 mt-5">
		         		<h2 class="mb-3">
			  	 		COMFORT(4/4)
		          		</h2>
					</div>
				</div>
				<div class="aroundSet" id="aroundUpdate">
					<div class="form__group field">
						<select class="form__field around" id="aroundSelect" name="aroundSelect">
							<option value="" ></option>
							<% for(int i = 0; i < aroundList.size(); i++){ %>
							<option value="<%= aroundList.get(i).getAroundName() %>"><%= aroundList.get(i).getAroundName() %></option>
							<% } %>
						</select>
		  				<label for="aroundSelect" class="form__label around">주변장소</label>
					</div>
				</div>
				</div>	
				<div class ="col-12" align="center">
					<input type="button" class="btn btn-outline-danger aroundNum"  onclick="removeAround()" value ="-">
				</div>
				
				
				
				<script>
				var index = 0;
				$('#aroundSelect').on("change", function(){
					var roomNo = $('#roomNo').val();
					$.ajax({
						url:"<%= request.getContextPath() %>/around.re",
						type: 'post',
						data:{rNo:roomNo},
						success: function(data){
							console.log(data);
								//버튼 클릭시 index에 1씩 추가
								for(var i in data){
									if($('#aroundSelect').val() == data[i].aroundName){
										index += 1
										var aroundSet = $('<div>');
										var fieldset = $('<fieldset>');
										fieldset.attr({'class':"around", name:"around"});
										var legend = $('<legend>');
										var h3 = $('<h3>').text("주변장소");
										
										var div1 = $('<div>').attr("class", "form__group field");
										var div2 = $('<div>').attr("class", "form__group field");
										var div3 = $('<div>').attr("class", "form__group field");
										var inputName = $('<input>').attr({type:'text', 'class':'form__field lg',
														name:'aroundName'+index, id:'aroundName'+index, value:data[i].aroundName, required:'required'});
										var labelName = $('<label>').attr({'class': 'form__label', 'for':'aroundName'+index}).text("주변장소명");
										var inputText = $('<input>').attr({type:'text', 'class':'form__field lg',
														name:'aroundText'+index, id:'aroundText'+index, value:data[i].aroundText, required:'required'});
										var labelText = $('<label>').attr({'class': 'form__label', 'for':'aroundText'+index}).text("주변장소설명");
										var inputFile = $('<input>').attr({type:'file', 'class':'form__field lg',
														name:'aroundImage'+index+"_"+data[i].changeName, required:'required'});
										var labelFile = $('<label>').attr('class', 'form__label').text("주변장소사진");
										var originName = $('<input>').attr({type:'hidden', name:'originAroundName'+index, value:data[i].aroundName});
										
										legend.append(h3);
										div1.append(inputName);
										div1.append(labelName);
										div1.append(originName);
										div2.append(inputText);
										div2.append(labelText);
										div3.append(inputFile);
										div3.append(labelFile);
										fieldset.append(legend);
										fieldset.append(div1);
										fieldset.append(div2);
										fieldset.append(div3);
										$('#aroundUpdate').append(fieldset);
										$('#aroundSelect').val("");
									}
								}
												
						},
						error: function(data){
							console.log(data);
						}
					});
				
				});
// 				var divbtn =$('<div>').attr({'class':'col-12', align:'center'});
// 				var remove = $('<input>').attr({type:'button','class':'btn btn-outline-danger aroundNum',onclick:'removeAround()'}).val('-');
// 				$('#aroundUpdate').append(divbtn);
					function removeAround(){
							$('fieldset[name=around]').last().remove();
							index -= 1;
					}
				
				</script>
				
				
				

			
   				<div id="btn" align="center">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" class="btn btn-dark" value="뒤로" onsubmit="dosubmit();">
					<input type="submit" class="btn btn-dark" value="수정">
				</div>
			
 		</form>
 
	</div>

<div class="sideMove">
  <div class="side"> 
    <div class="side_link" id="side1">COMFORT 1/4</div>
    <div class="side_link" id="side2">COMFORT 2/4</div>
    <div class="side_link" id="side3">COMFORT 3/4</div>
    <div class="side_link" id="side4">COMFORT 4/4</div>
    <div class="side_bar"></div>
  </div>
</div>
<script>
	$('#side1').click(function(){
		// height 변수에 comfort1의 아이디를 가진 위치값 저장
		var offset = $('#comfort1').offset();
		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
		$("html, body").animate({scrollTop: offset.top},400);;
	});
	$('#side2').click(function(){
		// height 변수에 comfort2의 아이디를 가진 위치값 저장
		var offset = $('#comfort2').offset();
		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
		$("html, body").animate({scrollTop: offset.top},400);;
	});
	$('#side3').click(function(){
		// height 변수에 comfort3의 아이디를 가진 위치값 저장
		var offset = $('#comfort3').offset();
		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
		$("html, body").animate({scrollTop: offset.top},400);;
	});
	$('#side4').click(function(){
		// height 변수에 comfort4의 아이디를 가진 위치값 저장
		var offset = $('#comfort4').offset();
		// animate 매개변수는 첫번째는 움직일 위치, 2번째는 속도
		$("html, body").animate({scrollTop: offset.top},400);;
	});
</script>
	



<!-- textarea태그 자동 줄생성 스크립트 -->
<script>
	/* textarea 태그를 선택하여 keydown keyup 이벤트 발생시키고
		해당 선택요소의 높이를 1늘리고 
		해당 요소에 scrolHeight속성을 넣어 스크롤 높이 만큼 textarea높이를 높이게함
	*/
	$("textarea").on('keydown keyup', function () {
	  $(this).height(1).height($(this).prop('scrollHeight'));	
	});
</script>


                    
</body>
</html>