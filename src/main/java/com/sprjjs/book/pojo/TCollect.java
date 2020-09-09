package com.sprjjs.book.pojo;

import java.io.Serializable;

public class TCollect implements Serializable{
    private Integer rid;

    private String uid;

    private String book;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book == null ? null : book.trim();
    }
}