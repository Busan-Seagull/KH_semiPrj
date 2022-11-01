package com.kh.dobby.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.dobby.common.AttachmentVo;
import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.member.vo.RightVo;

public class MemberDao {

    public MemberVo selectOne(Connection conn, MemberVo vo) {
       
            String sql="SELECT U.USER_NO,U.RIGHT_NO,U.ID,U.PWD,U.NAME,U.EMAIL, U.NICK,U.ADDRESS,U.PHONE,U.ENROLL_DATE,U.QUIT_YN, U.MODIFY_DATE,U.REPORT_CNT,D.BR_NUM,D.ACCOUNT,D.IMG_LINK FROM \"USER\" U left JOIN \"DOBBY\" D ON U.USER_NO =D.USER_NO WHERE U.ID=? AND U.PWD=? AND U.QUIT_YN='N'";
           
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
                    
                    String brNum=rs.getString("BR_NUM");
                    String account=rs.getString("ACCOUNT");
                    String imgLink=rs.getString("IMG_LINK");
                    
                    loginMember=new MemberVo();
                    loginMember.setUserNo(userNo);
                    loginMember.setRightNo(rightNo);//잘챙겨.
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
                    loginMember.setBr_num(brNum);
                    loginMember.setAccount(account);
                    loginMember.setImg_link(imgLink);
                    
                   
                    
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

    public int insertJoinDobby(Connection conn, MemberVo vo) {
        String sql= "INSERT INTO DOBBY(USER_NO,BR_NUM,ACCOUNT) VALUES(SEQ_USER_NO.CURRVAL,?,?)";
        PreparedStatement pstmt=null;
        int result=0;
        try {
            pstmt=conn.prepareStatement(sql);
            
           
            pstmt.setString(1,vo.getBr_num());
            pstmt.setString(2,vo.getAccount());
          
            result=pstmt.executeUpdate();
           
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            
        }finally {
            JDBCTemplate.close(pstmt);
            
        }
        
        
        return result;
        
    }

    public int idCheck(Connection conn, String id) {
       
        
        String sql = "SELECT * FROM \"USER\" WHERE ID = ?"; // 입력값이 테이블에 있는지 확인
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int idCheck = 0;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next() || id.equals("")) {
                idCheck = 0;  // 이미 존재하는 경우, 생성 불가능
            } else {
                idCheck = 1;  // 존재하지 않는 경우, 생성 가능
            }
        } catch (SQLException e) {
           
        }finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return idCheck;
    }

    public MemberVo idfindOne(Connection conn, MemberVo vo) {

        String sql="SELECT USER_NO,RIGHT_NO,ID,PWD,NAME,EMAIL,NICK,ADDRESS,PHONE,ENROLL_DATE,QUIT_YN,MODIFY_DATE,REPORT_CNT FROM \"USER\" WHERE NAME=? AND PHONE=? AND QUIT_YN='N'";
       
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        MemberVo idfind=null;
        
        try {
            pstmt=conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getPhone());
            
            rs=pstmt.executeQuery();
//            System.out.println(vo);
            if(rs.next()){
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
                
                
                idfind=new MemberVo();
                idfind.setUserNo(userNo);
                idfind.setRightNo(rightNo);//잘챙겨.
                idfind.setId(id);
                idfind.setPwd(pwd);
                idfind.setName(name);
                idfind.setEmail(email);
                idfind.setNick(nick);
                idfind.setAddress(address);
                idfind.setPhone(phone);
                idfind.setEnrollDate(enrollDate);
                idfind.setQuitYn(quitYn);
                idfind.setModifyDate(modifyDate);
                idfind.setReportCnt(reportCnt);
                
//                System.out.println(idfind);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return idfind;
    }

    public MemberVo pwdfindOne(Connection conn, MemberVo vo) {
        String sql="SELECT USER_NO,RIGHT_NO,ID,PWD,NAME,EMAIL,NICK,ADDRESS,PHONE,ENROLL_DATE,QUIT_YN,MODIFY_DATE,REPORT_CNT FROM \"USER\" WHERE ID=? AND EMAIL=? AND QUIT_YN='N'";
        
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        MemberVo pwdfind=null;
        
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, vo.getId());
            pstmt.setString(2, vo.getEmail());
            
            rs=pstmt.executeQuery();
           
            if(rs.next()){
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
            
                pwdfind=new MemberVo();
                pwdfind.setUserNo(userNo);
                pwdfind.setRightNo(rightNo);
                pwdfind.setId(id);
                pwdfind.setPwd(pwd);
                pwdfind.setName(name);
                pwdfind.setEmail(email);
                pwdfind.setNick(nick);
                pwdfind.setAddress(address);
                pwdfind.setPhone(phone);
                pwdfind.setEnrollDate(enrollDate);
                pwdfind.setQuitYn(quitYn);
                pwdfind.setModifyDate(modifyDate);
                pwdfind.setReportCnt(reportCnt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return pwdfind;
        
    }

    public int updateOneByNo(Connection conn, MemberVo vo) {
        PreparedStatement pstmt=null;
        int result=0;
        
        String sql="UPDATE \"USER\" SET PWD=?,NAME=?,EMAIL=?,NICK=?,ADDRESS=?,PHONE=? WHERE USER_NO=?";
        
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, vo.getPwd());
            pstmt.setString(2, vo.getName());
            pstmt.setString(3, vo.getEmail());
            pstmt.setString(4, vo.getNick());
            pstmt.setString(5, vo.getAddress());
            pstmt.setString(6, vo.getPhone());
            pstmt.setString(7, vo.getUserNo());
            
           
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;

    }



    public int updateOneByNoDobby(Connection conn, MemberVo vo, AttachmentVo avo) {
        PreparedStatement pstmt=null;
        int result=0;
        
        String sql="UPDATE \"DOBBY\" SET BR_NUM=?,ACCOUNT=?, IMG_LINK=? WHERE USER_NO=?";
        
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, vo.getBr_num());
            pstmt.setString(2, vo.getAccount());
            pstmt.setString(3, avo.getFilePath()+"/"+avo.getChangeName());
            pstmt.setString(4, vo.getUserNo());
            
           
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }



    public int quit(Connection conn, String no) {
        PreparedStatement pstmt=null;
        int result=0;
        String sql="UPDATE \"USER\" SET QUIT_YN='Y' WHERE USER_NO =?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, no);
            
            result=pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
        }
        return result;

    }



    public AttachmentVo selectAttachment(Connection conn, String userNo) {
        String sql="SELECT D.USER_NO,D.BR_NUM,D.ACCOUNT,D.SERVICE_1,D.SERVICE_2,D.SERVICE_3,D.IMG_LINK,U.QUIT_YN FROM \"DOBBY\" D JOIN \"USER\" U ON D.USER_NO=U.USER_NO WHERE U.QUIT_YN='N' AND U.USER_NO=?";
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        AttachmentVo vo=null;
        
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, userNo);
            rs=pstmt.executeQuery();
           
            
            if(rs.next()) {
                String no = rs.getString("USER_NO");
                String imgLink = rs.getString("IMG_LINK");
  
                
                vo=new AttachmentVo();
                vo.setNo(no);
                vo.setFilePath(imgLink);
               
                
            }
            
        } catch (SQLException e) {
           
            e.printStackTrace();
        }finally {
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(rs);
        }
        
        return vo;
    }
}
    




