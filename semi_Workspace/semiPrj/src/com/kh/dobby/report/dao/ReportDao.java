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

    public int insertReport(Connection conn, MemberVo memberVo, ServiceVo serviceVo, ReportVo vo) {

    
        String sql = "INSERT INTO REPORT (POST_NO,USER_NO,SERVICE_NO,WRITER,TITLE,CONTENT) VALUES (SEQ_REPORT_NO.NEXTVAL,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, memberVo.getUserNo());
            pstmt.setInt(2, serviceVo.getServiceNo());
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
        
        String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT R.POST_NO ,U.USER_NO ,S.SERVICE_NO ,R.TITLE ,\r\n"
                + "R.CONTENT  ,R.WRITE_TIME ,R.DELETE_YN, R.MODIFY_DATE ,M.NICK AS WRITER \r\n"
                + "FROM REPORT R JOIN USER U ON R.WRITER = U.USER_NO \r\n"
                + "JOIN SERVICE_INFO S ON S.USER_NO = U.USER_NO\r\n"
                + "WHERE R.DELETE_YN = 'N' ORDER BY R.POST_NO DESC )T )\r\n"
                + "WHERE RNUM BETWEEN ? AND ?";
        
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

}
