package com.kh.dobby.reservation.service;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

        if (result == 1) {
            rvNo = dao.getNo(conn, rv);
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return rvNo;
    }

    public ReservationVo setEstimate(String rno, String date) {

        Connection conn = JDBCTemplate.getConnection();

        int result = dao.updateEstimate(conn, rno, date);

        ReservationVo rv = null;
        if (result == 1) {
            rv = dao.selectOne(conn, rno);
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return rv;
    }
    
    public ReservationVo selectOne(String rno) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        ReservationVo rv = dao.selectOne(conn, rno);
        
        JDBCTemplate.close(conn);
        
        return rv;
    }

    public List<ReservationVo> selectList(String userNo) {

        Connection conn = JDBCTemplate.getConnection();

        List<ReservationVo> list = dao.selectList(conn, userNo);

        Date today = new Date();

        for (ReservationVo vo : list) {

            String from = vo.getReservationDate();
            SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date rDay = null;

            try {
                rDay = transFormat.parse(from);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if(vo.getCancelDate()==null) {
                
                if (vo.getReservationYN() == "Y") {
                    if (vo.getReservationAmount() != null) {// 예약완료
                        if (vo.getPayNo() != null) {// 결제정보있음
                            if (today.compareTo(rDay) < 0) {
                                vo.setStatus("SC");
                            } else {
                                // 서비스대기중 SW
                                vo.setStatus("SW");
                            }
                        } else {
                            // 결제대기중 PW
                            vo.setStatus("PW");
                        }
                    } else {
                        // 견적승인은 되었지만 견적을 아직 안받음 견적대기중 EW
                        vo.setStatus("EW");
                    }
                } else {
                    if (vo.getReservationAmount() != null) {
                        // 견적필요없고 예약승인 기다리는중 RAW
                        vo.setStatus("RAW");
                    } else {
                        // 견적필요해서 견적승인 기다리는중 EAW
                        vo.setStatus("EAW");
                    }
                }
                
            }else {
                vo.setStatus("C");
            }

        }

        JDBCTemplate.close(conn);

        return list;
    }

    public int reservationResult(String rno, String yn) {
        
        Connection conn = JDBCTemplate.getConnection();

        int result = dao.updateReservationYN(conn, rno, yn);

        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return result;
    }

    public int updateRecomment(String rno, String recomment) {

        Connection conn = JDBCTemplate.getConnection();

        int result = dao.updateRecomment(conn, rno, recomment);

        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return result;
    }

    public int updateComment(String rno, String comment) {

        Connection conn = JDBCTemplate.getConnection();

        int result = dao.updateComment(conn, rno, comment);

        ReservationVo rv = null;
        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return result;
    }

    public int updateAmount(String rno, int amount) {

        Connection conn = JDBCTemplate.getConnection();

        int result = dao.updateAmount(conn, rno, amount);

        ReservationVo rv = null;
        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }

        JDBCTemplate.close(conn);

        return result;
    }

}
