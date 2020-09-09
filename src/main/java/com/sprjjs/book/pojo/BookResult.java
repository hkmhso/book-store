package com.sprjjs.book.pojo;

import java.io.Serializable;

public class BookResult<T> implements Serializable{

	private static final long serialVersionUID = 1L;
	private int status;
	private T data;
	private Object msg;
	
	public Object getMsg() {
		return msg;
	}
	public void setMsg(Object msg) {
		this.msg = msg;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public BookResult(int status, T data, Object msg) {
		super();
		this.status = status;
		this.data = data;
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "EgoResult [status=" + status + ", data=" + data + ", msg=" + msg + "]";
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public BookResult() {
		super();
	}


}
