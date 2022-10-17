package com.kh.dobby.payVo;

import java.sql.Timestamp;

public class PayVo {
    
    private int paymentNo;
    private int reservationNo;
    private int pTypeNo;
    private Timestamp paymentDate;
    private Timestamp cancelDate;
    private int point;
    
    public PayVo() {
        super();
    }
    public PayVo(int paymentNo, int reservationNo, int pTypeNo, Timestamp paymentDate, Timestamp cancelDate,
            int point) {
        super();
        this.paymentNo = paymentNo;
        this.reservationNo = reservationNo;
        this.pTypeNo = pTypeNo;
        this.paymentDate = paymentDate;
        this.cancelDate = cancelDate;
        this.point = point;
    }
    public int getPaymentNo() {
        return paymentNo;
    }
    public void setPaymentNo(int paymentNo) {
        this.paymentNo = paymentNo;
    }
    public int getReservationNo() {
        return reservationNo;
    }
    public void setReservationNo(int reservationNo) {
        this.reservationNo = reservationNo;
    }
    public int getpTypeNo() {
        return pTypeNo;
    }
    public void setpTypeNo(int pTypeNo) {
        this.pTypeNo = pTypeNo;
    }
    public Timestamp getPaymentDate() {
        return paymentDate;
    }
    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }
    public Timestamp getCancelDate() {
        return cancelDate;
    }
    public void setCancelDate(Timestamp cancelDate) {
        this.cancelDate = cancelDate;
    }
    public int getPoint() {
        return point;
    }
    public void setPoint(int point) {
        this.point = point;
    }
    @Override
    public String toString() {
        return "PayVo [paymentNo=" + paymentNo + ", reservationNo=" + reservationNo + ", pTypeNo=" + pTypeNo
                + ", paymentDate=" + paymentDate + ", cancelDate=" + cancelDate + ", point=" + point + "]";
    }
    
    
    
    
}

