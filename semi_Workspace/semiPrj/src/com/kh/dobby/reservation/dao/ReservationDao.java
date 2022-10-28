package com.kh.dobby.reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.reservation.vo.ReservationVo;

public class ReservationDao {

    public int insertReservation(Connection conn, ReservationVo rv) {

        String sql = "INSERT INTO RESERVATION (RESERVATION_NO, SERVICE_NO, RESERVATION_AMOUNT, USER_NO, \"COMMENT\") VALUES (SEQ_RESERVATION_NO.NEXTVAL,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rv.getServiceNo());
            pstmt.setString(2, rv.getReservationAmount());
            pstmt.setString(3, rv.getUserNo());
            pstmt.setString(4, rv.getComment());
            
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
            
        String sql = "SELECT\r\n"
                + "    RESERVATION_NO,\r\n"
                + "    SERVICE_NO,\r\n"
                + "    USER_NO,\r\n"
                + "    RESERVATION_DATE,\r\n"
                + "    CANCEL_DATE,\r\n"
                + "    RESERVATION_AMOUNT,\r\n"
                + "    RESERVATION_YN,\r\n"
                + "    \"COMMENT\",\r\n"
                + "    RE_COMMENT,\r\n"
                + "    ESTIMATE_DATE,\r\n"
                + "    NICK,\r\n"
                + "    ADDRESS,\r\n"
                + "    D_NAME,\r\n"
                + "    S_NAME,\r\n"
                + "    SERVICE_TITLE,\r\n"
                + "    CHARGE,\r\n"
                + "    CHARGE_UNIT,\r\n"
                + "    D_NO\r\n,"
                + "    IMG_LINK\r\n"
                + "FROM RESERVATION \r\n"
                + "JOIN \"USER\" USING(USER_NO) \r\n"
                + "JOIN \r\n"
                + "(\r\n"
                + "    SELECT\r\n"
                + "    USER_NO AS D_NO, U.NICK AS D_NAME, S.NAME AS S_NAME, SERVICE_TITLE ,CHARGE, IMG_LINK, CHARGE_UNIT, SERVICE_NO\r\n"
                + "    FROM SERVICE_INFO\r\n"
                + "    JOIN \"USER\" U USING(USER_NO)\r\n"
                + "    LEFT JOIN DOBBY D USING(USER_NO)\r\n"
                + "    JOIN \"SERVICE\" S USING(SERVICE_TYPE_NO) \r\n"
                + "    JOIN CHARGE_UNIT USING(CHARGE_UNIT_NO)\r\n"
                + ") USING(SERVICE_NO)\r\n"
                + "WHERE RESERVATION_NO = ?\r\n";
        
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
                rv.setUserName(rs.getString("NICK"));
                rv.setUserNo(rs.getString("USER_NO"));
                rv.setsTitle(rs.getString("SERVICE_TITLE"));
                rv.setsName(rs.getString("S_NAME"));
                rv.setdName(rs.getString("D_NAME"));
                rv.setCharge(rs.getString("CHARGE"));
                rv.setChargeUnit(rs.getString("CHARGE_UNIT"));
                rv.setdNo(rs.getString("D_NO"));
                rv.setAddress(rs.getString("ADDRESS"));
                rv.setdProfil(rs.getString("IMG_LINK"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return rv;
    }

    public List<ReservationVo> selectList(Connection conn, MemberVo loginMember) {

        String sqlPlus = "";
        if("1".equals(loginMember.getRightNo())) {
            sqlPlus = "USER_NO";
        }else if("2".equals(loginMember.getRightNo())) {
            sqlPlus = "D_NO";
        }
        
        String sql = "SELECT\r\n"
                + "    RESERVATION_NO,\r\n"
                + "    SERVICE_NO,\r\n"
                + "    USER_NO,\r\n"
                + "    RESERVATION_DATE,\r\n"
                + "    CANCEL_DATE,\r\n"
                + "    RESERVATION_AMOUNT,\r\n"
                + "    RESERVATION_YN,\r\n"
                + "    \"COMMENT\",\r\n"
                + "    RE_COMMENT,\r\n"
                + "    ESTIMATE_DATE,\r\n"
                + "    NICK,\r\n"
                + "    ADDRESS,\r\n"
                + "    D_NAME,\r\n"
                + "    S_NAME,\r\n"
                + "    SERVICE_TITLE,\r\n"
                + "    CHARGE,\r\n"
                + "    CHARGE_UNIT,\r\n"
                + "    D_NO\r\n"
                + "FROM RESERVATION \r\n"
                + "JOIN \"USER\" USING(USER_NO) \r\n"
                + "JOIN \r\n"
                + "(\r\n"
                + "    SELECT\r\n"
                + "    USER_NO AS D_NO, U.NICK AS D_NAME, S.NAME AS S_NAME, SERVICE_TITLE ,CHARGE, CHARGE_UNIT, SERVICE_NO\r\n"
                + "    FROM SERVICE_INFO\r\n"
                + "    JOIN \"USER\" U USING(USER_NO)\r\n"
                + "    JOIN \"SERVICE\" S USING(SERVICE_TYPE_NO) \r\n"
                + "    JOIN CHARGE_UNIT USING(CHARGE_UNIT_NO)\r\n"
                + ") USING(SERVICE_NO)\r\n"
                + "WHERE "+sqlPlus+" = ?\r\n"
                + "ORDER BY RESERVATION_DATE DESC";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<ReservationVo> list = new ArrayList<>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, loginMember.getUserNo());
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                ReservationVo rv = new ReservationVo();
                
                rv.setCancelDate(rs.getString("CANCEL_DATE"));
                rv.setComment(rs.getString("COMMENT"));
                rv.setEstimateDate(rs.getString("ESTIMATE_DATE"));
                rv.setReComment(rs.getString("RE_COMMENT"));
                rv.setReservation_no(rs.getString("RESERVATION_NO"));
                rv.setReservationAmount(rs.getString("RESERVATION_AMOUNT"));
                rv.setReservationDate(rs.getString("RESERVATION_DATE"));
                rv.setReservationYN(rs.getString("RESERVATION_YN"));
                rv.setServiceNo(rs.getString("SERVICE_NO"));
                rv.setUserName(rs.getString("NICK"));
                rv.setUserNo(rs.getString("USER_NO"));
                rv.setsTitle(rs.getString("SERVICE_TITLE"));
                rv.setsName(rs.getString("S_NAME"));
                rv.setdName(rs.getString("D_NAME"));
                rv.setCharge(rs.getString("CHARGE"));
                rv.setChargeUnit(rs.getString("CHARGE_UNIT"));
                rv.setdNo(rs.getString("D_NO"));
                rv.setAddress(rs.getString("ADDRESS"));
                
                list.add(rv);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return list;
    }

    public int updateReservationYN(Connection conn, String rno, String yn) {

        String cancel = "";
        if("N".equals(yn)) {
            cancel = "CANCEL_DATE = SYSDATE,";
        }
        
        String sql = "UPDATE RESERVATION SET "+cancel+" RESERVATION_YN = ? WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, yn);
            pstmt.setString(2, rno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
        
    }

    public int updateRecomment(Connection conn, String rno, String recomment) {

        String sql = "UPDATE RESERVATION SET RE_COMMENT = ? WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, recomment);
            pstmt.setString(2, rno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public int updateComment(Connection conn, String rno, String comment) {

        String sql = "UPDATE RESERVATION SET \"COMMENT\" = ? WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, comment);
            pstmt.setString(2, rno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public int updateAmount(Connection conn, String rno, int amount) {

        String sql = "UPDATE RESERVATION SET RESERVATION_AMOUNT = ? WHERE RESERVATION_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, amount);
            pstmt.setString(2, rno);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

}
