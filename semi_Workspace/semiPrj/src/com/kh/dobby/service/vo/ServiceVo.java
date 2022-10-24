package com.kh.dobby.service.vo;

import java.sql.Timestamp;

public class ServiceVo {

    private int serviceNo;
    private String title;
    private int typeNo;
    private String serviceType;
    private int helperNo;
    private String helper;
    private String serviceIntro;
    private String profileImg;
    private int charge;
    private int chargeUnitNo;
    private String chargeUnit;
    private int helperExp;
    private String openTime;
    private String closeTime;
    private String serviceDetail;
    private String paymentDetail;
    private String servicePic_1;
    private String servicePic_2;
    private String servicePic_3;
    private String servicePic_4;
    private int pTypeNo_1;
    private int pTypeNo_2;
    private int pTypeNo_3;
    private int areaNo_1;
    private int areaNo_2;
    private int areaNo_3;
    private int areaNo_4;
    private int areaNo_5;
    
    public ServiceVo() {
        
    }

    public ServiceVo(int serviceNo, String title, int typeNo, String serviceType, int helperNo, String helper,
            String serviceIntro, String profileImg, int charge, int chargeUnitNo, String chargeUnit, int helperExp,
            String openTime, String closeTime, String serviceDetail, String paymentDetail, String servicePic_1,
            String servicePic_2, String servicePic_3, String servicePic_4, int pTypeNo_1, int pTypeNo_2, int pTypeNo_3,
            int areaNo_1, int areaNo_2, int areaNo_3, int areaNo_4, int areaNo_5) {
        super();
        this.serviceNo = serviceNo;
        this.title = title;
        this.typeNo = typeNo;
        this.serviceType = serviceType;
        this.helperNo = helperNo;
        this.helper = helper;
        this.serviceIntro = serviceIntro;
        this.profileImg = profileImg;
        this.charge = charge;
        this.chargeUnitNo = chargeUnitNo;
        this.chargeUnit = chargeUnit;
        this.helperExp = helperExp;
        this.openTime = openTime;
        this.closeTime = closeTime;
        this.serviceDetail = serviceDetail;
        this.paymentDetail = paymentDetail;
        this.servicePic_1 = servicePic_1;
        this.servicePic_2 = servicePic_2;
        this.servicePic_3 = servicePic_3;
        this.servicePic_4 = servicePic_4;
        this.pTypeNo_1 = pTypeNo_1;
        this.pTypeNo_2 = pTypeNo_2;
        this.pTypeNo_3 = pTypeNo_3;
        this.areaNo_1 = areaNo_1;
        this.areaNo_2 = areaNo_2;
        this.areaNo_3 = areaNo_3;
        this.areaNo_4 = areaNo_4;
        this.areaNo_5 = areaNo_5;
    }

    public int getChargeUnitNo() {
        return chargeUnitNo;
    }
    public void setChargeUnitNo(int chargeUnitNo) {
        this.chargeUnitNo = chargeUnitNo;
    }
    public String getServiceType() {
        return serviceType;
    }
    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
    public String getHelper() {
        return helper;
    }

    public void setHelper(String helper) {
        this.helper = helper;
    }

    public int getServiceNo() {
        return serviceNo;
    }

