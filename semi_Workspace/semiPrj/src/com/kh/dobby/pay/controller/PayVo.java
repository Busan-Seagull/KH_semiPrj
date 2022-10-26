package com.kh.dobby.pay.controller;

public class PayVo {
    //reservationVo
    //결제요청사항
    //결제수단
    //예약날짜
    //요청사항
    //요금단위
    //요금
    //결제금액
    //포인트 적립(결제금액의 10%)
    
    //payVo
    //예약번호
    //결제일자
    //결제번호
    //사용포인트
    //결제수단
    private String paymentNo;
    private String paymentDate;
    private String reservationNo;
    private String point;
    private String paymentType;
    
    public PayVo() {
    }
    public PayVo(String paymentNo, String paymentDate, String reservationNo, String point, String paymentType) {
        this.paymentNo = paymentNo;
        this.paymentDate = paymentDate;
        this.reservationNo = reservationNo;
        this.point = point;
        this.paymentType = paymentType;
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
        return "PayVo [paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", reservationNo=" + reservationNo
                + ", point=" + point + ", paymentType=" + paymentType + "]";
    }
    
    
    
    
    
}
