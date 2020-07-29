package com.aiotdelivery.tools;

public class Car {
    // 一輛車，有 編號、名字、狀態(可否出勤)
    private int id;
    private String name;
    private int status;

    // 計數器，記錄總共有多少台車，以此分配id
    public static int counts = 1;
    public static String[] description = {"待命中", "出勤中", "回程中", "狀況排除中"};

    // getters
    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public int getStatus() {
        return status;
    }

    // setters
    public void setId(int carId) {
        this.id = carId;
    }
    public void setName(String carName) {
        this.name = carName;
    }
    public void setStatus(int status) {
        this.status = status;
    }

    // constructor
    public Car(String name) {
        this.name = name;
        this.id = counts;
        counts++;
        this.status = 0; // 起始狀態：待命中
    }

    public void info() {
        System.out.println("===car info===");
        System.out.println("  name: " + this.name);
        System.out.println("  id: " + this.id);
        System.out.println("  status:" + description[this.status]);
        System.out.println("=== car info end ===");
    }

    public void infoShort() {
        System.out.println(this.id + "|" + this.name + "|" + description[this.status]);
    }

}
