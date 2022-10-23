package com.kh.dobby.service.vo;

public class CodeVo {
    private String area_1;
    private String area_2;
    private String area_3;
    private String area_4;
    private String area_5;
    private String payment_1;
    private String payment_2;
    private String payment_3;
    
    
    
    
    public CodeVo() {
        super();
    }




    public CodeVo(String area_1, String area_2, String area_3, String area_4, String area_5, String payment_1,
            String payment_2, String payment_3) {
        super();
        this.area_1 = area_1;
        this.area_2 = area_2;
        this.area_3 = area_3;
        this.area_4 = area_4;
        this.area_5 = area_5;
        this.payment_1 = payment_1;
        this.payment_2 = payment_2;
        this.payment_3 = payment_3;
    }




    public String getArea_1() {
        return area_1;
    }




    public void setArea_1(String area_1) {
        this.area_1 = area_1;
    }




    public String getArea_2() {
        return area_2;
    }




    public void setArea_2(String area_2) {
        this.area_2 = area_2;
    }




    public String getArea_3() {
        return area_3;
    }




    public void setArea_3(String area_3) {
        this.area_3 = area_3;
    }




    public String getArea_4() {
        return area_4;
    }




    public void setArea_4(String area_4) {
        this.area_4 = area_4;
    }




    public String getArea_5() {
        return area_5;
    }




    public void setArea_5(String area_5) {
        this.area_5 = area_5;
    }




    public String getPayment_1() {
        return payment_1;
    }




    public void setPayment_1(String payment_1) {
        this.payment_1 = payment_1;
    }




    public String getPayment_2() {
        return payment_2;
    }




    public void setPayment_2(String payment_2) {
        this.payment_2 = payment_2;
    }




    public String getPayment_3() {
        return payment_3;
    }




    public void setPayment_3(String payment_3) {
        this.payment_3 = payment_3;
    }




    @Override
    public String toString() {
        return "CodeVo [area_1=" + area_1 + ", area_2=" + area_2 + ", area_3=" + area_3 + ", area_4=" + area_4
                + ", area_5=" + area_5 + ", payment_1=" + payment_1 + ", payment_2=" + payment_2 + ", payment_3="
                + payment_3 + "]";
    }
    
    
    
    
    

}
