package com.kh.dobby.reservation.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.reservation.dao.ReservationDao;
import com.kh.dobby.reservation.vo.ReservationVo;

public class ReservationService {
    
    ReservationDao dao = new ReservationDao();

    public String insertReservation(ReservationVo rv) {

        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.insertReservation(conn, rv);
        
        String rvNo = null;
        
        if(result==1) {
            rvNo = dao.getNo(conn, rv);
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return rvNo;
    }

    public ReservationVo setEstimate(String rno, String date) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.updateEstimate(conn, rno, date);
        
        ReservationVo rv = null;
        if(result==1) {
            rv = dao.selectOne(conn, rno);
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return rv;
    }

    public List<ReservationVo> selectList(String userNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<ReservationVo> list = dao.selectList(conn, userNo);
        
        JDBCTemplate.close(conn);
                
        return list;
    }

}
