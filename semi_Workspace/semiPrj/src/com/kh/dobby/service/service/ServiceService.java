package com.kh.dobby.service.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.service.dao.ServiceDao;
import com.kh.dobby.service.vo.CodeVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ServiceService {

    private final ServiceDao sd = new ServiceDao();

    // 서비스 등록
    public int regist(ServiceVo sv) {
        // 커넥션 준비
        Connection conn = JDBCTemplate.getConnection();

        // 서비스 인서트
        int result = sd.registService(conn, sv);

        // 첨부파일 insert(나중에 서비스 사진..들...)
//        int result2 = 1;
//        if(s_attachmentVo != null) {
//            result2 = sd.insertAttachment(conn, s_attachmentVo);
//            
//        }

        if (result == 1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);

        return result;
    }

    public List<ServiceVo> listService(PageVo pv, String stn) {

        Connection conn = JDBCTemplate.getConnection();

        List<ServiceVo> x = sd.listService(conn, pv, stn);

        JDBCTemplate.close(conn);

        return x;
    }

    public ServiceVo selectOne(String sno) {
        Connection conn = JDBCTemplate.getConnection();

        int result = 0;

        ServiceVo sv = null;

        sv = sd.selectOne(conn, sno);

        JDBCTemplate.close(conn);

        return sv;
    }

    public CodeVo changeCode(ServiceVo sv) {
        CodeVo cv = new CodeVo();
        
        switch(sv.getAreaNo_1()) {
            case 0:cv.setArea_1(null); break;
            case 1:cv.setArea_1("도봉구"); break;
            case 2:cv.setArea_1("노원구");break;
            case 3:cv.setArea_1("강북구");break;
            case 4:cv.setArea_1("은평구");break;
            case 5:cv.setArea_1("종로구");break;
            case 6:cv.setArea_1("성북구");break;
            case 7:cv.setArea_1("중랑구");break;
            case 8:cv.setArea_1("동대문구");break;
            case 9:cv.setArea_1("서대문구");break;
            case 10:cv.setArea_1("중구");break;
            case 11:cv.setArea_1("마포구");break;
            case 12:cv.setArea_1("용산구");break;
            case 13:cv.setArea_1("성동구");break;
            case 14:cv.setArea_1("광진구");break;
            case 15:cv.setArea_1("강서구");break;
            case 16:cv.setArea_1("양천구");break;
            case 17:cv.setArea_1("구로구");break;
            case 18:cv.setArea_1("영등포구");break;
            case 19:cv.setArea_1("금천구");break;
            case 20:cv.setArea_1("동작구");break;
            case 21:cv.setArea_1("관악구");break;
            case 22:cv.setArea_1("서초구");break;
            case 23:cv.setArea_1("강남구");break;
            case 24:cv.setArea_1("송파구");break;
            case 25:cv.setArea_1("강동구");break;
            default:cv.setArea_1(null);
        }
        switch(sv.getAreaNo_2()) {
            case 0:cv.setArea_2(null); break;
            case 1:cv.setArea_2("도봉구"); break;
            case 2:cv.setArea_2("노원구");break;
            case 3:cv.setArea_2("강북구");break;
            case 4:cv.setArea_2("은평구");break;
            case 5:cv.setArea_2("종로구");break;
            case 6:cv.setArea_2("성북구");break;
            case 7:cv.setArea_2("중랑구");break;
            case 8:cv.setArea_2("동대문구");break;
            case 9:cv.setArea_2("서대문구");break;
            case 10:cv.setArea_2("중구");break;
            case 11:cv.setArea_2("마포구");break;
            case 12:cv.setArea_2("용산구");break;
            case 13:cv.setArea_2("성동구");break;
            case 14:cv.setArea_2("광진구");break;
            case 15:cv.setArea_2("강서구");break;
            case 16:cv.setArea_2("양천구");break;
            case 17:cv.setArea_2("구로구");break;
            case 18:cv.setArea_2("영등포구");break;
            case 19:cv.setArea_2("금천구");break;
            case 20:cv.setArea_2("동작구");break;
            case 21:cv.setArea_2("관악구");break;
            case 22:cv.setArea_2("서초구");break;
            case 23:cv.setArea_2("강남구");break;
            case 24:cv.setArea_2("송파구");break;
            case 25:cv.setArea_2("강동구");break;
            default:cv.setArea_2(null);
        }
        switch(sv.getAreaNo_3()) {
            case 0:cv.setArea_3(null); break;
            case 1:cv.setArea_3("도봉구"); break;
            case 2:cv.setArea_3("노원구");break;
            case 3:cv.setArea_3("강북구");break;
            case 4:cv.setArea_3("은평구");break;
            case 5:cv.setArea_3("종로구");break;
            case 6:cv.setArea_3("성북구");break;
            case 7:cv.setArea_3("중랑구");break;
            case 8:cv.setArea_3("동대문구");break;
            case 9:cv.setArea_3("서대문구");break;
            case 10:cv.setArea_3("중구");break;
            case 11:cv.setArea_3("마포구");break;
            case 12:cv.setArea_3("용산구");break;
            case 13:cv.setArea_3("성동구");break;
            case 14:cv.setArea_3("광진구");break;
            case 15:cv.setArea_3("강서구");break;
            case 16:cv.setArea_3("양천구");break;
            case 17:cv.setArea_3("구로구");break;
            case 18:cv.setArea_3("영등포구");break;
            case 19:cv.setArea_3("금천구");break;
            case 20:cv.setArea_3("동작구");break;
            case 21:cv.setArea_3("관악구");break;
            case 22:cv.setArea_3("서초구");break;
            case 23:cv.setArea_3("강남구");break;
            case 24:cv.setArea_3("송파구");break;
            case 25:cv.setArea_3("강동구");break;
            default:cv.setArea_3(null);
        }
        switch(sv.getAreaNo_4()) {
            case 0:cv.setArea_4(null); break;
            case 1:cv.setArea_4("도봉구"); break;
            case 2:cv.setArea_4("노원구");break;
            case 3:cv.setArea_4("강북구");break;
            case 4:cv.setArea_4("은평구");break;
            case 5:cv.setArea_4("종로구");break;
            case 6:cv.setArea_4("성북구");break;
            case 7:cv.setArea_4("중랑구");break;
            case 8:cv.setArea_4("동대문구");break;
            case 9:cv.setArea_4("서대문구");break;
            case 10:cv.setArea_4("중구");break;
            case 11:cv.setArea_4("마포구");break;
            case 12:cv.setArea_4("용산구");break;
            case 13:cv.setArea_4("성동구");break;
            case 14:cv.setArea_4("광진구");break;
            case 15:cv.setArea_4("강서구");break;
            case 16:cv.setArea_4("양천구");break;
            case 17:cv.setArea_4("구로구");break;
            case 18:cv.setArea_4("영등포구");break;
            case 19:cv.setArea_4("금천구");break;
            case 20:cv.setArea_4("동작구");break;
            case 21:cv.setArea_4("관악구");break;
            case 22:cv.setArea_4("서초구");break;
            case 23:cv.setArea_4("강남구");break;
            case 24:cv.setArea_4("송파구");break;
            case 25:cv.setArea_4("강동구");break;
            default:cv.setArea_4(null);
        }
        switch(sv.getAreaNo_5()) {
            case 0:cv.setArea_5(null); break;
            case 1:cv.setArea_5("도봉구"); break;
            case 2:cv.setArea_5("노원구");break;
            case 3:cv.setArea_5("강북구");break;
            case 4:cv.setArea_5("은평구");break;
            case 5:cv.setArea_5("종로구");break;
            case 6:cv.setArea_5("성북구");break;
            case 7:cv.setArea_5("중랑구");break;
            case 8:cv.setArea_5("동대문구");break;
            case 9:cv.setArea_5("서대문구");break;
            case 10:cv.setArea_5("중구");break;
            case 11:cv.setArea_5("마포구");break;
            case 12:cv.setArea_5("용산구");break;
            case 13:cv.setArea_5("성동구");break;
            case 14:cv.setArea_5("광진구");break;
            case 15:cv.setArea_5("강서구");break;
            case 16:cv.setArea_5("양천구");break;
            case 17:cv.setArea_5("구로구");break;
            case 18:cv.setArea_5("영등포구");break;
            case 19:cv.setArea_5("금천구");break;
            case 20:cv.setArea_5("동작구");break;
            case 21:cv.setArea_5("관악구");break;
            case 22:cv.setArea_5("서초구");break;
            case 23:cv.setArea_5("강남구");break;
            case 24:cv.setArea_5("송파구");break;
            case 25:cv.setArea_5("강동구");break;
            default:cv.setArea_5(null);
        }
        
        switch(sv.getpTypeNo_1()) {
            case 2:cv.setPayment_1("계좌이체");break;
            case 5:cv.setPayment_1("카드");break;
            case 6:cv.setPayment_1("현금");break;
        }
        switch(sv.getpTypeNo_2()) {
            case 2:cv.setPayment_2("계좌이체");break;
            case 5:cv.setPayment_2("카드");break;
            case 6:cv.setPayment_2("현금");break;
        }
        switch(sv.getpTypeNo_3()) {
            case 2:cv.setPayment_3("계좌이체");break;
            case 5:cv.setPayment_3("카드");break;
            case 6:cv.setPayment_3("현금");break;
        }
        return cv;
    }
    public void changeAreaCode(int AreaNo) {
        
        
    }
    
}
