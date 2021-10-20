package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.vo.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
	private LoginService loginService = new LoginService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return FORM_VIEW;
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			String memberid= req.getParameter("memberid");
			String password = req.getParameter("password");

			System.out.println("memberid : " +memberid);
			System.out.println("password : " +password);
			
			//java와 JSP 간에 errors 맵을 공유
			Map<String, Boolean> errors = new HashMap<>();
			req.setAttribute("errors", errors);
			
			//아이디 값이 비어있다면..
			if(memberid==null || memberid.isEmpty()) {
				errors.put("memberid", Boolean.TRUE);
			}
			//비밀번호 값이 비어있다면..
			if(password==null || password.isEmpty()) {
				errors.put("password", Boolean.TRUE);
			}
			//errors.isEmpty() : 오류가 없다면
			if(!errors.isEmpty()) { //오류가 있다면
				return FORM_VIEW;
			}
		
			try {
				//비밀번호가 일치하는  회원이 있다면..
				User user = loginService.login(memberid, password);
				//req.getSession() : 세션을 가져옴. 로그인 처리함
				req.getSession().setAttribute("authUser", user);
				System.out.println(req.getContextPath());
				res.sendRedirect(req.getContextPath() + "/index.jsp");

				return null;
			}catch (LoginFailException e) { //loginService.login() => 아이디/비번 문제 발생시
				errors.put("idOrPwNotMatch", Boolean.TRUE);
				return FORM_VIEW;
			}
			
		}else {
			return null;
		}
	}
	
}
