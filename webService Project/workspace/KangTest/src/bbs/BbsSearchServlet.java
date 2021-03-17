package bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BbsSearchServlet
 */
@WebServlet("/BbsSearchServlet")
public class BbsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String result = getJason();
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
	public String getJason(){
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BbsDAO bbsDAO = new BbsDAO();
		ArrayList<Bbs> bbslist = null;
		bbslist = bbsDAO.search();
		for( int i=0; i < bbslist.size(); i++)
		{
			result.append("[{\"value\":\"" + bbslist.get(i).getUserID()+ "\"},");
			result.append("{\"value\":\"" + bbslist.get(i).getBbsTitle()+ "\"},");
			result.append("{\"value\":\"" + bbslist.get(i).getBbsDate()+ "\"}] ");
			if(i != bbslist.size() - 1)
			{
				result.append(",");
			}
		}
		result.append("]}");
		return result.toString();
	}

}

