package com.kh.dobby.commu.vo;

public class CommuVo {

    private String postNo;
    private String typeNo;
    private String userNo;
    private String title;
    private String content;
    private String writeTime;
    private String deleteYn;
    private String modifyDate;
    private String views;
    
    
    public CommuVo() {
        super();
        // TODO Auto-generated constructor stub
    }


    public CommuVo(String postNo, String typeNo, String userNo, String title, String content, String writeTime,
            String deleteYn, String modifyDate, String views) {
        super();
        this.postNo = postNo;
        this.typeNo = typeNo;
        this.userNo = userNo;
        this.title = title;
        this.content = content;
        this.writeTime = writeTime;
        this.deleteYn = deleteYn;
        this.modifyDate = modifyDate;
        this.views = views;
    }


    public String getPostNo() {
        return postNo;
    }


    public void setPostNo(String postNo) {
        this.postNo = postNo;
    }


    public String getTypeNo() {
        return typeNo;
    }


    public void setTypeNo(String typeNo) {
        this.typeNo = typeNo;
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


    public String getViews() {
        return views;
    }


    public void setViews(String views) {
        this.views = views;
    }


    @Override
    public String toString() {
        return "CommuVo [postNo=" + postNo + ", typeNo=" + typeNo + ", userNo=" + userNo + ", title=" + title
                + ", content=" + content + ", writeTime=" + writeTime + ", deleteYn=" + deleteYn + ", modifyDate="
                + modifyDate + ", views=" + views + "]";
    }
    
    
    
    
    
    
}
