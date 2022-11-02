package com.kh.dobby.request.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.request.vo.RequestVo;

public class RequestDao {

    public int insertBoard(Connection conn, RequestVo vo) {

        String sql = "INSERT INTO QUESTION "
                + "( POST_NO, USER_NO, TITLE, CONTENT, WRITE_TIME, DELETE_YN, MODIFY_DATE, ADMIN_NO, REPEAT_REPORT,"
                + " REPEAT_CONTENT, REPEAT_TIME, REPEAT_MODIFY_DATE, REPEAT_DELETE_YN) "
                + "VALUES ( SEQ_QUESTION_NO.NEXTVAL , ? , ? , ? , SYSDATE , 'N' , SYSDATE , '2' , 'N' , "
                + " '' , SYSDATE , SYSDATE , '' )";
        
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
    
    

    //페이지 화면
    public List<RequestVo> selectList(Connection conn, PageVo pv) {
        
        //String sql = "SELECT *  FROM QUESTION WHERE DELETE_YN='N' ORDER BY POST_NO ASC";
        //String sql = 
//                "SELECT TABLE.*, ROWNUM  "
//                + " FROM (SELECT * FROM QUESTION WHERE DELETE_YN='N' ORDER BY POST_NO ASC) TABLE "
//                + " WHERE ROWNUM BETWEEN 1 AND 10";
        
        String sql = "select * from( select t.*, rownum as rn from ( select Q.POST_NO ,U.NICK AS USER_NO ,Q.TITLE ,Q.CONTENT ,Q.WRITE_TIME,Q.DELETE_YN FROM QUESTION Q JOIN \"USER\" U ON Q.USER_NO=U.USER_NO where Q.delete_yn='N' order by Q.post_no asc)t ) where rn between ? and ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<RequestVo> voList = new ArrayList<RequestVo>();
        
        
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            String first = Integer.toString((pv.getCurrentPage()*10)-9);
            String last = Integer.toString((pv.getCurrentPage()*10));
            
            pstmt.setString(1, first);
            pstmt.setString(2, last);
            /*페이지 내용은 이 안에*/
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String postNo = rs.getString("POST_NO");
                String userNo = rs.getString("USER_NO");
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                String writeTime = rs.getString("WRITE_TIME");
                String deleteYn = rs.getString("DELETE_YN");
//                String modifyDate = rs.getString("MODIFY_DATE");
//                String adminNo = rs.getString("ADMIN_NO");
//                String repeatReport = rs.getString("REPEAT_REPORT");
//                String repeatContent = rs.getString("REPEAT_CONTENT");
//                String repeatTime = rs.getString("REPEAT_TIME");
//                String repeatModifyDate = rs.getString("REPEAT_MODIFY_DATE");
//                String repeatDeleteYn = rs.getString("REPEAT_DELETE_YN");
                
                RequestVo vo = new RequestVo();
                vo.setPostNo(postNo);
                vo.setUserNo(userNo);
                vo.setTitle(title);
                vo.setContent(content);
                vo.setWriteTime(writeTime);
                vo.setDeleteYn(deleteYn);
//                vo.setModifyDate(modifyDate);
//                vo.setAdminNo(adminNo);
//                vo.setRepeatReport(repeatReport);
//                vo.setRepeatContent(repeatContent);
//                vo.setRepeatTime(repeatTime);
//                vo.setRepeatModifyDate(repeatModifyDate);
//                vo.setRepeatDeleteYn(repeatDeleteYn);
                
                
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
    
    
    
    
    
    
    
    

    //페이지 개수 세는거
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

    
    //게시글자세히
    public RequestVo selectOne(Connection conn, String bno) {
        System.out.println(bno);
        String sql = "SELECT *  FROM QUESTION JOIN \"USER\" USING (USER_NO) WHERE DELETE_YN='N' AND POST_NO=?";
        
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
                String userNo = rs.getString("NICK");
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
    
    
    
    

  //conn->페이지연결, bno:보드넘버, vo:RequestVo
    public int detailEdit(Connection conn, RequestVo vo) {
        
        String sql = "UPDATE QUESTION SET TITLE=?, CONTENT=?, MODIFY_DATE = SYSDATE WHERE POST_NO=?";
        
        PreparedStatement pstmt = null;
        int result = 0;
        
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            
            //userno, title, content 얻어옴
            
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getContent());
            pstmt.setString(3, vo.getPostNo());
            System.out.println("최종직전타이틀은?"+vo.getTitle());
            result = pstmt.executeUpdate();
            System.out.println("결과값은?"+result);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
        
        
        
    }
    
  //페이지 지우기
    public int removeall(Connection conn, int bno, RequestVo vo) {
        
        String sql = "UPDATE QUESTION SET DELETE_YN='Y' WHERE POST_NO=? AND USER_NO=? AND POST_NO=?";
        
        PreparedStatement pstmt = null;
        int result = 0;
        
        
        try {
            
            pstmt = conn.prepareStatement(sql);
            
            //userno, title, content 얻어옴
            pstmt.setString(1, vo.getUserNo());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getContent());
            pstmt.setInt(4, bno);
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
        
        
        
    }



    


    //관리자 조회화면
    public RequestVo selectAdminOne(Connection conn, String bno) {
        System.out.println(bno);
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
    
    
    
    public int detailAdminEdit(Connection conn, RequestVo vo, String bno) {
            System.out.println("bno는?"+bno);
            String sql = "UPDATE QUESTION SET REPEAT_REPORT='Y', REPEAT_CONTENT=? WHERE POST_NO=?";
            
            PreparedStatement pstmt = null;
            int result = 0;
            
            try {
                pstmt = conn.prepareStatement(sql);
                
                pstmt.setString(1, vo.getRepeatContent());
                pstmt.setString(2, bno);
                System.out.println("last bno : " +bno);
                
                result = pstmt.executeUpdate();
                System.out.println(result);
                
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
                JDBCTemplate.close(pstmt);
            }
            return result;
        
    }



    public static int delete(Connection conn, String bno) {

        String sql = "UPDATE QUESTION SET DELETE_YN='Y' WHERE POST_NO=?";
        
        PreparedStatement pstmt = null;
        int result=0;
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, bno);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
        
    }


/*
    public String getwritername(Connection conn, String bno) {
        System.out.println(bno);
        String sql = "SELECT NICK FROM QUESTION, USER WHERE USER.USER_NO=QUESTION.USER_NO";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RequestVo vo = null;
        
            try {
                pstmt = conn.prepareStatement(sql);
                
                
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
    }*/

}
