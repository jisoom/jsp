package article.vo;

//작성자 정보를 담는 자바빈 클래스
public class Writer {
	
	private String wirterId;
	private String writerName;
	
	public Writer(String wirterId, String writerName) {
		super();
		this.wirterId = wirterId;
		this.writerName = writerName;
	}
	public String getWirterId() {
		return wirterId;
	}
	public void setWirterId(String wirterId) {
		this.wirterId = wirterId;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	
}
