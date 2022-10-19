package com.kh.dobby.reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.reservation.vo.ReservationVo;

public class ReservationDao {

    public int insertReservation(Connection conn, ReservationVo rv) {

        String sql = "INSERT INTO RESERVATION (RESERVATION_NO, SERVICE_NO, USER_NO, \"COMMENT\") VALUES (SEQ_RESERVATION_NO.NEXTVAL, ?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rv.getServiceNo());
            pstmt.setString(2, rv.getUserNo());
            pstmt.setString(3, rv.getComment());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public String getNo(Connection conn, ReservationVo rv) {
        
        String sql = "select RESERVATION_NO FROM RESERVATION WHERE USER_NO = ? ORDER BY RESERVATION_NO DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String rvNo = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rv.getUserNo());
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                rvNo = rs.getString("RESERVATION_NO");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return rvNo;
    }

    public int updateEstimate(Connection conn, String rno, String date) {
        
        String sql = "UPDATE RESERVATION SET ESTIMATE_DATE = ? WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, date);
            pstmt.setString(2, rno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public ReservationVo selectOne(Connection conn, String rno) {
        
        String sql = "select RESERVATION_NO,SERVICE_NO,USER_NO,RESERVATION_DATE,CANCEL_DATE,RESERVATION_AMOUNT,RESERVATION_YN,\"COMMENT\",RE_COMMENT,ESTIMATE_DATE,NAME FROM RESERVATION join \"USER\" USING(USER_NO) WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ReservationVo rv = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rno);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                rv = new ReservationVo();
                
                rv.setCancelDate(rs.getString("CANCEL_DATE"));
                rv.setComment(rs.getString("COMMENT"));
                rv.setEstimateDate(rs.getString("ESTIMATE_DATE"));
                rv.setReComment(rs.getString("RE_COMMENT"));
                rv.setReservation_no(rs.getString("RESERVATION_NO"));
                rv.setReservationAmount(rs.getString("RESERVATION_AMOUNT"));
                rv.setReservationDate(rs.getString("RESERVATION_DATE"));
                rv.setReservationYN(rs.getString("RESERVATION_YN"));
                rv.setServiceNo(rs.getString("SERVICE_NO"));
                rv.setUserName(rs.getString("NAME"));
                rv.setUserNo(rs.getString("USER_NO"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return rv;
    }

}
