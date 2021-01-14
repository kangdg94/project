<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv= "Content- Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width = device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Donggeun's webService</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class ="navbar navbar-default">
		<div class ="navbar-header">
			<button type = "button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="flase">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Donggeun's webService</a>
		</div>	
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
			<ul class="navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="cartet"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li> 
			</ul>
			</li>
			</ul>
			
			<% 	
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="cartet"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			</li>
			</ul>
			<%
				}
			%>
			
			
		</div>
	</nav>
<img src="images/2.jpg" align="left">
<table border ="1">

<tr>
<td>Name</td> <td>강동근 </td>
</tr>

<tr>
<td>Age</td> <td>26</td>
</tr>

<tr>
<td>Position</td> <td>관리자 </td>
</tr>

<tr>
<td>Sex </td> <td>남자 </td>
</tr>

<tr>
<td>Major</td> <td>컴퓨터 공학과 </td>
</tr>

<tr>
<td>purpose of site</td> <td>게시판 구축 및 해킹 보안  </td>
</tr>

</table>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>