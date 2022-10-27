package com.kh.dobby.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.common.JDBCTemplate;

public class StatisticsDao {

    public int getUserCount(Connection conn, String sDate, String eDate, int right) {
        
        String sql = "SELECT COUNT(*) FROM \"USER\" WHERE ENROLL_DATE BETWEEN ? AND ? AND RIGHT_NO = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int cout = -1;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sDate);
            pstmt.setString(2, eDate);
            pstmt.setInt(3, right);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                cout = rs.getInt("COUNT(*)");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return cout;
    }

    public int getServiceCount(Connection conn, String sDate, String eDate) {

        String sql = "SELECT COUNT(*) FROM RESERVATION R JOIN PAYMENT P USING(RESERVATION_NO) WHERE PAYMENT_DATE BETWEEN ? AND ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int cout = -1;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sDate);
            pstmt.setString(2, eDate);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                cout = rs.getInt("COUNT(*)");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return cout;
    }

}
