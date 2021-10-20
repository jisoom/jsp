package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet extends HttpServlet {
	
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
