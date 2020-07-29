package com.aiotdelivery.bean;

public class ViewOrderListBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String orderId;
    private String customerName;
    private String carId;
    private String destAddr;
    private String arriveTime;
    private String description;

    public String getOrderId() {
        return orderId;
    }
    public String getCustomerName() {
        return customerName;
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
    public String getDescription() {
        return description;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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
    public void setDescription(String description) {
        this.description = description;
    }
}
