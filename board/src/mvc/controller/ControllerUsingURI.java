package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;
import oracle.net.aso.e;

public class ControllerUsingURI extends HttpServlet{
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException {
		
		//web.xml에서 init-param로 name은 configFile value는 /WEB-INF/commandHandlerURI.properties로 지정해둠
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		//D:\A_TeachingMaterial\6.JspSpring\workspace\board\src\mvc\controller\ControllerUsingURI.java
		String configFilePath = getServletContext().getRealPath(configFile);
		
		try {
			//commandHandlerURI.properties를 읽음
			///hello.do=mvc.hello.HelloHandler가 가져와짐
			FileReader fis = new FileReader(configFilePath);
			prop.load(fis);
			
		}catch (IOException e) {
			throw new ServletException(e);
		}
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			///hello.do
			String command = (String)keyIter.next();
			//mvc.hello.HelloHandler
			String handlerClassName = prop.getProperty(command);
			
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = 
						(CommandHandler)handlerClass.newInstance();
				///hello.do, mvc.hello.HelloHandler
				commandHandlerMap.put(command, handlerInstance);
			}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	} //init()
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8090/hello.do
		String command = request.getRequestURI();
		if(command.indexOf(request.getContextPath()) == 0) {
			//request.getContextPath() : //http://localhost:8090
			//command : /hello.do
			command= command.substring(request.getContextPath().length());
		}
		//commandHandlerMap => /hello.do, mvc.hello.HelloHandler
		//handler => mvc.hello.HelloHandler 객체(인스턴스)
		CommandHandler handler = commandHandlerMap.get(command);
		
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			//handler.process 한 결과 리턴 되는 것 => viewPage
			viewPage = handler.process(request, response); //CommandHanler를 implements한 핸들러는 process 메서드가 있음
		}catch (Throwable e) {
			throw new ServletException(e);
		}
		if(viewPage!=null) { //viewPage가 있으면 그 viewPage로 화면 넘겨줌
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
