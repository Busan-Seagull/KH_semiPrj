package com.kh.dobby.request.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.request.vo.RequestVo;

public class RequestDao {

    public int insertBoard(Connection conn, RequestVo vo) {

        String sql = "INSERT INTO QUESTION ( POST_NO, USER_NO, TITLE, CONTENT, WRITE_TIME, DELETE_YN, MODIFY_DATE, ADMIN_NO, REPEAT_REPORT,"
                + " REPEAT_CONTENT, REPEAT_TIME, REPEAT_MODIFY_DATE, REPEAT_DELETE_YN) "
                + "VALUES ( SEQ_QUESTION_NO.NEXTVAL , ? , ? , ? , SYSDATE , 'N' , SYSDATE , '3' , 'N' , '' , SYSDATE , SYSDATE , '' )";
        
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getUserNo());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getContent());
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    public List<RequestVo> selectList(Connection conn) {
        
        String sql = "SELECT *  FROM QUESTION WHERE DELETE_YN='N'";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<RequestVo> voList = new ArrayList<RequestVo>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            /*페이지 내용은 이 안에*/
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                String writeTime = rs.getString("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                String modifyDate = rs.getString("MODIFY_DATE");
                String adminNo = rs.getString("ADMIN_NO");
                String repeatReport = rs.getString("REPEAT_REPORT");
                String repeatContent = rs.getString("REPEAT_CONTENT");
                String repeatTime = rs.getString("REPEAT_TIME");
                String repeatModifyDate = rs.getString("REPEAT_MODIFY_DATE");
                String repeatDeleteYn = rs.getString("REPEAT_DELETE_YN");
                
                RequestVo vo = new RequestVo();
                vo.setPostNo(postNo);
                vo.setUserNo(userNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setAdminNo(adminNo);
                vo.setRepeatReport(repeatReport);
                vo.setRepeatContent(repeatContent);
                vo.setRepeatTime(repeatTime);
                vo.setRepeatModifyDate(repeatModifyDate);
                vo.setRepeatDeleteYn(repeatDeleteYn);
                
                
                voList.add(vo);
                
                System.out.println(vo);
            };
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return voList;
        
        
    }

    public int selectCount(Connection conn) {
        //SQL
        
        String sql = "SELECT COUNT(*) AS CNT FROM QUESTION WHERE DELETE_YN='N'";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result=rs.getInt("CNT");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    public int selectOne(Connection conn, String bno) {
        
        String sql = "SELECT *  FROM QUESTION WHERE DELETE_YN='N' AND POST_NO=?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RequestVo vo = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            /*페이지 내용은 이 안에*/
            pstmt.setString(1, bno);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                String writeTime = rs.getString("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                String modifyDate = rs.getString("MODIFY_DATE");
                String adminNo = rs.getString("ADMIN_NO");
                String repeatReport = rs.getString("REPEAT_REPORT");
                String repeatContent = rs.getString("REPEAT_CONTENT");
                String repeatTime = rs.getString("REPEAT_TIME");
                String repeatModifyDate = rs.getString("REPEAT_MODIFY_DATE");
                String repeatDeleteYn = rs.getString("REPEAT_DELETE_YN");
                
                vo = new RequestVo();
                vo.setPostNo(postNo);
                vo.setUserNo(userNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setAdminNo(adminNo);
                vo.setRepeatReport(repeatReport);
                vo.setRepeatContent(repeatContent);
                vo.setRepeatTime(repeatTime);
                vo.setRepeatModifyDate(repeatModifyDate);
                vo.setRepeatDeleteYn(repeatDeleteYn);
                
                
                System.out.println(vo);
            };
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return vo;
        
        
    }
    
    

}
