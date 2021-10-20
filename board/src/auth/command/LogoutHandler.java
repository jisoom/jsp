package auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.command.CommandHandler;

public class LogoutHandler implements CommandHandler {

	//로그아웃 구현	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//세션이 시작됨
		HttpSession session = req.getSession();
		System.out.println("authUser : " + session.getAttribute("authUser"));
		//세션이 있다면.. 로그아웃
		if(session != null) {
			session.invalidate();
		}
		res.sendRedirect(req.getContextPath() + "/index.jsp");
		return null;
	}

}
