package com.kh.dobby.review.vo;

import java.sql.Timestamp;

public class ReviewVo {
    
    
    
    
    public ReviewVo() {
        super();
    }
    public ReviewVo(String postNo, String serviceNo, String userNo, String title, String content, Timestamp writeTime,
            String deleteYn, Timestamp modifyDate, String grade, String zipComm, String userNick) {
        super();
        this.postNo = postNo;
        this.serviceNo = serviceNo;
        this.userNo = userNo;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.grade = grade;
        this.zipComm = zipComm;
        this.userNick = userNick;
    }
    private String postNo;
    private String serviceNo;
    private String userNo;
    private String title;
    private String content;
    private Timestamp writeTime;
    private String deleteYn;
    private Timestamp modifyDate;
    private String grade;
    private String zipComm;
    private String userNick;
    
    
    
    
    public String getUserNick() {
        return userNick;
    }
    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }
    public String getPostNo() {
        return postNo;
    }
    public void setPostNo(String postNo) {
        this.postNo = postNo;
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
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Timestamp getWriteTime() {
        return writeTime;
    }
    public void setWriteTime(Timestamp writeTime) {
        this.writeTime = writeTime;
    }
    public String getDeleteYn() {
        return deleteYn;
    }
    public void setDeleteYn(String deleteYn) {
        this.deleteYn = deleteYn;
    }
    public Timestamp getModifyDate() {
        return modifyDate;
    }
    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }
    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }
    public String getZipComm() {
        return zipComm;
    }
    public void setZipComm(String zipComm) {
        this.zipComm = zipComm;
    }
    @Override
    public String toString() {
        return "ReviewVo [postNo=" + postNo + ", serviceNo=" + serviceNo + ", userNo=" + userNo + ", title=" + title
                + ", content=" + content + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn + ", modifyDate="
                + modifyDate + ", grade=" + grade + ", zipComm=" + zipComm + ", userNick=" + userNick + "]";
    }
    
    
    
    

}
