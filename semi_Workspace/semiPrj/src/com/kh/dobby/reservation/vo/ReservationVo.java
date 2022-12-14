package com.kh.dobby.reservation.vo;

public class ReservationVo {

    public ReservationVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ReservationVo(String reservation_no, String serviceNo, String userNo, String userName,
            String reservationDate, String cancelDate, String reservationAmount, String reservationYN, String comment,
            String reComment, String estimateDate, String dName, String sName, String sTitle, String charge,
            String chargeUnit, String dNo, String address, String payNo, String status, String dProfil,
            String sProfil) {
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
        this.dName = dName;
        this.sName = sName;
        this.sTitle = sTitle;
        this.charge = charge;
        this.chargeUnit = chargeUnit;
        this.dNo = dNo;
        this.address = address;
        this.payNo = payNo;
        this.status = status;
        this.dProfil = dProfil;
        this.sProfil = sProfil;
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

    private String dName;
    private String sName;
    private String sTitle;
    private String charge;
    private String chargeUnit;
    private String dNo;
    private String address;

    private String payNo;
    private String status;
    private String dProfil;
    private String sProfil;

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

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsTitle() {
        return sTitle;
    }

    public void setsTitle(String sTitle) {
        this.sTitle = sTitle;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public String getChargeUnit() {
        return chargeUnit;
    }

    public void setChargeUnit(String chargeUnit) {
        this.chargeUnit = chargeUnit;
    }

    public String getdNo() {
        return dNo;
    }

    public void setdNo(String dNo) {
        this.dNo = dNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPayNo() {
        return payNo;
    }

    public void setPayNo(String payNo) {
        this.payNo = payNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getdProfil() {
        return dProfil;
    }

    public void setdProfil(String dProfil) {
        this.dProfil = dProfil;
    }

    public String getsProfil() {
        return sProfil;
    }

    public void setsProfil(String sProfil) {
        this.sProfil = sProfil;
    }

    @Override
    public String toString() {
        return "ReservationVo [reservation_no=" + reservation_no + ", serviceNo=" + serviceNo + ", userNo=" + userNo
                + ", userName=" + userName + ", reservationDate=" + reservationDate + ", cancelDate=" + cancelDate
                + ", reservationAmount=" + reservationAmount + ", reservationYN=" + reservationYN + ", comment="
                + comment + ", reComment=" + reComment + ", estimateDate=" + estimateDate + ", dName=" + dName
                + ", sName=" + sName + ", sTitle=" + sTitle + ", charge=" + charge + ", chargeUnit=" + chargeUnit
                + ", dNo=" + dNo + ", address=" + address + ", payNo=" + payNo + ", status=" + status + ", dProfil="
                + dProfil + ", sProfil=" + sProfil + "]";
    }

}
