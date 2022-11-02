package com.kh.dobby.zzim.vo;

public class ZzimVo2 {

    private String userNo;
    private String imgLink;
    private String title;
    private String grade;
    private String review;
    private String dNo;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

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

    public String getdNo() {
        return dNo;
    }

    public void setdNo(String dNo) {
        this.dNo = dNo;
    }

    @Override
    public String toString() {
        return "ZzimVo2 [userNo=" + userNo + ", imgLink=" + imgLink + ", title=" + title + ", grade=" + grade
                + ", review=" + review + ", dNo=" + dNo + "]";
    }

    public ZzimVo2(String userNo, String imgLink, String title, String grade, String review, String dNo) {
        super();
        this.userNo = userNo;
        this.imgLink = imgLink;
        this.title = title;
        this.grade = grade;
        this.review = review;
        this.dNo = dNo;
    }

    public ZzimVo2() {
        super();
        // TODO Auto-generated constructor stub
    }

}
