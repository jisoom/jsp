package chapter15.service;

public class MessageNotFoundException extends ServiceException {

	//생성자
	public MessageNotFoundException(String message) {
		super(message);
	}
}
