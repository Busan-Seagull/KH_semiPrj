package com.kh.dobby.report.vo;

import java.sql.Timestamp;

public class ReportVo {
    
    
    
    
    public ReportVo() {
        super();
    }
    public ReportVo(String postNo, String userNo, String serviceNo, String writer, String title, String content,
            Timestamp writeTime, String deleteYn, Timestamp modifyDate, String handleReportYn, String reportComment) {
        super();
        this.postNo = postNo;
        this.userNo = userNo;
        this.serviceNo = serviceNo;
        this.writer = writer;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.handleReportYn = handleReportYn;
        this.reportComment = reportComment;
    }
    private String postNo;
    private String userNo;
    private String serviceNo;
    private String writer;
    private String title;
    private String content;
    private Timestamp writeTime;
    private String deleteYn;
    private Timestamp modifyDate;
    private String handleReportYn;
    private String reportComment;
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
    public String getServiceNo() {
        return serviceNo;
    }
    public void setServiceNo(String serviceNo) {
        this.serviceNo = serviceNo;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
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
    public String getHandleReportYn() {
        return handleReportYn;
    }
    public void setHandleReportYn(String handleReportYn) {
        this.handleReportYn = handleReportYn;
    }
    public String getReportComment() {
        return reportComment;
    }
    public void setReportComment(String reportComment) {
        this.reportComment = reportComment;
    }
    @Override
    public String toString() {
        return "ReportVo [postNo=" + postNo + ", userNo=" + userNo + ", serviceNo=" + serviceNo + ", writer=" + writer
                + ", title=" + title + ", content=" + content + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn
                + ", modifyDate=" + modifyDate + ", handleReportYn=" + handleReportYn + ", reportComment="
                + reportComment + "]";
    }
   
    
    
    

}
