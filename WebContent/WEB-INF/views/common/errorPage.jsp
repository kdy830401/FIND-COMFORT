<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%String msg = (String)request.getAttribute("msg") ;
  %>
<!DOCTYPE html>
<html>
<head>
 
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>ERROR</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath()%>/css/error/style.css" />
<style>
a{
	margin-top: 20px;
	font-size: 20px;
	font-weight: 800;
}
</style>


</head>



<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404"></div>
			<h1>Sorry</h1>
			<h2><%= msg %></h2>
			<a href="<%= request.getContextPath() %>">Back to homepage</a>
		</div>
	</div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>