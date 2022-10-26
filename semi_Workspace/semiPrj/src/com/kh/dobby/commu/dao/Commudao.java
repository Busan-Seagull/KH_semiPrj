package com.kh.dobby.commu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
       String sql="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT B.POST_NO,B.TYPE_NO,U.NICK as USER_NO,B.TITLE,B.CONTENT,B.WRITE_TIME,B.DELETE_YN,B.MODIFY_DATE,B.VIEWS FROM BOARD B JOIN \"USER\" U ON B.USER_NO=U.USER_NO WHERE B.DELETE_YN='N' ORDER BY B.POST_NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
    
       PreparedStatement pstmt=null;
       ResultSet rs=null;
       List<CommuVo> volist=new ArrayList<CommuVo>();
       
       try {
        pstmt=conn.prepareStatement(sql);
        int start=(pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
        int end=start+pv.getBoardLimit()-1;
        
        pstmt.setInt(1, start);
        pstmt.setInt(2, end);
        rs=pstmt.executeQuery();
        
        
        
        while (rs.next()) {
            String postNo = rs.getString("POST_NO");
            String typeNo = rs.getString("TYPE_NO");
            String userNo = rs.getString("USER_NO");
            String title = rs.getString("TITLE");
            String content = rs.getString("CONTENT");
            String writeTime = rs.getString("WRITE_TIME");
            String deleteYn = rs.getString("DELETE_YN");
            String modifyDate = rs.getString("MODIFY_DATE");
            String views = rs.getString("VIEWS");
            
            CommuVo cv = new CommuVo();
            cv.setPostNo(postNo);
            cv.setTypeNo(typeNo);
            cv.setUserNo(userNo);
            cv.setTitle(title);
            cv.setContent(content);
            cv.setWriteTime(writeTime);
            cv.setDeleteYn(deleteYn);
            cv.setModifyDate(modifyDate);
            cv.setViews(views);
            
            volist.add(cv);

            
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }finally {
        JDBCTemplate.close(pstmt);
        JDBCTemplate.close(rs);
    }
    
    return volist;


    
    
    
    }

    public static int increaseHit(Connection conn, String bno) {
        String sql="UPDATE BOARD SET VIEWS=VIEWS+1 WHERE POST_NO=? AND DELETE_YN='N'";
        PreparedStatement pstmt=null;
        int result=0;
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, bno);
            
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        return result;

    }

    public static CommuVo selectOne(Connection conn, String bno) {
        String sql="SELECT B.POST_NO, C.TYPE_NAME AS TYPE_NO, U.NICK as USER_NO,B.TITLE,B.CONTENT,B.WRITE_TIME,B.DELETE_YN,B.MODIFY_DATE,B.VIEWS FROM BOARD B JOIN \"USER\" U ON B.USER_NO=U.USER_NO JOIN COMU_TYPE C ON B.TYPE_NO=C.TYPE_NO WHERE B.POST_NO=? AND B.DELETE_YN='N'"; 
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        CommuVo cv = null;
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, bno);
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String typeNo = rs.getString("TYPE_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                String writeTime = rs.getString("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                String modifyDate = rs.getString("MODIFY_DATE");
                String views = rs.getString("VIEWS");
                
                cv = new CommuVo();
                cv.setPostNo(postNo);
                cv.setTypeNo(typeNo);
                cv.setUserNo(userNo);
                cv.setTitle(title);
                cv.setContent(content);
                cv.setWriteTime(writeTime);
                cv.setDeleteYn(deleteYn);
                cv.setModifyDate(modifyDate);
                cv.setViews(views);
               
                
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return cv;

    }

    public int updateOneByNo(Connection conn, CommuVo vo) {
        String sql="UPDATE BOARD SET TITLE = ? , CONTENT=? ,MODIFY_DATE= SYSDATE WHERE POST_NO=?";
        PreparedStatement pstmt=null;
        int result=0;
        try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, vo.getTitle());
         pstmt.setString(2, vo.getContent());
         pstmt.setString(3, vo.getPostNo());
         
         result=pstmt.executeUpdate();
         
         
     } catch (SQLException e) {
         e.printStackTrace();
     }finally {
         JDBCTemplate.close(pstmt);
     }
        
        return result;

    }

    public int delete(Connection conn, String bno) {
 String sql="UPDATE BOARD SET DELETE_YN='Y' WHERE POST_NO=?";
        
        PreparedStatement pstmt=null;
        int result=0;
        try {
            pstmt=conn.prepareStatement(sql);
            
            pstmt.setString(1, bno);
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;

    }

    

}
