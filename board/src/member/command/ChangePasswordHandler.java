package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.vo.User;
import member.service.ChangePasswordService;
import member.service.InvalidPasswordException;
import member.service.MemberNotFoundException;
import mvc.command.CommandHandler;

public class ChangePasswordHandler implements CommandHandler{

	private static final String FORM_VIEW = "/WEB-INF/view/changePwdForm.jsp";
	private ChangePasswordService changePwdSvc= new ChangePasswordService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return FORM_VIEW;
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		}else {
			res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		//req.getSession() : 세션 시작
		User user = (User)req.getSession().getAttribute("authUser");
		
		String curPwd = req.getParameter("curPwd"); //원래 비번
		String newPwd = req.getParameter("newPwd"); //바꿀 비번
		
		System.out.println("curPwd : " + curPwd);
		System.out.println("newPwd : " + newPwd);
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		//현재 비밀번호 값이 없으면..
		if(curPwd==null || curPwd.isEmpty()) {
			errors.put("curPwd", Boolean.TRUE);
		}
		//신규 비밀번호 값이 없으면..
		if(newPwd==null || newPwd.isEmpty()) {
			errors.put("newPwd", Boolean.TRUE);
		}
		//오류가 발생되었다면 changePwdForm.jsp로 이동
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			//오류가 없다면.. 서비스에서 비밀번호 변경 기능 수행
			//String userId(누구의), String curPwd(원래), String newPwd(바꿀)
			changePwdSvc.changePassword(user.getMemberid(), curPwd, newPwd);
			
			return "/WEB-INF/view/changePwdSuccess.jsp";
		}catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

}
