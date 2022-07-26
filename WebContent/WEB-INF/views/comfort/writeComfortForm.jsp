<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		font-size: 10px;
	}
	.insertArea, form{
		margin-top:50px;
		width:100%;
		}
	#contentImgArea0:hover, #contentImgArea1:hover, #contentImgArea2:hover {
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
		border:2px solid darkgray;
		text-align:center; 
		margin: auto;
		margin-top: 70px;
		margin-bottom: 70px;
	}
  
	#insertThumbTable{
		margin: auto;
	}
	
	#slideLayout, #galleryLayout, #thumbLayout{
		justify-content: center;
	}
	
	.material-symbols-outlined {
		font-variation-settings:
		'FILL' 0,
		'wght' 400,
		'GRAD' 0,
		'opsz' 48;
		font-size: 30px;
		text-align: center;
	}
	
	.no-gutters{
		padding: 10px;
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
	.aroundNum {
		margin-bottom : 20px;
	}
    </style>
   	
	
<body>

	<%@ include file = "../common/menubar.jsp" %>

	<div class="container">
			<!-- 파일업로드를 위해 enctype을 지정해줘야 된다. -->
		<form action="<%= request.getContextPath() %>/comfort.wr" method="post" encType="multipart/form-data" id="writeFrom"><!-- 파일올리는 거기 때문에 -->
			<div class="outer" id="comfort1">
				<div class="text-center">
					<div class="col-md-auto mb-5 mt-5">
		         		<h2 class="mb-3">
			  	 		COMFORT(1/4)
		          		</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="숙소명" name="roomTitle" id="roomTitle" required >
			  				<label for="roomTitle" class="form__label">숙소명</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group">
							<input type="text" class="form__field" placeholder="주소" name="address" id="address" required >
			  				<label for="address" class="form__label">주소</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="전화" name="roomPhone" id="roomPhone" required >
			  				<label for="roomPhone" class="form__label">전화</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<select class="form__field" id="roomType" name="roomType" required>
								<option value=""></option>
								<option value="1">게스트하우스</option>
								<option value="2">렌탈하우스</option>
								<option value="3">펜션</option>
								<option value="4">한옥</option>
								<option value="5">캠핑&아웃도어</option>
								<option value="6">호스텔</option>
								<option value="7">리조트</option>
								<option value="8">민박</option>
								<option value="9">호텔</option>
							</select>
			  				<label for="roomType" class="form__label">숙소타입</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="인원" name="roomPeople" id="roomPeople" required >
			  				<label for="roomPeople" class="form__label">인원</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="객실수" name="roomCount" id="roomCount" required >
			  				<label for="roomCount" class="form__label">객실수</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="객실가격대" name="roomPrice" id="roomPrice" required >
			  				<label for="roomPrice" class="form__label">객실가격대</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="체크인시간" name="checkInTime" id="checkIn" required >
			  				<label for="checkIn" class="form__label">체크인시간</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<input type="text" class="form__field" placeholder="체크아웃시간" name="checkOutTime" id="checkOut" required >
			  				<label for="checkOut" class="form__label">체크아웃시간</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form__group field">
							<select class="form__field" id="locationType" name="locationType" required>
								<option value=""></option>
								<option value="1">제주</option>
								<option value="2">서울</option>
								<option value="3">강원</option>
								<option value="4">부산</option>
								<option value="5">경기</option>
								<option value="6">충청</option>
								<option value="7">경상</option>
								<option value="8">전라</option>
								<option value="9">인천</option>
								<option value="10">광주</option>
								<option value="11">대전</option>
								<option value="12">대구</option>
								<option value="13">울산</option>
							</select>
			  				<label for="locationType" class="form__label">지역</label>
						</div>
					</div>
				</div>
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="숙소슬로건" name="slogan" id="slogan" required >
	  				<label for="slogan" class="form__label">숙소슬로건</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="숙소메인설명" name="mainText" id="mainText" required ></textarea>
	  				<label for="mainText" class="form__label">숙소메인설명</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="숙소위치설명" name="locationText" id="locationText"required ></textarea>
	  				<label for="locationText" class="form__label">숙소위치설명</label>
				</div>
			</div>
			<div class="outer" id="comfort2">
				<div class="text-center">
					<div class="col-md-auto mb-5 mt-5">
		         		<h2 class="mb-3">
			  	 		COMFORT(2/4)
		          		</h2>
					</div>
				</div>
				<div class="col-12">
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="특징명" name="featureName1" id="featureName1" required >
	  				<label for="featureName1" class="form__label">특징명</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="특징설명" name="featureText1" id="featureText1" required ></textarea>
	  				<label for="featureText1" class="form__label">특징설명</label>
				</div>
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="특징명" name="featureName2" id="featureName2" required >
	  				<label for="featureName2" class="form__label">특징명</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="특징설명" name="featureText2" id="featureText2" required ></textarea>
	  				<label for="featureText2" class="form__label">특징설명</label>
				</div>
				<div class="form__group field">
					<input type="text" class="form__field lg" placeholder="특징명" name="featureName3" id="featureName3" required >
	  				<label for="featureName3" class="form__label">특징명</label>
				</div>
				<div class="form__group field">
					<textarea class="form__field" rows="1" placeholder="특징설명" name="featureText3" id="featureText3" required ></textarea>
	  				<label for="featureText3" class="form__label">특징설명</label>
				</div>
			</div>
		</div>
		    <div class="outer" id="comfort3">
				<h2 align="center">COMFORT(3/4)</h2>
					<div class="insertArea">
						<div id="contentImgArea0">
						<br>
							<span  id="contentImg0" class="material-symbols-outlined">add_a_photo</span> 
							<p align="center">THUMBNAIL <br>IMAGE UPLOAD</p>
						</div>
				
				<!-- 파일 업로드 하는 부분 -->
						<div id="fileArea0">
							<input type="file" id="thumbImg" name="thumbImage">
						</div>
						<div class="container">
							<div class="row no-gutters" id="thumbLayout">
			           	 	</div>
		           	 	</div>
						<script>
							// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
							$(function(){
								// 해당영역 숨김
								$("#fileArea0").hide();
								
								$("#contentImgArea0").click(function(){
									$("#thumbImg").click();
									$('#thumbLayout').empty();
								});
							
							});
							
							// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					        var sel_files = [];
					 
					        $(document).ready(function() {
					        	// 선택자의 값이 변경되면 handleImgsFilesSelect 함수가 실행
					            $('#thumbImg').on('change', handleImgsFilesSelect0);
					        }); 	
					 
					        function handleImgsFilesSelect0(e) {
					            var files = e.target.files; // file의 정보를 저장, files는 선택한 파일의 FileList 객체(배열형태)
					            var filesArr = Array.prototype.slice.call(files); // 해당 객체를 배열로 잘라서 저장
					 
					            filesArr.forEach(function(f) {
					                if(!f.type.match("image.*")) {
					                    alert("확장자는 이미지 확장자만 가능합니다.");
					                    return;
					                }
					 
					                sel_files.push(f); // 이미지 확장자 파일을 배열에 넣는다
					 
					                var reader = new FileReader(); 
					                reader.onload = function(e) { // reader의 읽기에 성공하면 함수 실행 onload는 파일 읽기에 성공하면 실행되는 이벤트 핸들러
					                	var divTag = $("<div></div>");
				                	  	divTag.attr("class", "col-md-6 col-lg-4");
				                	  	
				                	  	var imgTag = $("<img>");
				                	    imgTag.attr("class", "img-fluid image");
					                    imgTag.attr("src", e.target.result);
					                    imgTag.attr("style",'height: 100%');
					                    
					                    divTag.append(imgTag);
					                    
					                    $("#thumbLayout").append(divTag);
					                }
					                reader.readAsDataURL(f); // DataURL 형식으로 파일을 읽어온다
					            });
					        }
						</script>
						<div id="contentImgArea1">
						<br>
							<span id="contentImg1" class="material-symbols-outlined">add_a_photo</span> 
							<p align="center">GALLERY <br>IMAGE UPLOAD</p>
						</div>
						
						<!-- 파일 업로드 하는 부분 -->
						<div id="fileArea1">
							<input type="file" id="galleryImg" multiple name="galleryImage">
						</div>
						<div class="container">
							<div class="row no-gutters" id="galleryLayout">
			           	 	</div>
		           	 	</div>
						<script>
							// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
							$(function(){
								$("#fileArea1").hide();
								
								$("#contentImgArea1").click(function(){
									$("#galleryImg").click();
									$('#galleryLayout').children().remove();
								});
							
							});
							
							// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					        var sel_files = [];
					 
					        $(document).ready(function() {
					            $('#galleryImg').on('change', handleImgsFilesSelect1);
					        }); 
					 
					        function handleImgsFilesSelect1(e) {
					            var files = e.target.files;
					            var filesArr = Array.prototype.slice.call(files);
					 
					            filesArr.forEach(function(f) {
					                if(!f.type.match("image.*")) {
					                    alert("확장자는 이미지 확장자만 가능합니다.");
					                    return;
					                }
					 
					                sel_files.push(f);
					 
					                var reader = new FileReader();
					                reader.onload = function(e) {
					                	var divTag = $("<div></div>");
				                	  	divTag.attr("class", "col-md-6 col-lg-2");
				                	  	
				                	  	var imgTag = $("<img>");
				                	    imgTag.attr("class", "img-fluid image");
					                    imgTag.attr("src", e.target.result);
					                    imgTag.attr("style",'height: 100%');
					                    
					                    divTag.append(imgTag);
					                    
					                    $("#galleryLayout").append(divTag);
					                }
					                reader.readAsDataURL(f);
					            });
					        }
						</script>
						
						<div id="contentImgArea2">
						<br>
							<span  id="contentImg2" class="material-symbols-outlined">add_a_photo</span> 
							<p align="center">SLIDE <br>IMAGE UPLOAD</p>
						</div>
						
						<!-- 파일 업로드 하는 부분 -->
						<div id="fileArea2">
							<input type="file" id="slideImg" multiple name="slideImage">
						</div>
						<div class="container">
							<div class="row no-gutters" id="slideLayout">
			           	 	</div>
		           	 	</div>
						<script>
							// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
							$(function(){
								$("#fileArea2").hide();
								
								$("#contentImgArea2").click(function(){
									$("#slideImg").click();
							 		$('#slideLayout').children().remove();
								});
							
							});
							
							// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					        var sel_files = [];
					 
					        $(document).ready(function() {
					            $('#slideImg').on('change', handleImgsFilesSelect2);
					        }); 
					        function handleImgsFilesSelect2(e) {
					            var files = e.target.files;
					            var filesArr = Array.prototype.slice.call(files);
					 
					            filesArr.forEach(function(f) {
					                if(!f.type.match("image.*")) {
					                    alert("확장자는 이미지 확장자만 가능합니다.");
					                    return;
					                }
					 
					                sel_files.push(f);
					 
					                var reader = new FileReader();
					                reader.onload = function(e) {
					                	var divTag = $("<div></div>");
				                	  	divTag.attr("class", "col-md-6 col-lg-2");
				                	  	
				                	  	var imgTag = $("<img>");
				                	    imgTag.attr("class", "img-fluid image");
					                    imgTag.attr("src", e.target.result);
					                    imgTag.attr("style",'height: 100%');
					                    
					                    divTag.append(imgTag);
					                    
					                    $("#slideLayout").append(divTag);
					                }
					                reader.readAsDataURL(f);
					            });
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
					<div class="aroundSet">
						<fieldset class="around" name="around">
							<legend><h3>주변장소</h3></legend>
							<div class="form__group field">
								<input type="text" class="form__field lg" placeholder="주변장소명" name="aroundName1" id="aroundName1" required >
				  				<label for="aroundName1" class="form__label">주변장소명</label>
							</div>
							<div class="form__group field">
								<input type="text" class="form__field lg" placeholder="주변장소설명" name="aroundText1" id="aroundText1" required >
				  				<label for="aroundText1" class="form__label">주변장소설명</label>
							</div>
							<div class="form__group field">
								<input type="file" class="form__field lg" name="aroundImg1" required >
				  				<label class="form__label">주변장소사진</label>
							</div>
						</fieldset>
					</div>
					<div class ="col-12" align="center">
						<input type="button" class="btn btn-outline-primary aroundNum"  onclick="cloneAround()" value ="+">
						<input type="button" class="btn btn-outline-danger aroundNum"  onclick="removeAround()" value ="-">
					</div>
					<script>
						// 각각의 요소를 복제하면서 name 속성에 index값을 순차적으로 부여하기 위해 index 변수 생성
						var index = 1;
						function cloneAround(){
							//버튼 클릭시 index에 1씩 추가
							index += 1;
							// fieldset 요소를 복제
							var aroundSet = $('fieldset[name=around]').first().clone();
							// 각 input창의 name의 속성값에 인덱스를 추가하여 변경
							$(aroundSet).children().eq(0).text("주변장소"+index);
							$(aroundSet).children().eq(1).children().eq(0).val("");
							$(aroundSet).children().eq(1).children().eq(0).attr('name', 'aroundName'+index)
							$(aroundSet).children().eq(1).children().eq(0).attr('id', 'arounName'+index)
							$(aroundSet).children().eq(1).children().eq(1).attr('for', 'arounName'+index)
							$(aroundSet).children().eq(2).children().eq(0).val("")
							$(aroundSet).children().eq(2).children().eq(0).attr('name', 'aroundText'+index)
							$(aroundSet).children().eq(2).children().eq(0).attr('id', 'aroundText'+index)
							$(aroundSet).children().eq(2).children().eq(1).attr('for', 'aroundText'+index)
							$(aroundSet).children().eq(3).children().eq(0).val("") 
							$(aroundSet).children().eq(3).children().eq(0).attr('name', 'aroundImg'+index)
							$(aroundSet).children().eq(3).children().eq(0).attr('id', 'aroundImg'+index)
							$(aroundSet).children().eq(3).children().eq(1).attr('for', 'aroundImg'+index)
							// 복제한 요소를 마지막 뒤에 추가로 붙임
							$('fieldset:last').after(aroundSet);
							}
						
						function removeAround(){
							if($('fieldset[name=around]').length > 1){
								$('fieldset[name=around]').last().remove();
								index -= 1;
							} else{
								alert('더 이상 주변장소 작성란을 삭제할 수 없습니다.')
							}
						}
					</script>
   			</div>
   				<div id="btn" align="center">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" class="btn btn-dark" value="뒤로" onsubmit="dosubmit();">
					<input type="submit" class="btn btn-dark" value="등록">
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