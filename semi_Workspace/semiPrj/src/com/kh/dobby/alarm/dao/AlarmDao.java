package com.kh.dobby.alarm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.alarm.vo.AlarmVo;
import com.kh.dobby.common.JDBCTemplate;

public class AlarmDao {

    public List<AlarmVo> selectList(Connection conn, String userNo) {
        
        String sql = "SELECT ALARM_NO, USER_NO, CONTENT, MODIFY_DATE, CHECK_YN FROM ALARM WHERE USER_NO = ? AND CHECK_YN = 'N'";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<AlarmVo> list = new ArrayList<>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                AlarmVo vo = new AlarmVo();
                vo.setAlarmNo(rs.getString("ALARM_NO"));
                vo.setCheckYn(rs.getString("CHECK_YN"));
                vo.setContent(rs.getString("CONTENT"));
                vo.setModifyDate(rs.getString("MODIFY_DATE"));
                vo.setUserNo(rs.getString("USER_NO"));
                
                list.add(vo);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return list;
    }

    public int updateAlarm(Connection conn, String ano) {
        
        String sql = "UPDATE ALARM SET CHECK_YN = 'Y' WHERE ALARM_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ano);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

}
