<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID=(String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('please login')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	if (request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	User user = new UserDAO().getUser(userID);
	UserDAO userDAO = new UserDAO();
	if(!request.getParameter("userPassword").equals(request.getParameter("userPasswordCheck"))){
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
	
	int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userPasswordCheck"), request.getParameter("userName"), request.getParameter("userGender"));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 실패 하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
					}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				}
	
		%>
</body>
</html>