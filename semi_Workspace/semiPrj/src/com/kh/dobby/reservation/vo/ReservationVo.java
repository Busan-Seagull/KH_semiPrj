package com.kh.dobby.reservation.vo;

public class ReservationVo {

    public ReservationVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ReservationVo(String reservation_no, String serviceNo, String userNo, String userName,
            String reservationDate, String cancelDate, String reservationAmount, String reservationYN, String comment,
            String reComment, String estimateDate) {
        super();
        this.reservation_no = reservation_no;
        this.serviceNo = serviceNo;
        this.userNo = userNo;
        this.userName = userName;
        this.reservationDate = reservationDate;
        this.cancelDate = cancelDate;
        this.reservationAmount = reservationAmount;
        this.reservationYN = reservationYN;
        this.comment = comment;
        this.reComment = reComment;
        this.estimateDate = estimateDate;
    }

    private String reservation_no;
    private String serviceNo;
    private String userNo;
    private String userName;
    private String reservationDate;
    private String cancelDate;
    private String reservationAmount;
    private String reservationYN;
    private String comment;
    private String reComment;
    private String estimateDate;

    public String getReservation_no() {
        return reservation_no;
    }

    public void setReservation_no(String reservation_no) {
        this.reservation_no = reservation_no;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(String cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getReservationAmount() {
        return reservationAmount;
    }

    public void setReservationAmount(String reservationAmount) {
        this.reservationAmount = reservationAmount;
    }

    public String getReservationYN() {
        return reservationYN;
    }

    public void setReservationYN(String reservationYN) {
        this.reservationYN = reservationYN;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getReComment() {
        return reComment;
    }

    public void setReComment(String reComment) {
        this.reComment = reComment;
    }

    public String getEstimateDate() {
        return estimateDate;
    }

    public void setEstimateDate(String estimateDate) {
        this.estimateDate = estimateDate;
    }

    @Override
    public String toString() {
        return "ReservationVo [reservation_no=" + reservation_no + ", serviceNo=" + serviceNo + ", userNo=" + userNo
                + ", userName=" + userName + ", reservationDate=" + reservationDate + ", cancelDate=" + cancelDate
                + ", reservationAmount=" + reservationAmount + ", reservationYN=" + reservationYN + ", comment="
                + comment + ", reComment=" + reComment + ", estimateDate=" + estimateDate + "]";
    }

}