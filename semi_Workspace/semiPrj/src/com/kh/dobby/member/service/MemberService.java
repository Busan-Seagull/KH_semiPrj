package com.kh.dobby.member.service;

import java.sql.Connection;

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

    public int join(MemberVo vo, RightVo rightvo) {
        Connection conn=JDBCTemplate.getConnection();
        MemberDao dao = new MemberDao();
        int result=dao.insertJoin(conn, vo);
        
        int result2=1;
        if(rightvo!=null){
            result2=dao.insertJoinDobby(conn,rightvo);
        }
        if(result*result2==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result*result2;

    }

}
