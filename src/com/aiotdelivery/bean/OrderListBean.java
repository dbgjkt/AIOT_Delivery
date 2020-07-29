package com.aiotdelivery.bean;

public class OrderListBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String orderId;
    private String customerId;
    private String carId;
    private String startAddr;
    private String destAddr;
    private String arriveTime;
    private String status;

    public String getOrderId() {
        return orderId;
    }
    public String getCustomerId() {
        return customerId;
    }
    public String getStartAddr() {
        return startAddr;
    }
    public String getCarId() {
        return carId;
    }
    public String getDestAddr() {
        return destAddr;
    }
    public String getArriveTime() {
        return arriveTime;
    }
    public String getStatus() {
        return status;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
    public void setStartAddr(String startAddr) {
        this.startAddr = startAddr;
    }
    public void setCarId(String carId) {
        this.carId = carId;
    }
    public void setDestAddr(String destAddr) {
        this.destAddr = destAddr;
    }
    public void setArriveTime(String arriveTime) {
        this.arriveTime = arriveTime;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
