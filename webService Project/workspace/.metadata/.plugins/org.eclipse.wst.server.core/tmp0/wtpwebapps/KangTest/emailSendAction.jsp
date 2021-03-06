<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="util.SHA256"%>
<%@page import="util.gmail"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donggeun's webService</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		String userID = null;
		String userPassword = null;
		String userEmail = null;
		String userGender = null;
		String userName = null;

		if(session.getAttribute("userID") != null) {
			userID=(String) session.getAttribute("userID");
		}
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('please login')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		boolean emailChecked = userDAO.getuserEmailChecked(userID);
		if(emailChecked ==true ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('already Authenticated')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		
		String host = "http://localhost:8080/KangTest/";
		String from = "kdk7854@gmail.com";
		String to = userDAO.getuserEmail(userID);
		String subject = "강의평가를 위한 이메일 확인 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
			"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
		
		
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		 
		try{
		    Authenticator auth = new gmail();
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg);
		} catch(Exception e){
		    e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다..');");
			script.println("history.back();");
			script.println("</script>");
			script.close();		
		    return;
		}


%>
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
	<nav class ="navbar navbar-default">
		<div class ="navbar-header">
			<button type = "button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="flase">
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
					<li class="active"><a href="login.jsp">로그인</a></li>
					<li> <a href=join.jsp>회원가입</a></li> 
			</ul>
			
		</div>
	</nav>
	<div class="container">
		<div class ="col-lg-4"></div>
		<div class ="col-lg-4"></div>
			<div class="jombotron" style="padding-top: 20px;">
				<div class="alert alert-success mt-4" role="alert">
					이메일 주소 인증 메일이 발송 되었습니다. 회원가입시 입력했던 이메일로 접속하여 인증  부탁드립니다.
				</div>
			
		<div class ="col-lg-4"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>