package com.kh.dobby.report.vo;

import java.sql.Timestamp;

public class ReportVo {
    
    
    
    public ReportVo() {
        super();
    }
    public ReportVo(int postNo, int writer, String title, String content, Timestamp writeTime, String deleteYn,
            Timestamp modifyDate, String handleReportYn, String reportComment) {
        super();
        this.postNo = postNo;
        this.writer = writer;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.handleReportYn = handleReportYn;
        this.reportComment = reportComment;
    }
    private int postNo;
    private int writer;
    private String title;
    private String content;
    private Timestamp writeTime;
    private String deleteYn;
    private Timestamp modifyDate;
    private String handleReportYn;
    private String reportComment;
    public int getPostNo() {
        return postNo;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }
    public int getWriter() {
        return writer;
    }
    public void setWriter(int writer) {
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
        return "ReportVo [postNo=" + postNo + ", writer=" + writer + ", title=" + title + ", content=" + content
                + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn + ", modifyDate=" + modifyDate
                + ", handleReportYn=" + handleReportYn + ", reportComment=" + reportComment + "]";
    }
    
    

}
