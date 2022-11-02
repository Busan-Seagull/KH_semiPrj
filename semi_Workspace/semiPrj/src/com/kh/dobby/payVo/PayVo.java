package com.kh.dobby.payVo;

import java.sql.Timestamp;

public class PayVo {

    private String paymentNo;
    private String reservationNo;
    private String point;
    private String paymentType;
    private String request;
    private String paymentDate;
    private String cancelDate;
    private String serviceTitle;
    private String serviceCharge;
    private String profileImg;
    
    public PayVo() {
    }
    
    

    public PayVo(String paymentNo, String reservationNo, String point, String paymentType, String request,
            String paymentDate, String cancelDate, String serviceTitle, String serviceCharge, String profileImg) {
        super();
        this.paymentNo = paymentNo;
        this.reservationNo = reservationNo;
        this.point = point;
        this.paymentType = paymentType;
        this.request = request;
        this.paymentDate = paymentDate;
        this.cancelDate = cancelDate;
        this.serviceTitle = serviceTitle;
        this.serviceCharge = serviceCharge;
        this.profileImg = profileImg;
    }


    
    

    public String getProfileImg() {
        return profileImg;
    }



    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }



    public String getServiceTitle() {
        return serviceTitle;
    }



    public void setServiceTitle(String serviceTitle) {
        this.serviceTitle = serviceTitle;
    }



    public String getServiceCharge() {
        return serviceCharge;
    }



    public void setServiceCharge(String serviceCharge) {
        this.serviceCharge = serviceCharge;
    }



    public String getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(String cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getPaymentNo() {
        return paymentNo;
    }
    public void setPaymentNo(String paymentNo) {
        this.paymentNo = paymentNo;
    }
    public String getPaymentDate() {
        return paymentDate;
    }
    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
    public String getReservationNo() {
        return reservationNo;
    }
    public void setReservationNo(String reservationNo) {
        this.reservationNo = reservationNo;
    }
    public String getPoint() {
        return point;
    }
    public void setPoint(String point) {
        this.point = point;
    }
    public String getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
    
    
    @Override
    public String toString() {
        return "PayVo [paymentNo=" + paymentNo + ", reservationNo=" + reservationNo + ", point=" + point
                + ", paymentType=" + paymentType + ", request=" + request + ", paymentDate=" + paymentDate
                + ", cancelDate=" + cancelDate + ", serviceTitle=" + serviceTitle + ", serviceCharge=" + serviceCharge
                + ", profileImg=" + profileImg + "]";
    }
    
    
    
    
    
}
