package com.aiotdelivery.bean;

public class CustomerBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private String payment;

    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getPassword() {
        return password;
    }
    public String getPhone() {
        return phone;
    }
    public String getEmail() {
        return email;
    }
    public String getPayment() {
        return payment;
    }

    public void setId(String id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPayment(String payment) {
        this.payment = payment;
    }
}
