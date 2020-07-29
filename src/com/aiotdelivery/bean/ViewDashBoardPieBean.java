package com.aiotdelivery.bean;

public class ViewDashBoardPieBean implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private String pieFinished;
    private String pieWorking;
    private String pieWaiting;

    public String getPieFinished() {
        return pieFinished;
    }
    public String getPieWorking() {
        return pieWorking;
    }
    public String getPieWaiting() {
        return pieWaiting;
    }

    public void setPieFinished(String pieFinished) {
        this.pieFinished = pieFinished;
    }
    public void setPieWorking(String pieWorking) {
        this.pieWorking = pieWorking;
    }
    public void setPieWaiting(String pieWaiting) {
        this.pieWaiting = pieWaiting;
    }
}
