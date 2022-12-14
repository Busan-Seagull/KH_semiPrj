package com.kh.dobby.reservation.service;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;
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

    public List<ReservationVo> selectList(MemberVo loginMember) {

        Connection conn = JDBCTemplate.getConnection();

        List<ReservationVo> list = dao.selectList(conn, loginMember);

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
                
                if ("Y".equals(vo.getReservationYN())) {
                    if (vo.getReservationAmount() != null) {// ????????????
                        if (vo.getPayNo() != null) {// ??????????????????
                            if (today.compareTo(rDay) < 0) {
                                vo.setStatus("SC");
                            } else {
                                // ?????????????????? SW
                                vo.setStatus("SW");
                            }
                        } else {
                            // ??????????????? PW
                            vo.setStatus("PW");
                        }
                    } else {
                        // ??????????????? ???????????? ????????? ?????? ????????? ??????????????? EW
                        vo.setStatus("EW");
                    }
                } else {
                    if (vo.getReservationAmount() != null) {
                        // ?????????????????? ???????????? ??????????????? RAW
                        vo.setStatus("RAW");
                    } else {
                        // ?????????????????? ???????????? ??????????????? EAW
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
