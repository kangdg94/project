<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>   
<%@ page import="user.User" %>
    
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv= "Content- Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width = device-width" initial-scale="1">
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
		
		User userinfo = new UserDAO().getUser(userID);
		%>
	<nav class ="navbar navbar-default">
		<div class ="navbar-header">
			<button type = "button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="flase">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Donggeun's webService</a>
		</div>	
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="cartet"></span></a>
					<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
					<li><a href="mypage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</nav>
	
	
	<div class="btn-group-vertical" role="group" aria-label="..." style ="width: 10%; padding-top: 90px;">
				<button type="button" onclick="location.href='mypage.jsp'" class="btn btn-default">개인정보 수정</button>
  				<button type="button" onclick="location.href='myHistory.jsp'" class="btn btn-default">게시판 게시 내역</button>
	</div>
	<div class="container" style ="width: 90%; float: right;">
		<div class ="col-lg-4"></div>
		<div class ="col-lg-4"></div>
			<div class="jombotron" style="padding-top: 20px;">
			
			<form method="post" action="mypageAction.jsp">
				<h3 style="text-align: center;">개인정보 수정</h3>
				<div class ="form-group">
					<label for="userID">아이디 </label>
					<input type="text" class="form-control" placeholder="변경하실 아이디를 입력해주세요 " name="userID" maxlength="20" value ="<%= userinfo.getUserID() %>" > 
				</div>
				<div class ="form-group">
					<label for="userPassword">비밀번호 </label>
					<input type="password" class="form-control" placeholder="변경하실 비밀번호를 입력해주세요 " name="userPassword" maxlength="20" > 
				</div>
				<div class ="form-group">
					<label for="userPasswordCheck">비밀번호 확인 </label>
					<input type="password" class="form-control" placeholder="변경하실 비밀번호를 확인해주세요" name="userPasswordCheck" maxlength="20"  > 
				</div>
				<div class ="form-group">
					<label for="userName">이름 </label>
					<input type="text" class="form-control" placeholder="변경하실 이름을 입력해주세요" name="userName" maxlength="20" value ="<%= userinfo.getUserName() %>" > 
				</div>
				<div class ="form-group" style="text-align: center;">
						<label class="radio-inline active">
								  <input type="radio" name="userGender" value="남자" checked> 남자 
								</label>
								<label class="radio-inline">
								  <input type="radio" name="userGender" value="여자"> 여자
								</label>
					</div> 
				</div>		
				<div class ="form-group" >
					<label for="userEmail">이메일 </label>
						<input type="email" class="form-control" placeholder="변경하실 이메일을 입력해주세요  " name="userEmail" maxlength="20" value ="<%= userinfo.getUserEmail() %>" >
					</div>	
					</div>
				<input type ="submit" class="btn btn-primary form-control" value="수정">
			</form>
		<div class ="col-lg-4"></div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>