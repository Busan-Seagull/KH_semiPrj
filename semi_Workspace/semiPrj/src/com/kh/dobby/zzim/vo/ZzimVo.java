package com.kh.dobby.zzim.vo;

public class ZzimVo {
    String userno;
    String servicename;
    String profileimg;
    String serviceno;
    public String getUserno() {
        return userno;
    }
    public void setUserno(String userno) {
        this.userno = userno;
    }
    public String getServicename() {
        return servicename;
    }
    public void setServicename(String servicename) {
        this.servicename = servicename;
    }
    public String getProfileimg() {
        return profileimg;
    }
    public void setProfileimg(String profileimg) {
        this.profileimg = profileimg;
    }
    public String getServiceno() {
        return serviceno;
    }
    public void setServiceno(String serviceno) {
        this.serviceno = serviceno;
    }
    @Override
    public String toString() {
        return "ZzimVo [userno=" + userno + ", servicename=" + servicename + ", profileimg=" + profileimg
                + ", serviceno=" + serviceno + "]";
    }
    public ZzimVo(String userno, String servicename, String profileimg, String serviceno) {
        super();
        this.userno = userno;
        this.servicename = servicename;
        this.profileimg = profileimg;
        this.serviceno = serviceno;
    }
    public ZzimVo() {
        super();
    }
    
    
    
    //어떻게 가져올거냐?
    //유저넘버랑 이미지링크를 어떻게 가져오느냐?
    //테이블조인으로 유저넘버랑 이미지링크를 가져올수있음
    //거기 연결한 유저넘버는 어떻게 인식하지?
    //결론 : userId를 세션에서 가져와, 세션의 userId와 일치하는 userId를 where에 넣어서,
    // 그 테이블 열의 userNo를 User테이블에서 가져오기로 함..
    //이렇게만 하면 로그인한 사람별로 데이터를 따로 가져오는 게 가능함
    
    //문제 : user테이블의 id는 userid가 아니라 id였다...
}
