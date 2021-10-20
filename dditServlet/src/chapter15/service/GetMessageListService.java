package chapter15.service;

import java.sql.Connection;
import java.util.Collections;
import java.util.List;

import chapter15.dao.MessageDao;
import chapter15.jdbc.ConnectionProvider;
import chapter15.jdbc.JdbcUtil;
import chapter15.vo.Message;

public class GetMessageListService {
	//싱글톤 패턴
	private static GetMessageListService instance = 
			new GetMessageListService();
	private GetMessageListService() {}
	public static GetMessageListService getInstance() {
		return instance;
	}
	
	//1페이지 당 화면에 표시할 행의 개수를 상수로 하여 메모리에 로딩함
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	
	//방명록 목록 리턴, 현재 페이지번호(pageNumber)를 파라미터로 받음
	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber; //현재 페이지 번호
		try {
			conn = ConnectionProvider.getConnection();
			List<Message> messageList = null;
			
			//select를 실행하기 위해 Dao 객체 생성(싱글톤 패턴)
			MessageDao messageDao = MessageDao.getInstance();
			
			//select 한 전체 행의 수(카디널리티)를 구함
			int messageTotalCount = messageDao.selectCount(conn);
			//페이징의 시작 페이지 번호
			int firstRow = 0;
			//페이징의 종료 페이지 번호
			int endRow = 0;
			
			//select 실행 결과가 있을 때에만 실행
			if(messageTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList = messageDao.selectList(conn, firstRow, endRow);
			}else { //select 실행 결과가 없으면
				//현재 페이지 번호를 0으로 만듦
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			
			//return messageList;
			//int messageTotalCount, int currentPageNumber, List<Message> messageList,
			//int messageCountPerPage, int firstRow, int endRow
			
			return new MessageListView(messageTotalCount, currentPageNumber, 
					messageList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
