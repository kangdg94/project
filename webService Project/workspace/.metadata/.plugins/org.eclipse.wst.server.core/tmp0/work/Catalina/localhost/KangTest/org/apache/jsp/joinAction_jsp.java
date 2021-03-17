/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2021-03-08 08:29:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.UserDAO;
import user.User;
import util.SHA256;
import java.io.PrintWriter;

public final class joinAction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("util.SHA256");
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("user.User");
    _jspx_imports_classes.add("user.UserDAO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 request.setCharacterEncoding("UTF-8"); 
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Donggeun's webService</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t");

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
		

	
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
