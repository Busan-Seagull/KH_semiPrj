package com.kh.dobby.report.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.dobby.common.JDBCTemplate.*;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.report.dao.ReportDao;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ReportService {
    
    private final ReportDao dao = new ReportDao();
    
 

    public int write(MemberVo memberVo, ServiceVo serviceVo, ReportVo vo) {

        
        Connection conn = getConnection();
        
        int result = dao.insertReport(conn,memberVo,serviceVo,vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result;
        
    
    }



    public List<ReportVo> selectList(PageVo pv) {

    Connection conn = getConnection();
    List<ReportVo> x = dao.selectList(conn, pv);
    close(conn);
    return x;
    
    
    }
    
}
