# FIND-COMFORT

국비 교육과정에서 수행한 세미 팀 프로젝트

사진 중심의 심플한 UI와 DB를 활용하여 다양한 숙소를 소개하며, 
숙소 주변의 맛집/관광지 등을 함께 공유하여 소비자에게 숙소선택에 많은 정보를 제공하는 사이트 입니다.
해당 사이트 디자인 및 자료는 [stayfolio.com](http://stayfolio.com) 을 참고 하여 제작하였습니다.


## 주요 기능
- 메인 페이지 구현
    - 대표숙소, 추천 주변장소 정보를 불러오고 클릭시 해당 게시글로 이동
    - 모든 내용을 슬라이드 방식으로 구현
    - SQL문을 활용하여 DB에 연결
    
- 회원 서비스 : 회원 가입 / 정보수정 / 탈퇴 / 비밀번호, 아이디 찾기 / 회원정보 수정 / 프로필 사진 변경 / 이메일 변경 / 비밀번호 변경 / 로그인 / 로그아웃 / 회원게시판 CRUD / 댓글 작성 / 숙소 게시판 보기
    - SQL문을 활용하여 DB에 연결
    - Session을 이용하여 회원 정보 유지
    - Ajax를 활용한 댓글 작성 구현
    - SHA-512 암호화 구현
    - 비밀번호 찾기 시 이메일로 임시번호 전송 구현
    - Ajax를 활용하여 아이디 중복 확인 / 비밀번호 찾기 / 변경 구현
    - Javascript, jQuery를 활용하여 아이디 / 비밀번호 유효성 검사
    - 회원게시판 페이징 처리 구현
    
- 관리자 : 로그인 /로그아웃 / 숙소소개 게시판 작성, 수정 / 공지사항 게시판 CRUD
    - SQL문을 활용하여 DB에 연결
    - 공지사항 검색 기능 구현
    - jQuery를 활용하여 숙소 게시판 목록의 숙소 번호 위치로 이동
    - 숙소게시판 작성, 수정 시 다중 파일 업로드 기능을 구현
    - 숙소게시판 작성, 수정 시 jQuery를 활용하여 이미지 업로드 시 미리보기 구현
    - 숙소게시판 수정 시 Ajax를 활용하여 수정할 주변장소 목록 정보 불러오기
    - NAVER MAP API를 활용하여 숙소 주소를 위도 경도로 변환하여 지도에 표시

## 사용 기술

- JSP / Servlet / JDBC / Java 8 / Tomcat 9.0 / Oracle 11g / SQL Developer
- HTML5 / CSS3 / jQuery / JS
- NAVER MAP API / Apache Commons FileUpload

## 담당 개발 내용

**숙소 게시판 리스트** 
- 숙소 게시판 화면을 디자인 및 게시판 리스트 기능 구현
- jQuery를 활용하여 숙소 게시판 목록의 숙소 번호 위치로 이동
    
**숙소 게시판 작성**
- Apache Common FileUpload 라이브러리를 활용하여 JSP/Servlet으로 다중 이미지 업로드 구현
- 사진 업로드 시 미리 보기 기능 구현
- 추가/ 삭제 버튼을 통해 주변장소 정보를 입력하는 요소를 생성/제거 하는 기능 구현

**숙소 게시판 상세 보기** 
- 상세보기 레이아웃 디자인 및 기능 구현
- DB에서 주소를 받아와 NAVER MAP API를 이용하여 위도와 경도로 변환하여 지도에 표시


**숙소 게시판 수정하기**
- 숙소 및 사진 데이터를  DB에서 불러와 화면에 출력하도록 구현
- 변경을 원하는 사진을 클릭하면 파일 업로드 창이 열리게 되고 파일을 업로드 시 해당 사진이 변경되도록 구현
- Ajax를 활용하여 주변 장소명을 선택 시 해당 정보를 받아와 출력하도록 구현
