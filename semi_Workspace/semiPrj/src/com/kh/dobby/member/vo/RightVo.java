package com.kh.dobby.member.vo;

public class RightVo {
    
    private String user_no;
    private String br_num;
    private String account;
    private String service_1;
    private String service_2;
    private String service_3;
    private String img_link;
    
    
    
    public RightVo() {
        super();
        // TODO Auto-generated constructor stub
    }



    public RightVo(String user_no, String br_num, String account, String service_1, String service_2, String service_3,
            String img_link) {
        super();
        this.user_no = user_no;
        this.br_num = br_num;
        this.account = account;
        this.service_1 = service_1;
        this.service_2 = service_2;
        this.service_3 = service_3;
        this.img_link = img_link;
    }



    public String getUser_no() {
        return user_no;
    }



    public void setUser_no(String user_no) {
        this.user_no = user_no;
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
        return "RightVo [user_no=" + user_no + ", br_num=" + br_num + ", account=" + account + ", service_1="
                + service_1 + ", service_2=" + service_2 + ", service_3=" + service_3 + ", img_link=" + img_link + "]";
    }
    
    
    
    

}
