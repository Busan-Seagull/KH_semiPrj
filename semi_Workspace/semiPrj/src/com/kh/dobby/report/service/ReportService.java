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
    
 

    public int write(ReportVo vo) {

        
        Connection conn = getConnection();
        
        int result = dao.insertReport(conn,vo);
        
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



    public ReportVo selectOne(String postNo) {
        Connection conn = getConnection();
        ReportVo vo = dao.selectOne(conn, postNo);
        
        close(conn);
        
        return vo;
    
    }



    public int delete(String postNo) {
        
        Connection conn = getConnection();
        
        int result = dao.delete(conn, postNo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        return result ;

        
    }



    public int approval(String postNo) {
        
        Connection conn = getConnection();
        
        int result = dao.approval(conn, postNo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result;

    
    }



    public int returnReport(String postNo) {

        Connection conn = getConnection();
        
        int result2 = dao.returnReport(conn, postNo);
        
        if(result2 == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result2;
    }



    public int edit(ReportVo vo) {
        
        Connection conn = getConnection();
        
        int result = dao.editOneByNo(conn, vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        
        close(conn);
        return result;
    
    
    }



    public int writeReply(ReportVo vo) {
        
        Connection conn = getConnection();
        
        int result = dao.updateReply(conn,vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result;
        
        
    }



    public List<ReportVo> selectReportList(String writer) {
        
        Connection conn = getConnection();
        List<ReportVo> voList = dao.selectReportList(conn,writer);
        
        close(conn);
        
        return voList;
        
    }



    public ReportVo selectReportOne(String postNo) {
        
        Connection conn = getConnection();
        ReportVo vo = dao.selectReportOne(conn,postNo);
        
        close(conn);
        return vo;
    }
    
}
