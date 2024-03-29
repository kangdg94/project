<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donggeun's webService</title>
</head>
<body>
	<%
		String userID = null;
		String userPassword = null;
		String userPasswordCheck = null;
		String userEmail = null;
		String userGender = null;
		String userName = null;

		if(session.getAttribute("userID") != null) {
			userID=(String) session.getAttribute("userID");
		}
		
		if (userID != null) {
			PrintWriter script = response.getWriter();
			System.out.println("123");
			script.println("<script>");
			script.println("alert('already login')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if(request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
		}
		if(request.getParameter("userPassword") != null) {
			userPassword = (String) request.getParameter("userPassword");
		}
		if(request.getParameter("userPasswordCheck") != null) {
			userPasswordCheck = (String) request.getParameter("userPasswordCheck");
		}
		if(request.getParameter("userEmail") != null) {
			userEmail = (String) request.getParameter("userEmail");
		}
		if(request.getParameter("userGender") != null) {
			userGender = (String) request.getParameter("userGender");
		}
		if(request.getParameter("userName") != null) {
			userName = (String) request.getParameter("userName");
		}
		

		
		if (userID == null || userPassword == null|| userGender == null||
			userName == null || userEmail == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('fill the blank.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(new User(userID, userPassword, userName, userGender,userEmail, SHA256.getSHA256(userEmail), false, false, userPasswordCheck));	
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ID exist.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(!userPassword.equals(userPasswordCheck)){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 다릅니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			else{
				session.setAttribute("userID",userID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'emailSendAction.jsp'");
				script.println("</script>");
				script.close();
			}
		}
		

	%>
</body>
</html>