package com.kh.dobby.request.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.request.vo.Requestvo;

public class RequestDao {

    public int insertBoard(Connection conn, Requestvo vo) {

        String sql = "INSERT INTO QUESTION ( POST_NO, USER_NO, TITLE, CONTENT, WRITE_TIME, DELETE_YN, MODIFY_DATE, ADMIN_NO, REPEAT_REPOR,"
                + " REPEAT_CONTENT, REPEAT_TIME, REPEAT_MODIFY_DATE, REPEAT_DELETE_YN) "
                + "VALUES ( SEQ_QUESTION_NO.NEXTVAL , ? , ? , ? , SYSDATE , 'N' , SYSDATE , '2' , 'N' , '' , SYSDATE , SYSDATE , '' )";
        
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

}
