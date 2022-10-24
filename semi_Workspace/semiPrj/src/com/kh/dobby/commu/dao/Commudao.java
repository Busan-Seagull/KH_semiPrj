package com.kh.dobby.commu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.vo.CommuVo;

public class Commudao {

    public static int insertBoard(Connection conn, CommuVo cv) {
        String sql="INSERT INTO BOARD(POST_NO,TYPE_NO,USER_NO,TITLE,CONTENT)VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?)";
        PreparedStatement pstmt=null;
        int result=0;
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, cv.getTypeNo());
            pstmt.setString(2, cv.getUserNo());
            pstmt.setString(3, cv.getTitle());
            pstmt.setString(4, cv.getContent());
            
            result=pstmt.executeUpdate();
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public static int selectCount(Connection conn) {
        String sql="SELECT COUNT(*) AS CNT FROM BOARD WHERE DELETE_YN='N'";
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        int result=0;
        
        try {
         pstmt=conn.prepareStatement(sql);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
             result=rs.getInt("cnt");
         }
         
         
         
     } catch (SQLException e) {
         e.printStackTrace();
     }finally {
         JDBCTemplate.close(rs);
         JDBCTemplate.close(pstmt);
     }
        
        return result;
        
     }

    public static List<CommuVo> selectList(Connection conn, PageVo pv) {
       
    }

    

}
