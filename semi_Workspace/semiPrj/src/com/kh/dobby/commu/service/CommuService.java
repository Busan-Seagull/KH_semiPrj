package com.kh.dobby.commu.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.dao.Commudao;
import com.kh.dobby.commu.vo.CommuVo;

public class CommuService {

    public static int write(CommuVo cv) {
        Connection conn = JDBCTemplate.getConnection();
        //게시글 인설트!
        int result = Commudao.insertBoard(conn,cv);
        
        
        if(result==1) {
            JDBCTemplate.commit(conn);
            
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;

    }

    public int selectCount() {
        Connection conn = JDBCTemplate.getConnection();
        
        int result=Commudao.selectCount(conn);
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public List<CommuVo> selectList(PageVo pv) {
 Connection conn = JDBCTemplate.getConnection();
        
        List<CommuVo>list=Commudao.selectList(conn,pv);
        
        JDBCTemplate.close(conn);
        
        return list;

    }

}
