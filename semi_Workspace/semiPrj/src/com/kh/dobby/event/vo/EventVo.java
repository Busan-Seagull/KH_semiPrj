package com.kh.dobby.event.vo;

public class EventVo {

    public EventVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public EventVo(String no, String userNo, String userName, String difficulty, String date, String score,
            String point) {
        super();
        this.no = no;
        this.userNo = userNo;
        this.userName = userName;
        this.difficulty = difficulty;
        this.date = date;
        this.score = score;
        this.point = point;
    }

    private String no;
    private String userNo;
    private String userName;
    private String difficulty;
    private String date;
    private String score;
    private String point;

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "EventVo [no=" + no + ", userNo=" + userNo + ", userName=" + userName + ", difficulty=" + difficulty
                + ", date=" + date + ", score=" + score + ", point=" + point + "]";
    }

}
