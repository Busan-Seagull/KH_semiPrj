package com.kh.dobby.report.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import static com.kh.dobby.common.JDBCTemplate.*;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ReportDao {

    public int insertReport(Connection conn,ReportVo vo) {

    
        String sql = "INSERT INTO REPORT (POST_NO,USER_NO,SERVICE_NO,WRITER,TITLE,CONTENT) VALUES (SEQ_REPORT_NO.NEXTVAL,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getUserNo());
            pstmt.setString(2, vo.getServiceNo());
            pstmt.setString(3,vo.getWriter());
            pstmt.setString(4, vo.getTitle());
            pstmt.setString(5, vo.getContent());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        
        return result;
        
    
    }

    public List<ReportVo> selectList(Connection conn, PageVo pv) {
        
        String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM,T.* FROM ( SELECT R.POST_NO ,U.USER_NO ,S.SERVICE_NO ,R.TITLE , R.CONTENT ,R.WRITE_TIME ,R.DELETE_YN, R.MODIFY_DATE ,R.HANDLE_REPORT_YN ,R.REPORT_COMMENT ,U.NICK AS WRITER FROM REPORT R JOIN \"USER\" U ON R.WRITER = U.USER_NO JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO WHERE R.DELETE_YN = 'N' ORDER BY R.POST_NO DESC )T ) WHERE RNUM BETWEEN ? AND ? ";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ReportVo> voList = new ArrayList<ReportVo>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1 ;
            int end = start + pv.getBoardLimit() - 1;
            
            pstmt.setInt(1,start);
            pstmt.setInt(2,end);
 
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                Timestamp modifyDate = rs.getTimestamp("MODIFY_DATE");
                String writer = rs.getString("WRITER");
                
                
                ReportVo vo = new ReportVo();
                vo.setPostNo(postNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setWriter(writer);
               
                
                voList.add(vo);
            }
             } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
    
        return voList;
    
        
        
    }

    public ReportVo selectOne(Connection conn, String postNo) {
        String sql = "SELECT R.POST_NO ,U.USER_NO ,S.SERVICE_NO ,R.TITLE, R.CONTENT ,R.WRITE_TIME ,R.DELETE_YN ,R.MODIFY_DATE ,R.HANDLE_REPORT_YN,U.NICK AS WRITER FROM REPORT R JOIN \"USER\" U ON R.WRITER = U.USER_NO JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO WHERE R.POST_NO = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs =  null;
        ReportVo vo = null;
        
        
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, postNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String postNO = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String serviceNo = rs.getString("SERVICE_NO");
                String writer = rs.getString("WRITER");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                Timestamp modifyDate = rs.getTimestamp("MODIFY_DATE");
                String handleReportYn = rs.getString("HANDLE_REPORT_YN");
                
                
                vo = new ReportVo();
                vo.setPostNo(postNO);
                vo.setUserNo(userNo);
                vo.setServiceNo(serviceNo);
                vo.setWriter(writer);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setHandleReportYn(handleReportYn);
               
                
            }

            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        
        return vo;
        
        
    }

    public int delete(Connection conn, String postNo) {
        
        String sql = "UPDATE REPORT SET DELETE_YN = 'Y' WHERE POST_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, postNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
        
    }

    public int approval(Connection conn, String postNo) {

        String sql = "UPDATE REPORT SET HANDLE_REPORT_YN = 'Y' WHERE POST_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, postNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    
    
    }

    public int returnReport(Connection conn, String postNo) {
        
        String sql = "UPDATE REPORT SET HANDLE_REPORT_YN ='N' WHERE POST_NO = ?";
        PreparedStatement pstmt = null;
        int result2 = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, postNo);
            
            result2 = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result2;
        
    }

    public int editOneByNo(Connection conn, ReportVo vo) {

        String sql = "UPDATE REPORT SET USER_NO = ? , SERVICE_NO = ? , TITLE = ? , CONTENT = ? WHERE POST_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1,vo.getUserNo());
            pstmt.setString(2, vo.getServiceNo());
            pstmt.setString(3, vo.getTitle());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getPostNo());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        
        return result;
    
    }

    public int updateReply(Connection conn, ReportVo vo) {
        String sql = "UPDATE REPORT SET REPORT_COMMENT = '?' WHERE POST_NO = ?";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getReportComment());
            pstmt.setString(2, vo.getPostNo());
          
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        
        return result;
        
    }

    public ReportVo selectReportList(Connection conn, String writer) {

        String sql = "SELECT R.POST_NO ,U.USER_NO ,S.SERVICE_NO ,R.TITLE , R.CONTENT ,R.WRITE_TIME ,R.DELETE_YN, R.MODIFY_DATE ,R.HANDLE_REPORT_YN ,R.REPORT_COMMENT ,U.NICK AS WRITER FROM REPORT R JOIN \"USER\" U ON R.WRITER = U.USER_NO JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO WHERE R.DELETE_YN = 'N'AND U.NICK=? ORDER BY R.POST_NO DESC";
        
        PreparedStatement pstmt =  null;
        ResultSet rs = null;
        ReportVo vo = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,writer);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String postNO = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String serviceNo = rs.getString("SERVICE_NO");
                String writer1 = rs.getString("WRITER");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                Timestamp modifyDate = rs.getTimestamp("MODIFY_DATE");
                String handleReportYn = rs.getString("HANDLE_REPORT_YN");
                
                
                vo = new ReportVo();
                vo.setPostNo(postNO);
                vo.setUserNo(userNo);
                vo.setServiceNo(serviceNo);
                vo.setWriter(writer1);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setHandleReportYn(handleReportYn);
                
               
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        
        return vo;
    
        
    }

    public ReportVo selectReportOne(Connection conn, String postNo) {

    
        String sql = "SELECT R.POST_NO ,U.USER_NO ,S.SERVICE_NO ,R.TITLE ,R.CONTENT, R.WRITE_TIME ,R.DELETE_YN,R.MODIFY_DATE ,R.HANDLE_REPORT_YN,U.NICK AS WRITER FROM REPORT R JOIN \"USER\" U ON R.WRITER = U.USER_NO JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO WHERE R.POST_NO = ? ";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReportVo vo = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, postNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String postNO = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String serviceNo = rs.getString("SERVICE_NO");
                String writer1 = rs.getString("WRITER");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                Timestamp modifyDate = rs.getTimestamp("MODIFY_DATE");
                String handleReportYn = rs.getString("HANDLE_REPORT_YN");
                
                
                vo = new ReportVo();
                vo.setPostNo(postNO);
                vo.setUserNo(userNo);
                vo.setServiceNo(serviceNo);
                vo.setWriter(writer1);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setHandleReportYn(handleReportYn);
                
               
            }
            
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        
        return vo;
    
    
    }     
   
}
