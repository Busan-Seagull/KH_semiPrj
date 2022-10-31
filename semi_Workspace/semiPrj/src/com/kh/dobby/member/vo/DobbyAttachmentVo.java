package com.kh.dobby.member.vo;

public class DobbyAttachmentVo {
    private String originName;
    private String changeName;
    private String filePath;
    public DobbyAttachmentVo() {
        super();
        // TODO Auto-generated constructor stub
    }
    public DobbyAttachmentVo(String originName, String changeName, String filePath) {
        super();
        this.originName = originName;
        this.changeName = changeName;
        this.filePath = filePath;
    }
    public String getOriginName() {
        return originName;
    }
    public void setOriginName(String originName) {
        this.originName = originName;
    }
    public String getChangeName() {
        return changeName;
    }
    public void setChangeName(String changeName) {
        this.changeName = changeName;
    }
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    @Override
    public String toString() {
        return "DobbyAttachmentVo [originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
                + "]";
    }
    
    
}
