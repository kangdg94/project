<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv= "Content- Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width = device-width initial-scale = 1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Donggeun's webService</title>
<style type="text/css">
	a, a:hover{
	color: #000000;
	text-decoration: none;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String search ="";
		String searchType="전체";
		String userID = null;
		int pageNumber = 1;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		if (request.getParameter("searchType") != null){
			searchType = request.getParameter("searchType");
		}
		if (request.getParameter("search") != null){
			search = request.getParameter("search");
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
				<li ><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
			<ul class=" nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="cartet"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li> <a href="join.jsp">회원가입 </a></li> 
			</ul>
			</li>
			</ul>
			
			<% 	
				}else{
			%>
			<ul class=" nav navbar-nav navbar-right">
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
	
	<section class="container" style="float:right">
		<form method="get" action="./bbs.jsp" class="form-inline mt-3">
			<select name="searchType" class="form-control mx-1 mt-2">
			<option value ="전체">전체</option>
			<option value ="내용만" <% if(searchType.equals("내용만")) out.println("selected"); %>>내용만</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="search text"></input>
			<button type="submit" class="form-control mx-1 mt-2">검색</button>
		</form>
	</section> 
	
		
			
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				
					<tr>
						<th style="background-color: #bbbbbb; text-align: center;">번호</th>
						<th style="background-color: #bbbbbb; text-align: center;">제목</th>
						<th style="background-color: #bbbbbb; text-align: center;">작성자</th>
						<th style="background-color: #bbbbbb; text-align: center;">작성일</th>
					</tr>
				
		<tbody>
		<%
			BbsDAO bbsDAO = new BbsDAO();
			ArrayList<Bbs> list = null;
			
			if(search == null || search.isEmpty())
			{
				list = bbsDAO.getList(pageNumber);
			}
			else
			{
				list = bbsDAO.getList(pageNumber, searchType, search);
			}
			
			for(int i =0 ;i <list.size(); i++)
			{
		%>
			<tr>
				<td><%= list.get(i).getBbsID() %></td>
				<td><a href = "view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td></a></td>
				<td><%= list.get(i).getUserID() %></td>
				<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
			</tr>
		<% 
				}
		%>
		</tbody>
		</table>
		<%
			if(pageNumber != 1){
		%>	
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
		<% 	
			}if (bbsDAO.nextPage(pageNumber + 1)){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
		<%	
			}
		%>
		<a href="write.jsp" class="btn btn-primary pull-right"> 글쓰기</a>
		</div>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>