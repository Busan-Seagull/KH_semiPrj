package com.kh.dobby.review.vo;

import java.sql.Timestamp;

public class ReviewVo {
    
    
    
    public ReviewVo() {
        super();
    }
    public ReviewVo(int postNo, String title, String content, Timestamp writeTime, String deleteYn,
            Timestamp modifyDate, int grade, String zipComm) {
        super();
        this.postNo = postNo;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.grade = grade;
        this.zipComm = zipComm;
    }
    private int postNo;
    private String title;
    private String content;
    private Timestamp writeTime;
    private String deleteYn;
    private Timestamp modifyDate;
    private int grade;
    private String zipComm;
    public int getPostNo() {
        return postNo;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
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
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
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
        return "ReviewVo [postNo=" + postNo + ", title=" + title + ", content=" + content + ", writeTime=" + writeTime
                + ", deleteYn=" + deleteYn + ", modifyDate=" + modifyDate + ", grade=" + grade + ", zipComm=" + zipComm
                + "]";
    }
    
    

}
