package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import article.vo.Article;
import article.vo.Writer;
import util.JdbcUtil;

public class ArticleDao {

	//ARTICLE 테이블로 insert
	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//---article 테이블로 insert
			pstmt = conn.prepareStatement(
					"insert into article "
					+ "(ARTICLE_NO, WRITER_ID, WRITER_NAME, TITLE, REGDATE, MODDATE, READ_CNT) "
					+ "values((SELECT NVL(MAX(ARTICLE_NO),0) + 1 FROM ARTICLE),?,?,?,sysdate,sysdate,0)"
					);
			pstmt.setString(1, article.getWriter().getWirterId());
			pstmt.setString(2, article.getWriter().getWriterName());
			pstmt.setString(3, article.getTitle());
			//1건이 return 됨
			int insertedCount = pstmt.executeUpdate();
			
			//---article_content 테이블로 insert (article 테이블의 insert결과가 성공이어야 할 수 있음)
			//article 테이블에 데이터가 잘 들어가 있어야 함
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				//가장 마지막에 article 테이블에 들어간 article_no를 가져옴
				rs = stmt.executeQuery("SELECT MAX(ARTICLE_NO) FROM ARTICLE");
				if(rs.next()) { //최초에는 1을 바라봄
					int newNum = rs.getInt(1); //최초에는 1
					return new Article(newNum, article.getWriter(), article.getTitle(), 
							article.getRegdate(), article.getModdate(), 0);
				}
			}
			return null;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(stmt);
		}
		
	}

	//article 테이블의 목록 가져오기
	public List<Article> select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT ROW_NUMBER() OVER (ORDER BY ARTICLE_NO DESC) RNUM " + 
					"        ,article_no, writer_id, writer_name " + 
					"        ,title, regdate, moddate, read_cnt FROM ARTICLE");
			rs = pstmt.executeQuery();
			
			List<Article> result = new ArrayList<>();
			while(rs.next()) {
			result.add(new Article(rs.getInt("article_no"), 
					new Writer(rs.getString("writer_id"), rs.getString("writer_name")), 
					rs.getString("title"), rs.getDate("regdate"), rs.getDate("moddate"), rs.getInt("read_cnt")));
			}
			return result;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

}
