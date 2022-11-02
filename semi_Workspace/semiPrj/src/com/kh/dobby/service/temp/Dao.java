package com.kh.dobby.service.temp;

import static com.kh.dobby.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.review.vo.ReviewVo;

public class Dao {

    public List<ReviewVo> selectList(Connection conn, PageVo pv, String sno) {
        String sql = "SELECT R.POST_NO, R.SERVICE_NO, R.TITLE, R.CONTENT, R.WRITE_TIME, R.GRADE, R.USER_NO, U.NICK\r\n"
                + "FROM REVIEW R\r\n"
                + "JOIN \"USER\" U ON U.USER_NO = R.USER_NO\r\n"
                + "WHERE SERVICE_NO = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ReviewVo> voList = new ArrayList<ReviewVo>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
//            int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1 ;
//            int end = start + pv.getBoardLimit() - 1;
//            
//           
//            pstmt.setInt(1,start);
//            pstmt.setInt(2,end);
            pstmt.setString(1, sno);
 
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String serviceNo = rs.getString("SERVICE_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                Timestamp writeTime = rs.getTimestamp("WRITE_TIME");
                String grade = rs.getString("GRADE");
                String userNick = rs.getString("NICK");
                
                
                ReviewVo vo = new ReviewVo();
                vo.setPostNo(postNo);
                vo.setServiceNo(serviceNo);
                vo.setUserNo(userNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setGrade(grade);
                vo.setUserNick(userNick);
               
                
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
