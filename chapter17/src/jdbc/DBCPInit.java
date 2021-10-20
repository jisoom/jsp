package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

/* 예시)
 * connFactory : 삼성 공장
 * poolableConnFactory : 커넥션 객체를 찍어내는 디스플레이 부서
 * connectionPool : 커넥션 객체를 담아 두는 곳 (커넥션 객체를 쓰고서 반납함) 
 */

//서블릿 클래스
public class DBCPInit extends HttpServlet {
	@Override
	public void init() throws ServletException{
		loadJDBCDriver();
		initConnectionPool();
		
	}
	private void loadJDBCDriver() {
		
		//Connection Pool이 내부에서 사용할 JDBC Driver를 Loading 함
		//web.xml에서 지정해준 param-name
		String driverClass = getInitParameter("jdbcdriver"); 
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("JDBC Driver 로딩 실패", ex);
		}
	}
	
	private void initConnectionPool() {
		
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String userId = "jspexam";
			String pw = "java";
			
			//Connection Pool이 새로운 Connection을 생성 시 
			//사용할 Connection Factory를 생성
			//import org.apache.commons.dbcp2..
			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(jdbcUrl, userId, pw);
			
			//PoolableConnection을 생성하는 Factory를 생성.
			//Connection Pool에 Connection 객체를 보관 시
			//PoolableConnection을 사용함.
			PoolableConnectionFactory poolableConnFactory =
					new PoolableConnectionFactory(connFactory, null);
			
			//Connection이 사용 가능 한지 여부 검사 시 사용할 query를 지정함
			poolableConnFactory.setValidationQuery("select 1");
			
			//Connection Pool의 설정 정보 생성
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			//놀고 있는 connection 객체를 pool에서 비사용하는 시간 기준(1초/1000분)
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L*60L*5L); //1초->1분->5분
			//풀(작업장)에 보관중인 커넥션(직원)이 유효한지 검사할지 여부 => (일하고 있는지, 쉬고있는지, 아픈지, 바쁜지 등등 유효한지)
			poolConfig.setTestWhileIdle(true);
			//커넥션(직원) 최소 개수(인원수)
			poolConfig.setMinIdle(4);
			//커넥션(직원) 최대 개수(인원수)
			poolConfig.setMaxTotal(50);
			
			//커넥션 풀의 설정 정보 생성
			GenericObjectPool<PoolableConnection> connectionPool =
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			
			//PoolableConnectionFactory에도 생성된 커넥션 풀을 연결함
			poolableConnFactory.setPool(connectionPool); //(부서에 작업장 생성)
			
			//커넥션 풀을 제공하는 JDBC 드라이버 등록
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		
			//커넥션 풀 드라이버에 생성된 커넥션 풀을 등록
			driver.registerPool("chapter14", connectionPool);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		}catch (Exception e) {
			throw new RuntimeException(e);
			
		}
		
	}
}
