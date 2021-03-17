<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>   
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
    
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
		
		int pageNumber =1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
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
			</li>
			</ul>
			
		</div>
	</nav>
	
	
	<div class="btn-group-vertical" role="group" aria-label="..." style ="width: 10%; padding-top: 90px;">
				<button type="button" onclick="location.href='mypage.jsp'" class="btn btn-default">개인정보 수정</button>
  				<button type="button" onclick="location.href='myHistory.jsp'" class="btn btn-default">게시판 게시 내역</button>
	</div>
	<div class="container"  style ="width: 90%; float: right; padding-top: 60px;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				
					<tr>
						<th style="background-color: #bbbbbb; text-align: center;">번호</th>
						<th style="background-color: #bbbbbb; text-align: center;">제목</th>
						<th style="background-color: #bbbbbb; text-align: center;">작성자</th>
						<th style="background-color: #bbbbbb; text-align: center;">작성일</th>
						<th style="background-color: #bbbbbb; text-align: center; width: 70px;">조회수</th>
					</tr>
					<tbody>
					
					<% 
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.myhistory(pageNumber, userID);
					
					for(int i =0 ;i <list.size(); i++)
					{
				%>
				
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href = "view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
						<td><%= list.get(i).getBbsHit() %></td>
					</tr> 
				<% 
						}
				%>
					</tbody>
					</table>
						<%
								if(pageNumber != 1){
							%>	
								<a href="myHistory.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
							<% 	
								}if (bbsDAO.nextPage(pageNumber + 1)){
							%>
								<a href="myHistory.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
							<%	
								}
							%>
							</div>
							</div>
							
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>