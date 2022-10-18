package com.kh.dobby.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.event.vo.EventVo;

public class EventDao {

    public int insert(Connection conn, EventVo vo) {

        String sql = "INSERT INTO eventhistory (EH_NO, USER_NO, DIFFICULTY_NO, SCORE, POINT) VALUES (SEQ_EVENTHISTORY_NO.NEXTVAL, ?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getUserNo());
            pstmt.setString(2, vo.getDifficulty());
            pstmt.setString(3, vo.getScore());
            pstmt.setString(4, vo.getPoint());
            
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public List<EventVo> getList(Connection conn, String userNo, PageVo pv) {
        
        String sql = "SELECT * FROM ( SELECT ROWNUM AS RN, USER_NO, SCORE, POINT, DIFFICULTY_NO, NAME, \"DATE\" FROM ( SELECT U.USER_NO, SCORE, POINT, DIFFICULTY_NO, NAME, \"DATE\" FROM eventhistory E JOIN \"USER\" U ON E.USER_NO = U.USER_NO WHERE E.USER_NO = ? ORDER BY \"DATE\" DESC ) ) WHERE RN BETWEEN ? AND ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<EventVo> list = new ArrayList<>();
        
        int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
        int end = start + pv.getBoardLimit() - 1;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                EventVo vo = new EventVo();
                vo.setNo(rs.getString("RN"));
                vo.setDifficulty(rs.getString("DIFFICULTY_NO"));
                vo.setScore(rs.getString("SCORE"));
                vo.setPoint(rs.getString("POINT"));
                vo.setUserNo(rs.getString("USER_NO"));
                vo.setDate(rs.getString("DATE"));
                vo.setUserName(rs.getString("NAME"));
                
                list.add(vo);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return list;
    }
    
    public List<EventVo> getList(Connection conn, PageVo pv) {
        
        String sql = "SELECT * FROM ( SELECT ROWNUM AS RN, USER_NO, SCORE, POINT, DIFFICULTY_NO, NAME, \"DATE\" FROM ( SELECT U.USER_NO, SCORE, POINT, DIFFICULTY_NO, NAME, \"DATE\" FROM eventhistory E JOIN \"USER\" U ON E.USER_NO = U.USER_NO ORDER BY DIFFICULTY_NO DESC, SCORE DESC ) ) WHERE RN BETWEEN ? AND ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<EventVo> list = new ArrayList<>();
        
        int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
        int end = start + pv.getBoardLimit() - 1;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                EventVo vo = new EventVo();
                vo.setNo(rs.getString("RN"));
                vo.setDifficulty(rs.getString("DIFFICULTY_NO"));
                vo.setScore(rs.getString("SCORE"));
                vo.setPoint(rs.getString("POINT"));
                vo.setUserNo(rs.getString("USER_NO"));
                vo.setDate(rs.getString("DATE"));
                vo.setUserName(rs.getString("NAME"));
                
                list.add(vo);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return list;
    }
    
    public int selectCount(Connection conn) {
        //SQL
        
        String sql = "SELECT COUNT(*) AS CNT FROM eventhistory";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                result = rs.getInt("CNT");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    public int selectCount(Connection conn, String userNo) {
        //SQL
        
        String sql = "SELECT COUNT(*) AS CNT FROM eventhistory WHERE USER_NO = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                result = rs.getInt("CNT");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public EventVo selectOne(Connection conn, String userNo) {
        String sql = "SELECT SCORE, DIFFICULTY_NO FROM EVENTHISTORY WHERE USER_NO = ? ORDER BY DIFFICULTY_NO DESC, SCORE DESC";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        EventVo vo = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                vo = new EventVo();
                vo.setDifficulty(rs.getString("DIFFICULTY_NO"));
                vo.setScore(rs.getString("SCORE"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return vo;
    }

}
