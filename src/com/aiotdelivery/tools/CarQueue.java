package com.aiotdelivery.tools;

import java.util.LinkedList;

public class CarQueue {
    public LinkedList<Car> carQueue = new LinkedList<>();
    public LinkedList<Car> carFree = new LinkedList<>();
    public LinkedList<Car> carWork = new LinkedList<>();
    public LinkedList<Car> carRepaired = new LinkedList<>();

    public CarQueue(String[] carNames) {
        Car newCar;
        for (String carName : carNames) {
            newCar = new Car(carName);
            carQueue.add(newCar);
            carFree.add(newCar);
        }
    }

    public void show() {
        System.out.println("Car List:");
        for (Car car : carQueue) {
            car.infoShort();
        }
    }

    public void showFree() {
        System.out.println("Car Free:");
        for (Car car : carFree) {
            car.infoShort();
        }
    }

    public void showWork() {
        System.out.println("Car Work:");
        for (Car car : carWork) {
            car.infoShort();
        }
    }

    public void showRepaired() {
        for (Car car : carRepaired) {
            car.infoShort();
        }
    }

    // return a "waiting" car id.
    // if no car is "waiting", return -1.
    public int available() {
        if (carFree.size() == 0) return -1;
        return carFree.element().getId();
    }

    public boolean goWork(int id) {
        for (Car car : carQueue) {
            if (car.getId() == id) {
                if (car.getStatus() == 0) {
                    System.out.println("carid: " + car.getId() + " go work!!!");
                    car.setStatus(1);
                    carFree.remove(car);
                    carWork.add(car);
                    return true;
                }
                System.out.println("carid: " + car.getId() + " is busy!!!");
                return false;
            }
        }
        return false;
    }

    public boolean goWork() {
        if (available() == -1) return false;
        return goWork(available());
    }

    public void goBack(int id) {
        for (Car car : carQueue) {
            if (car.getId() == id) {
                switch (car.getStatus()) {
                    case 0:
                        return;

                    case 1:
                        System.out.println("carid: " + car.getId() + " go back!!!");
                        car.setStatus(0);
                        carWork.remove(car);
                        carFree.add(car);
                        return;
                    case -1:
                        System.out.println("carid: " + car.getId() + " go back!!!");
                        car.setStatus(0);
                        carRepaired.remove(car);
                        carFree.add(car);
                        return;
                }
            }
        }
    }
}
