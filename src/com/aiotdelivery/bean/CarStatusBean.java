package com.aiotdelivery.bean;

public class CarStatusBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String status;
    private String description;

    public String getStatus() {
        return status;
    }
    public String getDescription() {
        return description;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public void setDescription(String description) {
        this.description = description;
    }
}
