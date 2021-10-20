package chapter17;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//서블릿 클래스를 구현하려면 HttpServlet클래스를 상속받아야 함
/*
 * <서블릿?>
 * JSP가 나오기 전의 표준. Java로 웹 어플리케이션 개발.
 * 서블릿 vs JSP => JSP가 더 간단함
 * MVC 패턴에서 서블릿 기반 코드로 개발하는 경우가 있음.
 * <개발 과정?>
 * 1) 서블릿 규약에 따라 자바 코드 작성
 * (1-2, 1-3은 이클립스에서 알아서 해줌)
 * 1-2) 자바 코드 컴파일(클래스 파일 생성)
 * 1-3) 클래스 파일을 /WEB-INF/classes 폴더에 저장
 * 2) web.xml에 서블릿 클래스를 설정
 * 3) Tomcat 실행
 * 4) 웹 브라우저에서 확인
 */
public class NowServlet extends HttpServlet{
	
	//doGet() : 서블릿이 GET방식의 요청을 처리
	//HttpServletRequest : JSP의 request 기본 객체
	//HttpServletResponse : JSP의 response 기본 객체
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//request : 웹 브라우저의 요청 정보를 읽어옴
		//response : 서버의 응답을 전송할 수 있음
		//응답을 전송하려면 응답의 컨텐츠 타입을 UTF-8로 지정해줘야 함
		response.setContentType("text/html;charset=UTF-8");
		//응답 결과를 웹 브라우저에 전송
		PrintWriter out = response.getWriter();
		//println()메서드에 전달한 데이터는 웹 브라우저에 전송되어 화면에 표시됨
		out.println("<html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("현재 시간은?");
		out.println(new Date());
		out.println("입니다.");
		out.println("</body></html>");
	}
}
