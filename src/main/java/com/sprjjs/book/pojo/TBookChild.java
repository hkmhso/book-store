package com.sprjjs.book.pojo;

import java.io.Serializable;
import java.util.Date;

public class TBookChild extends TBook implements Serializable{
	//???????
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public TBookChild(String isbn, String title, String author, Double price, String press, Integer edition,
			Date published, Integer pages, Integer words, String packaging, String format, String form, Integer status,
			int count) {
		super(isbn, title, author, price, press, edition, published, pages, words, packaging, format, form, status);
		this.count = count;
	}

	public TBookChild(String isbn, String title, String author, Double price, String press, Integer edition,
			Date published, Integer pages, Integer words, String packaging, String format, String form,
			Integer status) {
		super(isbn, title, author, price, press, edition, published, pages, words, packaging, format, form, status);
	}

	
	
	
	
}
