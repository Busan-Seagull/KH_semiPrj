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
    
    //집요정꺼
    private String br_num;
    private String account;
    private String service_1;
    private String service_2;
    private String service_3;
    private String img_link;
    
    
    public MemberVo() {
        super();
        // TODO Auto-generated constructor stub
    }


    public MemberVo(String userNo, String rightNo, String id, String pwd, String name, String email, String nick,
            String address, String phone, String enrollDate, String quitYn, String modifyDate, String reportCnt,
            String br_num, String account, String service_1, String service_2, String service_3, String img_link) {
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
        this.br_num = br_num;
        this.account = account;
        this.service_1 = service_1;
        this.service_2 = service_2;
        this.service_3 = service_3;
        this.img_link = img_link;
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


    public String getBr_num() {
        return br_num;
    }


    public void setBr_num(String br_num) {
        this.br_num = br_num;
    }


    public String getAccount() {
        return account;
    }


    public void setAccount(String account) {
        this.account = account;
    }


    public String getService_1() {
        return service_1;
    }


    public void setService_1(String service_1) {
        this.service_1 = service_1;
    }


    public String getService_2() {
        return service_2;
    }


    public void setService_2(String service_2) {
        this.service_2 = service_2;
    }


    public String getService_3() {
        return service_3;
    }


    public void setService_3(String service_3) {
        this.service_3 = service_3;
    }


    public String getImg_link() {
        return img_link;
    }


    public void setImg_link(String img_link) {
        this.img_link = img_link;
    }


    @Override
    public String toString() {
        return "MemberVo [userNo=" + userNo + ", rightNo=" + rightNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name
                + ", email=" + email + ", nick=" + nick + ", address=" + address + ", phone=" + phone + ", enrollDate="
                + enrollDate + ", quitYn=" + quitYn + ", modifyDate=" + modifyDate + ", reportCnt=" + reportCnt
                + ", br_num=" + br_num + ", account=" + account + ", service_1=" + service_1 + ", service_2="
                + service_2 + ", service_3=" + service_3 + ", img_link=" + img_link + "]";
    }
    
    
    
    
    
    
   
    
    
    
    

}
