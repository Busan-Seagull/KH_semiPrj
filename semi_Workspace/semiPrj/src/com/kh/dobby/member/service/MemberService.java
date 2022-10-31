package com.kh.dobby.member.service;

import java.sql.Connection;

import com.kh.dobby.common.AttachmentVo;
import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.dao.MemberDao;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.member.vo.RightVo;

public class MemberService {

    public MemberVo login(MemberVo vo) {
        
       
            Connection conn=JDBCTemplate.getConnection();
            
            MemberDao dao=new MemberDao();
            MemberVo loginMember=new MemberDao().selectOne(conn,vo);
            
            JDBCTemplate.close(conn);

            return loginMember; 
        

    }

    public int join(MemberVo vo) {
        Connection conn=JDBCTemplate.getConnection();
        MemberDao dao = new MemberDao();
        int result=dao.insertJoin(conn, vo);
        
        int result2=1;
        if("2".equals(vo.getRightNo())){
            result2=dao.insertJoinDobby(conn,vo);
        }
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result*result2;

    }

    public int idCheck(String id) {
        Connection conn=JDBCTemplate.getConnection();
        MemberDao dao = new MemberDao();
        int result=dao.idCheck(conn, id);
        
        if (result == 0) {
            System.out.println("이미 존재하는 아이디입니다.");
        } else if (result == 1) {
            System.out.println("사용 가능한 아이디입니다.");
        }
        
        return result;
        
    }

    public MemberVo idfind(MemberVo vo) {
        Connection conn=JDBCTemplate.getConnection();
        
        MemberDao dao=new MemberDao();
        MemberVo idFind=new MemberDao().idfindOne(conn,vo);
        
        JDBCTemplate.close(conn);

        return idFind; 
    
    }

    public MemberVo pwdfind(MemberVo vo) {
        Connection conn=JDBCTemplate.getConnection();
        
        MemberDao dao=new MemberDao();
        MemberVo pwdFind=new MemberDao().pwdfindOne(conn,vo);
        
        JDBCTemplate.close(conn);

        return pwdFind;
    }

    public MemberVo edit(MemberVo vo, AttachmentVo avo) {
        Connection conn = JDBCTemplate.getConnection();
                                       
        int result = new MemberDao().updateOneByNo(conn,vo);
        int result2=1;
        //집요정 정보 업데이트
        if("2".equals( vo.getRightNo())) {
           result2 = new MemberDao().updateOneByNoDobby(conn,vo,avo);
        }    
       
        MemberVo updatedMember= null;
        
        if(result*result2==1) {
            JDBCTemplate.commit(conn);
            updatedMember= new MemberDao().selectOne(conn, vo);
            
          
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return updatedMember;
    }

    public int quit(String no) {
        Connection conn =JDBCTemplate.getConnection();
        
        int result = new MemberDao().quit(conn,no);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        
            return result;
    }

    public AttachmentVo selectAttachment(String userNo) {
        Connection conn=JDBCTemplate.getConnection();
        AttachmentVo vo=new MemberDao().selectAttachment(conn,userNo);
        
        JDBCTemplate.close(conn);
        return vo;

    }
    
   

}
