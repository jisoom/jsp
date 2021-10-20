package chap08.member;

import java.util.Date;
/**
 * @author PC-02
 * 자바빈 : 속성(데이터), 변경 이벤트, 객체 직렬화를 위한 표준
 * JSP에서는 속성을 표현하기 위한 용도로 사용
 * 자바빈 규약을 따르는 클래스를 자바빈이라고 부름.
 */
public class MemberInfo {
	//1) 데이터를 저장하는 필드
	private String id;
	private String password;
	private String name;
	private String address;
	private Date registerDate;
	private String email;
	
	//2) 데이터를 읽어올 때 사용되는 getter 메서드
	public String getId() {
		return id;
	}
	//3) 값을 저장할 때 사용되는 setter 메서드
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
