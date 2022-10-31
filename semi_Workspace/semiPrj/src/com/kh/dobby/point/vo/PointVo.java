package com.kh.dobby.point.vo;

public class PointVo {

    int currentpoint;
    int spendpoint;
    int getpoint;
    
    public int getCurrentpoint() {
        return currentpoint;
    }
    public void setCurrentpoint(int currentpoint) {
        this.currentpoint = currentpoint;
    }
    public int getSpendpoint() {
        return spendpoint;
    }
    public void setSpendpoint(int spendpoint) {
        this.spendpoint = spendpoint;
    }
    public int getGetpoint() {
        return getpoint;
    }
    public void setGetpoint(int getpoint) {
        this.getpoint = getpoint;
    }
    @Override
    public String toString() {
        return "PointVo [currentpoint=" + currentpoint + ", spendpoint=" + spendpoint + ", getpoint=" + getpoint + "]";
    }
    public PointVo(int currentpoint, int spendpoint, int getpoint) {
        super();
        this.currentpoint = currentpoint;
        this.spendpoint = spendpoint;
        this.getpoint = getpoint;
    }
    public PointVo() {
        super();
    }
    
    
}
