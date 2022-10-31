package com.kh.dobby.pay.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.pay.dao.PayDao;
import com.kh.dobby.payVo.PayVo;

public class PayService {

    private final PayDao pd = new PayDao();

    // 결제 정보 인서트
    public int insert(PayVo pv) {
        Connection conn = JDBCTemplate.getConnection();

        int result = pd.insert(conn, pv);

        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);

        return result;
    }

    public PayVo selectOne(String reservationNo) {
        Connection conn = JDBCTemplate.getConnection();

        PayVo pv = pd.selectone(conn, reservationNo);

        switch (pv.getPaymentType()) {
            case "1":
                pv.setPaymentType("신용카드");
                break;
            case "2":
                pv.setPaymentType("게좌이체");
                break;
            case "3":
                pv.setPaymentType("네이버페이");
                break;
            case "4":
                pv.setPaymentType("카카오페이");
                break;
            default: pv.setPaymentType(null);
        }

        JDBCTemplate.close(conn);

        return pv;
    }
    //유저 번호로 결제내역 받아오기
    public List<PayVo> listHistory(int userNo) {
        Connection conn = JDBCTemplate.getConnection();
        
        List<PayVo> x = pd.listHisory(conn, userNo);
        
        JDBCTemplate.close(conn);
        
        return x;
    }

}
