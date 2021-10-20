package chapter15.service;

import java.sql.Connection;
import java.sql.SQLException;

import chapter15.dao.MessageDao;
import chapter15.jdbc.ConnectionProvider;
import chapter15.jdbc.JdbcUtil;
import chapter15.vo.Message;

public class WriteMessageService {
	
	//싱글턴 패턴 구현(쓰리쿠션)
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {return instance;}
	private WriteMessageService() {}

	public void write(Message messageVO) {
		System.out.println("messageVO" + messageVO.toString());
		Connection conn = null;
		try {
			//커넥션 객체 생성
			conn = ConnectionProvider.getConnection();
			//MessageDao.insert() 메서드를 이용해서 메시지를 테이블에 insert
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, messageVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
