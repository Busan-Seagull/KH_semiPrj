package com.kh.dobby.point.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.point.vo.PointVo;

public class PointDao {

    public List<PointVo> getList(Connection conn, String userNo) {
        
        String sql = "SELECT POINT, \"DATE\", SCORE, \"TYPE\", USER_NO FROM ( SELECT POINT, \"DATE\", SCORE, '이벤트' AS TYPE, USER_NO FROM EVENTHISTORY ) UNION SELECT POINT, \"DATE\", SCORE, \"TYPE\", USER_NO FROM ( SELECT POINT, PAYMENT_DATE AS \"DATE\", RESERVATION_AMOUNT AS SCORE, '결제' AS TYPE, USER_NO FROM PAYMENT JOIN RESERVATION USING(RESERVATION_NO) ) WHERE USER_NO = ? ORDER BY \"DATE\" DESC";
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        
        List<PointVo> list = new ArrayList<PointVo>();
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                PointVo vo = new PointVo();
                vo.setDate(rs.getString("DATE"));
                vo.setPoint(rs.getString("POINT"));
                vo.setScore(rs.getString("SCORE"));
                vo.setType(rs.getString("TYPE"));
                vo.setUserNo(rs.getString("USER_NO"));
                
                list.add(vo);
 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
public int getSumPoinst(Connection conn, String userNo) {
        
        String sql = "SELECT SUM(POINT) FROM ( SELECT POINT, \"DATE\", SCORE, \"TYPE\", USER_NO FROM ( SELECT POINT, \"DATE\", SCORE, '이벤트' AS TYPE, USER_NO FROM EVENTHISTORY ) UNION SELECT POINT, \"DATE\", SCORE, \"TYPE\", USER_NO FROM ( SELECT POINT, PAYMENT_DATE AS \"DATE\", RESERVATION_AMOUNT AS SCORE, '결제' AS TYPE, USER_NO FROM PAYMENT JOIN RESERVATION USING(RESERVATION_NO) ) WHERE USER_NO = ? )";
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        
        int result = 0;
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                result = rs.getInt("SUM(POINT)");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

}
