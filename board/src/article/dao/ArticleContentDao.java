package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import article.vo.ArticleContent;
import util.JdbcUtil;

public class ArticleContentDao {
	
	public ArticleContent insert(Connection conn, ArticleContent content) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(
					"insert into article_content"
					+"(article_no, content) "
					+"values(?, ?)"
					);
			pstmt.setInt(1, content.getArticleNo());
			pstmt.setString(2, content.getContent());
			int insertedCount = pstmt.executeUpdate(); //1건 입력
			if(insertedCount > 0) { //insert가 잘 되었다면..
				return content; //article_content 테이블에 insert된 정보를 return
			}else {
				return null;
			}
		}finally {
			JdbcUtil.close(pstmt);
		}
	}

}
