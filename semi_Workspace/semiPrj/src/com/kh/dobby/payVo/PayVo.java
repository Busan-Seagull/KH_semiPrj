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
    
    public PayVo() {
    }
    
    public PayVo(String paymentNo, String reservationNo, String point, String paymentType, String request,
            String paymentDate, String cancelDate) {
        super();
        this.paymentNo = paymentNo;
        this.reservationNo = reservationNo;
        this.point = point;
        this.paymentType = paymentType;
        this.request = request;
        this.paymentDate = paymentDate;
        this.cancelDate = cancelDate;
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
                + ", cancelDate=" + cancelDate + "]";
    }
    
    
    
    
    
}