    public void setServiceNo(int serviceNo) {
        this.serviceNo = serviceNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTypeNo() {
        return typeNo;
    }

    public void setTypeNo(int typeNo) {
        this.typeNo = typeNo;
    }

    public int getHelperNo() {
        return helperNo;
    }

    public void setHelperNo(int helperNo) {
        this.helperNo = helperNo;
    }

    public String getServiceIntro() {
        return serviceIntro;
    }

    public void setServiceIntro(String serviceIntro) {
        this.serviceIntro = serviceIntro;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public int getCharge() {
        return charge;
    }

    public void setCharge(int charge) {
        this.charge = charge;
    }

    public String getChargeUnit() {
        return chargeUnit;
    }

    public void setChargeUnit(String chargeUnit) {
        this.chargeUnit = chargeUnit;
    }

    public int getHelperExp() {
        return helperExp;
    }

    public void setHelperExp(int helperExp) {
        this.helperExp = helperExp;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public String getServiceDetail() {
        return serviceDetail;
    }

    public void setServiceDetail(String serviceDetail) {
        this.serviceDetail = serviceDetail;
    }

    public String getPaymentDetail() {
        return paymentDetail;
    }

    public void setPaymentDetail(String paymentDetail) {
        this.paymentDetail = paymentDetail;
    }

    public String getServicePic_1() {
        return servicePic_1;
    }

    public void setServicePic_1(String servicePic_1) {
        this.servicePic_1 = servicePic_1;
    }

    public String getServicePic_2() {
        return servicePic_2;
    }

    public void setServicePic_2(String servicePic_2) {
        this.servicePic_2 = servicePic_2;
    }

    public String getServicePic_3() {
        return servicePic_3;
    }

    public void setServicePic_3(String servicePic_3) {
        this.servicePic_3 = servicePic_3;
    }

    public String getServicePic_4() {
        return servicePic_4;
    }

    public void setServicePic_4(String servicePic_4) {
        this.servicePic_4 = servicePic_4;
    }

    public int getpTypeNo_1() {
        return pTypeNo_1;
    }

    public void setpTypeNo_1(int pTypeNo_1) {
        this.pTypeNo_1 = pTypeNo_1;
    }

    public int getpTypeNo_2() {
        return pTypeNo_2;
    }

    public void setpTypeNo_2(int pTypeNo_2) {
        this.pTypeNo_2 = pTypeNo_2;
    }

    public int getpTypeNo_3() {
        return pTypeNo_3;
    }

    public void setpTypeNo_3(int pTypeNo_3) {
        this.pTypeNo_3 = pTypeNo_3;
    }

    public int getAreaNo_1() {
        return areaNo_1;
    }

    public void setAreaNo_1(int areaNo_1) {
        this.areaNo_1 = areaNo_1;
    }

    public int getAreaNo_2() {
        return areaNo_2;
    }

    public void setAreaNo_2(int areaNo_2) {
        this.areaNo_2 = areaNo_2;
    }

    public int getAreaNo_3() {
        return areaNo_3;
    }

    public void setAreaNo_3(int areaNo_3) {
        this.areaNo_3 = areaNo_3;
    }

    public int getAreaNo_4() {
        return areaNo_4;
    }

    public void setAreaNo_4(int areaNo_4) {
        this.areaNo_4 = areaNo_4;
    }

    public int getAreaNo_5() {
        return areaNo_5;
    }

    public void setAreaNo_5(int areaNo_5) {
        this.areaNo_5 = areaNo_5;
    }

    @Override
    public String toString() {
        return "ServiceVo [serviceNo=" + serviceNo + ", title=" + title + ", typeNo=" + typeNo + ", serviceType="
                + serviceType + ", helperNo=" + helperNo + ", helper=" + helper + ", serviceIntro=" + serviceIntro
                + ", profileImg=" + profileImg + ", charge=" + charge + ", chargeUnitNo=" + chargeUnitNo
                + ", chargeUnit=" + chargeUnit + ", helperExp=" + helperExp + ", openTime=" + openTime + ", closeTime="
                + closeTime + ", serviceDetail=" + serviceDetail + ", paymentDetail=" + paymentDetail
                + ", servicePic_1=" + servicePic_1 + ", servicePic_2=" + servicePic_2 + ", servicePic_3=" + servicePic_3
                + ", servicePic_4=" + servicePic_4 + ", pTypeNo_1=" + pTypeNo_1 + ", pTypeNo_2=" + pTypeNo_2
                + ", pTypeNo_3=" + pTypeNo_3 + ", areaNo_1=" + areaNo_1 + ", areaNo_2=" + areaNo_2 + ", areaNo_3="
                + areaNo_3 + ", areaNo_4=" + areaNo_4 + ", areaNo_5=" + areaNo_5 + "]";
    }
}