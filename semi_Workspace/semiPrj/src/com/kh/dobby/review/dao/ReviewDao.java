package com.kh.dobby.review.dao;

import static com.kh.dobby.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

}
