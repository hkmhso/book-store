package com.sprjjs.book.pojo;

import java.io.Serializable;
import java.util.Date;

public class TOrder implements Serializable{
    private Integer rid;

    private String uid;

    private String oid;

    private String sta;

    private Integer aid;

    private Double payment;

    private Date placed;

    private Date receipt;

    private Date deliver;

    private Date handover;

    private String bankid;

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

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public String getSta() {
        return sta;
    }

    public void setSta(String sta) {
        this.sta = sta == null ? null : sta.trim();
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public Date getPlaced() {
        return placed;
    }

    public void setPlaced(Date placed) {
        this.placed = placed;
    }

    public Date getReceipt() {
        return receipt;
    }

    public void setReceipt(Date receipt) {
        this.receipt = receipt;
    }

    public Date getDeliver() {
        return deliver;
    }

    public void setDeliver(Date deliver) {
        this.deliver = deliver;
    }

    public Date getHandover() {
        return handover;
    }

    public void setHandover(Date handover) {
        this.handover = handover;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid == null ? null : bankid.trim();
    }

	@Override
	public String toString() {
		return "TOrder [rid=" + rid + ", uid=" + uid + ", oid=" + oid + ", sta=" + sta + ", aid=" + aid + ", payment="
				+ payment + ", placed=" + placed + ", receipt=" + receipt + ", deliver=" + deliver + ", handover="
				+ handover + ", bankid=" + bankid + "]";
	}
    
}