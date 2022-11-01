package com.kh.dobby.point.vo;

public class PointVo {

    String point;
    String userNo;
    String score;
    String type;
    String date;

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "PointVo [point=" + point + ", userNo=" + userNo + ", score=" + score + ", type=" + type + ", date="
                + date + "]";
    }

    public PointVo(String point, String userNo, String score, String type, String date) {
        super();
        this.point = point;
        this.userNo = userNo;
        this.score = score;
        this.type = type;
        this.date = date;
    }

    public PointVo() {
        super();
        // TODO Auto-generated constructor stub
    }

}
