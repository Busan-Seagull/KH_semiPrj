package com.kh.dobby.member.vo;

public class MemberVo {
    
   
    private String userNo;
    private String rightNo;
    private String id;
    private String pwd;
    private String name;
    private String email;
    private String nick;
    private String address;
    private String phone;
    private String enrollDate;
    private String quitYn;
    private String modifyDate;
    private String reportCnt;
    
    
    public MemberVo() {
        super();
    }


    public MemberVo(String userNo, String rightNo, String id, String pwd, String name, String email, String nick,
            String address, String phone, String enrollDate, String quitYn, String modifyDate, String reportCnt) {
        super();
        this.userNo = userNo;
        this.rightNo = rightNo;
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.nick = nick;
        this.address = address;
        this.phone = phone;
        this.enrollDate = enrollDate;
        this.quitYn = quitYn;
        this.modifyDate = modifyDate;
        this.reportCnt = reportCnt;
    }


    public String getUserNo() {
        return userNo;
    }


    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }


    public String getRightNo() {
        return rightNo;
    }


    public void setRightNo(String rightNo) {
        this.rightNo = rightNo;
    }


    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id;
    }


    public String getPwd() {
        return pwd;
    }


    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getNick() {
        return nick;
    }


    public void setNick(String nick) {
        this.nick = nick;
    }


    public String getAddress() {
        return address;
    }


    public void setAddress(String address) {
        this.address = address;
    }


    public String getPhone() {
        return phone;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getEnrollDate() {
        return enrollDate;
    }


    public void setEnrollDate(String enrollDate) {
        this.enrollDate = enrollDate;
    }


    public String getQuitYn() {
        return quitYn;
    }


    public void setQuitYn(String quitYn) {
        this.quitYn = quitYn;
    }


    public String getModifyDate() {
        return modifyDate;
    }


    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }


    public String getReportCnt() {
        return reportCnt;
    }


    public void setReportCnt(String reportCnt) {
        this.reportCnt = reportCnt;
    }


    @Override
    public String toString() {
        return "MemberVo [userNo=" + userNo + ", rightNo=" + rightNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name
                + ", email=" + email + ", nick=" + nick + ", address=" + address + ", phone=" + phone + ", enrollDate="
                + enrollDate + ", quitYn=" + quitYn + ", modifyDate=" + modifyDate + ", reportCnt=" + reportCnt + "]";
    }
    
    
    
    
    
    

}
