package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.vo.Member;
import util.JdbcUtil;

public class ChangePasswordService {
	
	private MemberDao memberDao = new MemberDao();
	
	//String userId(누구의), String curPwd(원래), String newPwd(바꿀)
	public void changePassword(String userId, String curPwd, String newPwd) {
		//service에서 connection 객체를 생성함
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, userId);
			
			//select * from member where memberid=${userId} 결과가 없을 때..
			if(member == null) {
				throw new MemberNotFoundException();
			}
			//비밀번호가 일치하지 않을 때 오류 발생
			if(!member.matchPassword(curPwd)) { 
				throw new InvalidPasswordException();
			}
			
			//member VO의 비밀번호를 신규 비밀번호로 세팅함
			member.changePassword(newPwd);
			
			//비밀번호 업데이트 처리
			memberDao.update(conn, member);
			
			conn.commit();
		}catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
