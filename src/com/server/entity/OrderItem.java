package com.server.entity;

import java.util.Date;

public class OrderItem {
    private Integer orderItemNo;

    private Integer orderItemStatus;

    private String title;

    private Integer price;

    private Integer bookId;

    private Integer count;

    private String sender;

    private String receiver;

    private String sendAddress;

    private String sendMobile;

    private String receiveAddress;

    private String receiveMobile;

    private Date createTime;

    private String username;

    public Integer getOrderItemNo() {
        return orderItemNo;
    }

    public void setOrderItemNo(Integer orderItemNo) {
        this.orderItemNo = orderItemNo;
    }

    public Integer getOrderItemStatus() {
        return orderItemStatus;
    }

    public void setOrderItemStatus(Integer orderItemStatus) {
        this.orderItemStatus = orderItemStatus;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getSendAddress() {
        return sendAddress;
    }

    public void setSendAddress(String sendAddress) {
        this.sendAddress = sendAddress == null ? null : sendAddress.trim();
    }

    public String getSendMobile() {
        return sendMobile;
    }

    public void setSendMobile(String sendMobile) {
        this.sendMobile = sendMobile == null ? null : sendMobile.trim();
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress == null ? null : receiveAddress.trim();
    }

    public String getReceiveMobile() {
        return receiveMobile;
    }

    public void setReceiveMobile(String receiveMobile) {
        this.receiveMobile = receiveMobile == null ? null : receiveMobile.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }
}