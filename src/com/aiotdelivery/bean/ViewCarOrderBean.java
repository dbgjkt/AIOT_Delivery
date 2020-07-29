package com.aiotdelivery.bean;

public class ViewCarOrderBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String car_id;
    private String order_id;
    private String arrive_time;

    public String getCar_id() {
        return car_id;
    }
    public String getOrder_id() {
        return order_id;
    }
    public String getArrive_time() {
        return arrive_time;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }
    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
    public void setArrive_time(String arrive_time) {
        this.arrive_time = arrive_time;
    }
}
