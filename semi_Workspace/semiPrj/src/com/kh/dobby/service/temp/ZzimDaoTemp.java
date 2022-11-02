package com.kh.dobby.service.temp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.dobby.common.JDBCTemplate;

public class ZzimDaoTemp {

    public ZzimVoTemp checkZzim(Connection conn, String sno, String uno) {

        String Sql = "SELECT USER_NO, SERVICE_NO FROM ZZIM WHERE SERVICE_NO = ? AND USER_NO = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ZzimVoTemp zzim = new ZzimVoTemp();
        
        try {
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1, sno);
            pstmt.setString(2, uno);
            
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
                zzim.setServiceNo(rs.getString("SERVICE_NO"));
                zzim.setUserNo(rs.getString("USER_NO"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        
        return zzim;
    }

}
