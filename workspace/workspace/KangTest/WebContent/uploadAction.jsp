<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Donggeun's webService</title>
</head>
<body>
<% 
	String directory = application.getRealPath("/upload");
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";
	MultipartRequest multipartRequest= 
			new MultipartRequest(request, directory, maxSize, encoding,
					new DefaultFileRenamePolicy());
	
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");

	if(!fileName.endsWith(".doc") && !fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") &&! fileName.endsWith(".xls")&& !fileName.endsWith(".jpg")){
		File file = new File(directory + fileRealName);
		file.delete();
		out.write("업로드 할 수 없는 확장자 입니다");  //web shell attack 방
	}else{
		new FileDAO().upload(fileName, fileRealName);
		out.write("FileName: " + fileName + "<br>");
		out.write("FileRealName: " + fileRealName + "<br>");	
	}
%>

</body>
</html>