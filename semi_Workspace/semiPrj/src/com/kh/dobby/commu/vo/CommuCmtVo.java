package com.kh.dobby.commu.vo;

public class CommuCmtVo {
    
    private String commentNo;
    private String postNo;
    private String userNo;
    private String nick;
    private String content;
    private String writeTime;
    private String deleteYn;
    private String modifyDate;
    public CommuCmtVo() {
        super();
        // TODO Auto-generated constructor stub
    }
    public CommuCmtVo(String commentNo, String postNo, String userNo, String nick, String content, String writeTime,
            String deleteYn, String modifyDate) {
        super();
        this.commentNo = commentNo;
        this.postNo = postNo;
        this.userNo = userNo;
        this.nick = nick;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
    }
    public String getCommentNo() {
        return commentNo;
    }
    public void setCommentNo(String commentNo) {
        this.commentNo = commentNo;
    }
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
    public String getNick() {
        return nick;
    }
    public void setNick(String nick) {
        this.nick = nick;
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
    @Override
    public String toString() {
        return "CommuCmtVo [commentNo=" + commentNo + ", postNo=" + postNo + ", userNo=" + userNo + ", nick=" + nick
                + ", content=" + content + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn + ", modifyDate="
                + modifyDate + "]";
    }
    
    }
   