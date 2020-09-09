package com.sprjjs.book.pojo;

import java.io.Serializable;
import java.util.Date;

public class TBook implements Serializable{
    private String isbn;

    private String title;

    private String author;

    private Double price;

    private String press;

    private Integer edition;

    private Date published;

    private Integer pages;

    private Integer words;

    private String packaging;

    private String format;

    private String form;

    private Integer status;

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public Integer getEdition() {
        return edition;
    }

    public void setEdition(Integer edition) {
        this.edition = edition;
    }

    public Date getPublished() {
        return published;
    }

    public void setPublished(Date published) {
        this.published = published;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public Integer getWords() {
        return words;
    }

    public void setWords(Integer words) {
        this.words = words;
    }

    public String getPackaging() {
        return packaging;
    }

    public void setPackaging(String packaging) {
        this.packaging = packaging == null ? null : packaging.trim();
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format == null ? null : format.trim();
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form == null ? null : form.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	public TBook(String isbn, String title, String author, Double price, String press, Integer edition, Date published,
			Integer pages, Integer words, String packaging, String format, String form, Integer status) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.price = price;
		this.press = press;
		this.edition = edition;
		this.published = published;
		this.pages = pages;
		this.words = words;
		this.packaging = packaging;
		this.format = format;
		this.form = form;
		this.status = status;
	}

	public TBook() {
		super();
	}
   
	
    
}