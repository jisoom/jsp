package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.vo.Member;
import util.JdbcUtil;

public class MemberDao {
	//회원 등록
	public void insert(Connection conn, Member mem) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into member(memberid, name, password, regdate) values(?, ?, ?, sysdate)"
					);
			pstmt.setString(1, mem.getMemberid());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			//pstmt.setDate(4, new Date(mem.getRegDate().getDate())); => sysdate
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//회원 아이디를 받아서 해당 아이디의 정보를 가져옴
	public Member selectById(Connection conn, String memberid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//memberid가 없으면 member는 null 리턴 => 신규 회원
		try {
			pstmt = conn.prepareStatement(
					"select * from member where memberid = ?"
					);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			
			Member member = null;
			
			if(rs.next()) {
				//member vo 객체 생성할 때 파라미터로 다 세팅해줘야함
				member = new Member(
						rs.getString("memberid"),
						rs.getString("name"),
						rs.getString("password"),
						rs.getDate("regdate")
						);
			}
			return member;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	//회원의 비밀번호를 변경함
	public void update(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(
					"update member set name = ?, password = ? where memberid = ?"
					);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberid());
			
			pstmt.executeUpdate();
			
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
}
