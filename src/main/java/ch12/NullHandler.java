package ch12;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		req.setAttribute("msg", "url이 없습니다.");
		return "/WEB-INF/view/null.jsp";
	}

}
