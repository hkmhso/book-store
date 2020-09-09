package com.sprjjs.book.pojo;

import java.io.Serializable;

public class TBanner implements Serializable{
    private Integer rid;

    private String path;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }
}