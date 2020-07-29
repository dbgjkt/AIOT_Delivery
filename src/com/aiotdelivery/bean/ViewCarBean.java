package com.aiotdelivery.bean;

public class ViewCarBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String carId;
    private String orderId;
    private String description;
    private String location;

    public String getCarId() {
        return carId;
    }
    public String getOrderId() {
        return orderId;
    }
    public String getDescription() {
        return description;
    }
    public String getLocation() {
        return location;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public void setLocation(String location) {
        this.location = location;
    }
}
