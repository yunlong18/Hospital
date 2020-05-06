package cn.zhang.exception;

public class GlobalException extends Exception {

	private String message;
	public GlobalException(String message){
		super(message);
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
