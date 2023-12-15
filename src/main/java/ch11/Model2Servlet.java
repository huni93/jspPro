package ch11;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch08.KicMember;
import ch08.MemberDao;
import ch12.CommandHandler;


public class Model2Servlet implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDao md = new MemberDao();
		KicMember mem = null;
		try {
		mem = md.oneMember("222");
		System.out.println(mem);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.setAttribute("mem", mem);
		
		return "/chap11_servlet/memberinfo.jsp";
				
	}
}
