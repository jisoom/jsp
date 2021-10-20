package chapter15.service;

import java.sql.Connection;
import java.sql.SQLException;

import chapter15.dao.MessageDao;
import chapter15.jdbc.ConnectionProvider;
import chapter15.jdbc.JdbcUtil;
import chapter15.vo.Message;

public class DeleteMessageService {

	//싱글톤 패턴
	private static DeleteMessageService instance = new DeleteMessageService();
	private DeleteMessageService(){}
	public static DeleteMessageService getInstance() { return instance;}
	
	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao messageDao = MessageDao.getInstance();
			
			//해당 메시지가 존재하는가?
			Message message = messageDao.select(conn, messageId);
			if(message == null) {
				throw new MessageNotFoundException("메시지 없음");
			}
			
			//비밀번호가 일치하는가? 같으면 true, 다르면 false
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 다릅니다.");
			};
			
			//해당 데이터 삭제
			messageDao.delete(conn, messageId);
			
			//트랜잭션 종료(T1이 종료 -> T2가 시작)
			conn.commit();
			
		}catch (SQLException e) {
			//catch 블록에서 문제 발생 시 rollback 처리
			//트랜잭션 ? 데이터 베이스 변경을 하기 위해 수행되어야 할 논리적 단위
			//원자성(all or nothing), 일관성(한방향으로 흘러감), 고립성(화장실 : 화장실에 누가 들어가 있는데 다른사람이 또 들어갈 수 없음), 지속성(TCL후 지속됨)
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}catch (MessageNotFoundException | InvalidPasswordException ex) {
			JdbcUtil.rollback(conn);
			throw ex; //jsp로 던져져서 jsp파일에서 오류를 읽을 수 있음
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
