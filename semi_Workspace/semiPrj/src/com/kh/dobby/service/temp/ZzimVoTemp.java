package com.kh.dobby.service.temp;

public class ZzimVoTemp {
    private String serviceNo;
    private String userNo;
    
    public ZzimVoTemp() {
        super();
    }
    public ZzimVoTemp(String serviceNo, String userNo) {
        super();
        this.serviceNo = serviceNo;
        this.userNo = userNo;
    }
    public String getServiceNo() {
        return serviceNo;
    }
    public void setServiceNo(String serviceNo) {
        this.serviceNo = serviceNo;
    }
    public String getUserNo() {
        return userNo;
    }
    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }
    @Override
    public String toString() {
        return "ZzimVoTemp [serviceNo=" + serviceNo + ", userNo=" + userNo + "]";
    }
    
}
