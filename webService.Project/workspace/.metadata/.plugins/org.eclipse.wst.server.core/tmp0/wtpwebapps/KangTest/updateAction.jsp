<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
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
		
		Boolean adminCheck = new UserDAO().getAdmin(userID);
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(userID.equals(bbs.getUserID()) || adminCheck.equals(true)) {
			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ||
					request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('fill the blank.')");
					script.println("history.back()");
					script.println("</script>");
				}
			else{
				BbsDAO BbsDAO = new BbsDAO();
				int result = BbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent") );	
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패 하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
						}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
					}
				}
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
				
		}
		
	%>
</body>
</html>