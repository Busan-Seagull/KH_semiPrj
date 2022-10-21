package com.kh.dobby.review.dao;

import static com.kh.dobby.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.review.vo.ReviewVo;

public class ReviewDao {

    public int insertReview(Connection conn, ReviewVo vo) {

        
        String sql = "INSERT INTO REVIEW (POST_NO,SERVICE_NO,USER_NO,TITLE,CONTENT,GRADE) VALUES (SEQ_REVIEW_NO.NEXTVAL,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getServiceNo());
            pstmt.setString(2, vo.getUserNo());
            pstmt.setString(3, vo.getTitle());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getGrade());
            
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        
        return result;
    
    }

    public List<ReviewVo> selectList(Connection conn, PageVo pv) {
        String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM,T.* FROM ( SELECT R.POST_NO ,S.SERVICE_NO ,U.USER_NO ,R.TITLE , R.CONTENT ,R.WRITE_TIME ,R.DELETE_YN, R.MODIFY_DATE ,R.GRADE ,U.NICK AS USER_NO FROM REVIEW R JOIN \"USER\" U ON R.USER_NO = U.USER_NO JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO WHERE R.DELETE_YN = 'N' ORDER BY R.POST_NO DESC )T ) WHERE RNUM BETWEEN ? AND ? ";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ReviewVo> voList = new ArrayList<ReviewVo>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1 ;
            int end = start + pv.getBoardLimit() - 1;
            
            pstmt.setInt(1,start);
            pstmt.setInt(2,end);
 
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String serviceNo = rs.getString("SERVICE_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
                Timestamp modifyDate = rs.getTimestamp("MODIFY_DATE");
                String grade = rs.getString("GRADE");
                
                
                ReviewVo vo = new ReviewVo();
                vo.setPostNo(postNo);
                vo.setServiceNo(serviceNo);
                vo.setUserNo(userNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
                vo.setModifyDate(modifyDate);
                vo.setGrade(grade);
               
                
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

}
