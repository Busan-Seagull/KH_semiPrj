package com.kh.dobby.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;

public class MemberDao {

    public MemberVo selectOne(Connection conn, MemberVo vo) {
       
            String sql="SELECT USER_NO,RIGHT_NO,ID,PWD,NAME,EMAIL,NICK,ADDRESS,PHONE,ENROLL_DATE,QUIT_YN,MODIFY_DATE,REPORT_CNT FROM \"USER\" WHERE ID=? AND PWD=? AND QUIT_YN='N'";
           
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            MemberVo loginMember=null;

            try {
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, vo.getId());
                pstmt.setString(2, vo.getPwd());
                
                rs=pstmt.executeQuery();
                
                if(rs.next()) {

                    String userNo=rs.getString("USER_NO");
                    String rightNo=rs.getString("RIGHT_NO");
                    String id=rs.getString("ID");
                    String pwd=rs.getString("PWD");
                    String name=rs.getString("NAME");
                    String email=rs.getString("EMAIL");
                    String nick=rs.getString("NICK");
                    String address=rs.getString("ADDRESS");
                    String phone=rs.getString("PHONE");
                    String enrollDate=rs.getString("ENROLL_DATE");
                    String quitYn=rs.getString("QUIT_YN");
                    String modifyDate=rs.getString("MODIFY_DATE");
                    String reportCnt=rs.getString("REPORT_CNT");
                    
                    
                    loginMember=new MemberVo();
                    loginMember.setUserNo(userNo);
                    loginMember.setId(id);
                    loginMember.setPwd(pwd);
                    loginMember.setName(name);
                    loginMember.setEmail(email);
                    loginMember.setNick(nick);
                    loginMember.setAddress(address);
                    loginMember.setPhone(phone);
                    loginMember.setEnrollDate(enrollDate);
                    loginMember.setQuitYn(quitYn);
                    loginMember.setModifyDate(modifyDate);
                    loginMember.setReportCnt(reportCnt);
                    
                   
                    
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                JDBCTemplate.close(rs);
                JDBCTemplate.close(pstmt);
            }
            
            return loginMember;
        
        

    }

}


