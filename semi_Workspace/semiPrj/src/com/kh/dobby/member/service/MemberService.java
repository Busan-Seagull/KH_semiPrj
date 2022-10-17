package com.kh.dobby.member.service;

import java.sql.Connection;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.dao.MemberDao;
import com.kh.dobby.member.vo.MemberVo;

public class MemberService {

    public MemberVo login(MemberVo vo) {
        
       
            Connection conn=JDBCTemplate.getConnection();
            
            MemberDao dao=new MemberDao();
            MemberVo loginMember=new MemberDao().selectOne(conn,vo);
            
            JDBCTemplate.close(conn);

            return loginMember; 
        

    }

}
