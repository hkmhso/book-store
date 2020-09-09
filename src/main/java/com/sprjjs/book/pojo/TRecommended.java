package com.sprjjs.book.pojo;

import java.io.Serializable;

public class TRecommended implements Serializable{
    private Integer rid;

    private String book;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book == null ? null : book.trim();
    }
}