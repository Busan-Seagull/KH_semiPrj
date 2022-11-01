package com.kh.dobby.point.vo;

public class PointVo {

    int currentpoint;
    int spendpoint;
    int getpoint;
    String currentpointcontent;
    String getpointcontent;
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
    public String getCurrentpointcontent() {
        return currentpointcontent;
    }
    public void setCurrentpointcontent(String currentpointcontent) {
        this.currentpointcontent = currentpointcontent;
    }
    public String getGetpointcontent() {
        return getpointcontent;
    }
    public void setGetpointcontent(String getpointcontent) {
        this.getpointcontent = getpointcontent;
    }
    @Override
    public String toString() {
        return "PointVo [currentpoint=" + currentpoint + ", spendpoint=" + spendpoint + ", getpoint=" + getpoint
                + ", currentpointcontent=" + currentpointcontent + ", getpointcontent=" + getpointcontent + "]";
    }
    public PointVo(int currentpoint, int spendpoint, int getpoint, String currentpointcontent, String getpointcontent) {
        super();
        this.currentpoint = currentpoint;
        this.spendpoint = spendpoint;
        this.getpoint = getpoint;
        this.currentpointcontent = currentpointcontent;
        this.getpointcontent = getpointcontent;
    }
    public PointVo() {
        super();
    }
    
    
}
