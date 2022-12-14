package com.kh.dobby.zzim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.zzim.vo.ZzimVo;
import com.kh.dobby.zzim.vo.ZzimVo2;

public class ZzimDao {

    public ZzimVo zzimlist(Connection conn, ZzimVo zzimvo) {
        // TODO Auto-generated method stub
        String sql = "SELECT SERVICE_TITLE, IMAGE_LINK, SERVICE_NO, USER_NO FROM SERVICE_INFO WHERE SERVICE_INFO.USER_NO=?";
        
        
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        ZzimVo zzimMember = null;
        
        
         
      //찜테이블은 원래 유저넘버랑 서비스넘버밖에 없음
        //유저넘버는 이미 가져옴, 유저넘버는 SQL문의 유저넘버 란에 집어넣을거임
        
        //String servicename; // 타 테이블 칼럼에 해당하는 SERVICE_TITLE 가져와야..
                            // SERVICE_NO를 타 테이블(SERVICE_NO FROM SERVICE_INFO)랑 일치시키고 
                            // ZZIM.SERVICE_NO == SERVICE_INFO.SERVICE_NO
                            
        
        //String profileimg; // 타 테이블의 칼럼(IMAGE_LINK FROM SERVICE_INFO)을 가져와야..
                           // IMAGE_LINK는 SERVICE_INFO테이블의 SERVICE_NO가 ZZIM테이블의 SERVICE_NO와 같아야함
                           // IMAGE_LINK FROM SERVICE_INFO WHERE ZZIM.SERVICE_NO = SERVICE_INFO.SERVICE_NO
        
        //우선, 저 3개만 가져오는 걸로 결론.. 서비스 화면이 안나옴.... 페이징 작업도 어떻게 하는지도 모르겠음..
        
        //TABLE : SERVICE_INFO A, ZZIM Z
        String serviceno=null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, zzimvo.getUserno());                         //System.out.println("userno try문에서:"+userno);
            rs=pstmt.executeQuery();
            System.out.println("userno는 다음과 같습니다 : " + zzimvo.getUserno());
            
            while(rs.next()) {
                
            
            serviceno = rs.getString("SERVICE_NO");
            String profileimg = rs.getString("IMAGE_LINK");
            String servicename = rs.getString("SERVICE_TITLE");
            System.out.println("serviceno 데이터 : "+serviceno);
            System.out.println("profileimg 데이터 : "+profileimg);
            System.out.println("servicename 데이터 : "+servicename);
            System.out.println();
            
            
            zzimMember = new ZzimVo();
            
            zzimMember.setServiceno(serviceno);
            zzimMember.setServicename(servicename);
            zzimMember.setProfileimg(profileimg);
            zzimMember.setUserno(zzimvo.getUserno());
            };
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if(serviceno==null) {
                System.out.println("데이터 없음");
            }
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        //System.out.println();
        
        return zzimMember;
    }

    public List<ZzimVo2> getZzimList(Connection conn, String userNo) {
        
        String sql = "SELECT SERVICE_TITLE, s.service_no, GRADE, REVIEW, SERVICE_PIC_1 FROM ZZIM Z JOIN SERVICE_INFO S ON Z.SERVICE_NO = S.SERVICE_NO JOIN ( SELECT AVG(GRADE) AS GRADE, SERVICE_NO, COUNT(GRADE) AS REVIEW FROM REVIEW GROUP BY SERVICE_NO ) R ON Z.SERVICE_NO = R.SERVICE_NO WHERE Z.USER_NO = ?";
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        
        List<ZzimVo2> list = new ArrayList<>();
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            
            rs = pstmt.executeQuery();
            while(rs.next()) {
                ZzimVo2 vo = new ZzimVo2();
                vo.setdNo(rs.getString("service_no"));
                vo.setGrade(rs.getString("GRADE"));
                vo.setImgLink(rs.getString("SERVICE_PIC_1"));
                vo.setReview(rs.getString("REVIEW"));
                vo.setTitle(rs.getString("SERVICE_TITLE"));
                                
                list.add(vo);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        
        return list;
    }

    public int insert(Connection conn, String sno, String userNo) {
        System.out.println("insert");
        System.out.println(sno);
        System.out.println(userNo);
        String sql = "INSERT INTO ZZIM VALUES(?, ?)";
        
        PreparedStatement pstmt = null;
        int result = 0;
                
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            pstmt.setString(2, sno);
            
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public int cancle(Connection conn, String sno, String userNo) {
        System.out.println("cancle");
        System.out.println(sno);
        System.out.println(userNo);
        String sql = "DELETE ZZIM where user_no = ? and service_no = ?";
        
        PreparedStatement pstmt = null;
        int result = 0;
                
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            pstmt.setString(2, sno);
            
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

}
