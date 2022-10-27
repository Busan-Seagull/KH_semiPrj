package com.kh.dobby.request.vo;

public class RequestVo {
    private String postNo;
    private String userNo;
    private String title;
    private String content;
    private String writeTime;
    private String deleteYn;
    private String modifyDate;
    private String adminNo;
    private String repeatReport;
    private String repeatContent;
    private String repeatTime;
    private String repeatModifyDate;
    private String repeatDeleteYn;
    public String getPostNo() {
        return postNo;
    }
    public void setPostNo(String postNo) {
        this.postNo = postNo;
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
    public String getWriteTime() {
        return writeTime;
    }
    public void setWriteTime(String writeTime) {
        this.writeTime = writeTime;
    }
    public String getDeleteYn() {
        return deleteYn;
    }
    public void setDeleteYn(String deleteYn) {
        this.deleteYn = deleteYn;
    }
    public String getModifyDate() {
        return modifyDate;
    }
    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }
    public String getAdminNo() {
        return adminNo;
    }
    public void setAdminNo(String adminNo) {
        this.adminNo = adminNo;
    }
    public String getRepeatReport() {
        return repeatReport;
    }
    public void setRepeatReport(String repeatReport) {
        this.repeatReport = repeatReport;
    }
    public String getRepeatContent() {
        return repeatContent;
    }
    public void setRepeatContent(String repeatContent) {
        this.repeatContent = repeatContent;
    }
    public String getRepeatTime() {
        return repeatTime;
    }
    public void setRepeatTime(String repeatTime) {
        this.repeatTime = repeatTime;
    }
    public String getRepeatModifyDate() {
        return repeatModifyDate;
    }
    public void setRepeatModifyDate(String repeatModifyDate) {
        this.repeatModifyDate = repeatModifyDate;
    }
    public String getRepeatDeleteYn() {
        return repeatDeleteYn;
    }
    public void setRepeatDeleteYn(String repeatDeleteYn) {
        this.repeatDeleteYn = repeatDeleteYn;
    }
    @Override
    public String toString() {
        return "Requestvo [postNo=" + postNo + ", userNo=" + userNo + ", title=" + title + ", content=" + content
                + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn + ", modifyDate=" + modifyDate + ", adminNo="
                + adminNo + ", repeatReport=" + repeatReport + ", repeatContent=" + repeatContent + ", repeatTime="
                + repeatTime + ", repeatModifyDate=" + repeatModifyDate + ", repeatDeleteYn=" + repeatDeleteYn + "]";
    }
    public RequestVo(String postNo, String userNo, String title, String content, String writeTime, String deleteYn,
            String modifyDate, String adminNo, String repeatReport, String repeatContent, String repeatTime,
            String repeatModifyDate, String repeatDeleteYn) {
        super();
        this.postNo = postNo;
        this.userNo = userNo;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.adminNo = adminNo;
        this.repeatReport = repeatReport;
        this.repeatContent = repeatContent;
        this.repeatTime = repeatTime;
        this.repeatModifyDate = repeatModifyDate;
        this.repeatDeleteYn = repeatDeleteYn;
    }
    public RequestVo() {
        super();
    }
    
    
}
