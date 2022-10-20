package com.kh.dobby.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.member.vo.RightVo;

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

    public int insertJoin(Connection conn, MemberVo vo) {
        PreparedStatement pstmt=null;
        int result=0;
        
        String sql="INSERT INTO \"USER\"(USER_NO,RIGHT_NO,ID,PWD,NAME,EMAIL,NICK,ADDRESS,PHONE) VALUES(SEQ_USER_NO.NEXTVAL,?,?,?,?,?,?,?,?)";
        
        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1, vo.getRightNo());
            pstmt.setString(2, vo.getId());
            pstmt.setString(3, vo.getPwd());
            pstmt.setString(4, vo.getName());
            pstmt.setString(5, vo.getEmail());
            pstmt.setString(6, vo.getNick());
            pstmt.setString(7, vo.getAddress());
            pstmt.setString(8, vo.getPhone());
            
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public int insertJoinDobby(Connection conn, RightVo rightvo) {
        String sql= "INSERT INTO DOBBY(USER_NO,BR_NUM,ACCOUNT) VALUES(SEQ_USER_NO.CURRVAL,?,?)";
        PreparedStatement pstmt=null;
        int result=0;
        try {
            pstmt=conn.prepareStatement(sql);
            
           
            pstmt.setString(1,rightvo.getBr_num());
            pstmt.setString(2,rightvo.getAccount());
          
            result=pstmt.executeUpdate();
           
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            
        }finally {
            JDBCTemplate.close(pstmt);
            
        }
        
        
        return result;
        
    }

}


