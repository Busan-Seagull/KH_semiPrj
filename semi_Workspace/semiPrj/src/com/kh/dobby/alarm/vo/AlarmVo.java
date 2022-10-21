package com.kh.dobby.alarm.vo;

public class AlarmVo {

    public AlarmVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public AlarmVo(String alarmNo, String userNo, String content, String modifyDate, String checkYn) {
        super();
        this.alarmNo = alarmNo;
        this.userNo = userNo;
        this.content = content;
        this.modifyDate = modifyDate;
        this.checkYn = checkYn;
    }

    private String alarmNo;
    private String userNo;
    private String content;
    private String modifyDate;
    private String checkYn;

    public String getAlarmNo() {
        return alarmNo;
    }

    public void setAlarmNo(String alarmNo) {
        this.alarmNo = alarmNo;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getCheckYn() {
        return checkYn;
    }

    public void setCheckYn(String checkYn) {
        this.checkYn = checkYn;
    }

    @Override
    public String toString() {
        return "AlarmVo [alarmNo=" + alarmNo + ", userNo=" + userNo + ", content=" + content + ", modifyDate="
                + modifyDate + ", checkYn=" + checkYn + "]";
    }

}
