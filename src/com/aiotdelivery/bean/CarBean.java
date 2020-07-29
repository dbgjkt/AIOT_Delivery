package com.aiotdelivery.bean;

public class CarBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String carId;
    private String status;
    private String carLocation;

    public String getCarId() {
        return carId;
    }
    public String getStatus() {
        return status;
    }
    public String getCarLocation() {
        return carLocation;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public void setCarId(String carId) {
        this.carId = carId;
    }
    public void setCarLocation(String carLocation) {
        this.carLocation = carLocation;
    }
}
