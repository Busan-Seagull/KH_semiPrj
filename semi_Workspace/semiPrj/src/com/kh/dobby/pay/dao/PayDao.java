package com.kh.dobby.pay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.payVo.PayVo;

public class PayDao {

    public int insert(Connection conn, PayVo pv) {
        LocalDate now = LocalDate.now();
        String year = now.getYear()+"";
        String monthValue = now.getMonthValue()+"";
        String dayOfMonth = now.getDayOfMonth()+"";
        String paymentNo = year+monthValue+dayOfMonth+(int)(Math.random()*100000);
        
        String sql = "INSERT INTO PAYMENT(PAYMENT_NO, RESERVATION_NO, PAYMENT_TYPE_NO, PAYMENT_DATE, POINT, REQUEST)"
                + " VALUES(?, ?, ?, SYSDATE, ?, ?)";

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setDouble(1, Double.parseDouble(paymentNo));
            pstmt.setInt(2, Integer.parseInt(pv.getReservationNo()));
            pstmt.setInt(3, Integer.parseInt(pv.getPaymentType()));
            if(pv.getPoint()==null) {
            pstmt.setInt(4, 0);   
            }else {
            pstmt.setInt(4, Integer.parseInt(pv.getPoint()));
            }
            pstmt.setString(5, pv.getRequest());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }
    //예약번호로 받아오기
    public PayVo selectone(Connection conn, String reservationNo) {
        
        String sql = "SELECT PAYMENT_NO, RESERVATION_NO, PAYMENT_TYPE_NO, PAYMENT_DATE, POINT, CANCEL_DATE, REQUEST FROM PAYMENT WHERE RESERVATION_NO=?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        PayVo pv = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reservationNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                pv = new PayVo();
                pv.setPaymentNo(rs.getString("PAYMENT_NO"));
                pv.setReservationNo(rs.getString("RESERVATION_NO"));
                pv.setPaymentType(rs.getString("PAYMENT_TYPE_NO"));
                pv.setRequest(rs.getString("REQUEST"));
                pv.setPaymentDate(rs.getString("PAYMENT_DATE"));
                pv.setCancelDate(rs.getString("CANCEL_DATE"));
                pv.setPoint(rs.getString("POINT"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return pv;
    }
    //결제 번호로 정보 받아오기
    public PayVo selectoneByPayNo(Connection conn, String payNo) {
        String sql = "SELECT PAYMENT_NO, RESERVATION_NO, PAYMENT_TYPE_NO, PAYMENT_DATE, POINT, CANCEL_DATE, REQUEST FROM PAYMENT WHERE PAYMENT_NO=?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        PayVo pv = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, payNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                pv = new PayVo();
                pv.setPaymentNo(rs.getString("PAYMENT_NO"));
                pv.setReservationNo(rs.getString("RESERVATION_NO"));
                pv.setPaymentType(rs.getString("PAYMENT_TYPE_NO"));
                pv.setRequest(rs.getString("REQUEST"));
                pv.setPaymentDate(rs.getString("PAYMENT_DATE"));
                pv.setCancelDate(rs.getString("CANCEL_DATE"));
                pv.setPoint(rs.getString("POINT"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        return pv;
    }
    
    

    //유저 번호로 결제정보(간단) 리스트 들고오기
    public List<PayVo> listHisory(Connection conn, int userNo) {
        //TODO
        String sql = "SELECT U.USER_NO, R.RESERVATION_NO, R.RESERVATION_AMOUNT, P.PAYMENT_NO, P.PAYMENT_DATE,S.IMAGE_LINK, S.SERVICE_NO, S.SERVICE_TITLE FROM \"USER\" U JOIN RESERVATION R ON U.USER_NO = R.USER_NO JOIN PAYMENT P ON R.RESERVATION_NO = P.RESERVATION_NO JOIN SERVICE_INFO S ON S.SERVICE_NO = R.SERVICE_NO WHERE U.USER_NO = ? ORDER BY P.PAYMENT_DATE DESC";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PayVo> pvList = new ArrayList<PayVo>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                
                //sql채워주고 객체 담아주기..
                
                PayVo pv = new PayVo();
                pv.setReservationNo(rs.getString("RESERVATION_NO"));
                pv.setServiceTitle(rs.getString("SERVICE_TITLE"));
                pv.setServiceCharge(rs.getString("RESERVATION_AMOUNT"));
                pv.setPaymentNo(rs.getString("PAYMENT_NO"));
                pv.setPaymentDate(rs.getString("PAYMENT_DATE"));
                pv.setProfileImg(rs.getString("IMAGE_LINK"));
                
                //리스트에 객체추가
                pvList.add(pv);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return pvList;
    }

    

    
    
}




















