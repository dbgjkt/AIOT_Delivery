package com.aiotdelivery.bean;

public class ViewDashBoardCountBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String carGoing;
    private String delivering;
    private String waiting;
    private String carStaying;

    public String getCarGoing() {
        return carGoing;
    }
    public String getDelivering() {
        return delivering;
    }
    public String getWaiting() {
        return waiting;
    }
    public String getCarStaying() {
        return carStaying;
    }

    public void setCarGoing(String carGoing) {
        this.carGoing = carGoing;
    }
    public void setDelivering(String delivering) {
        this.delivering = delivering;
    }
    public void setWaiting(String waiting) {
        this.waiting = waiting;
    }
    public void setCarStaying(String carStaying) {
        this.carStaying = carStaying;
    }
}
