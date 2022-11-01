package com.kh.dobby.supercleaner.vo;

public class ZipVo {

    private String grade;
    private String review;
    private String userNo;
    private String imgLink;
    private String nick;

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    @Override
    public String toString() {
        return "ZipVo [grade=" + grade + ", review=" + review + ", userNo=" + userNo + ", imgLink=" + imgLink
                + ", nick=" + nick + "]";
    }

    public ZipVo(String grade, String review, String userNo, String imgLink, String nick) {
        super();
        this.grade = grade;
        this.review = review;
        this.userNo = userNo;
        this.imgLink = imgLink;
        this.nick = nick;
    }

    public ZipVo() {
        super();
        // TODO Auto-generated constructor stub
    }

}
