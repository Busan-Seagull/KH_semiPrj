package com.kh.dobby.commu.service;


import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.dao.Commudao;
import com.kh.dobby.commu.vo.CommuCmtVo;
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

    public List<CommuVo> selectList(PageVo pv,int catename) {
     Connection conn = JDBCTemplate.getConnection();

        List<CommuVo>list=Commudao.selectList(conn,pv,catename);
        
        JDBCTemplate.close(conn);
        
        return list;

    }

    public CommuVo selectOne(String bno) {
        Connection conn=JDBCTemplate.getConnection();
        int result=Commudao.increaseHit(conn,bno);
         
         CommuVo vo =null;
         if(result ==1) {
             JDBCTemplate.commit(conn);
             vo =Commudao.selectOne(conn,bno);
         }
         
         
         JDBCTemplate.close(conn);
         
         return vo;

    }

    public int edit(CommuVo vo) {
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new Commudao().updateOneByNo(conn,vo);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public int delete(String bno) {
        Connection conn=JDBCTemplate.getConnection();
        
        int result=new Commudao().delete(conn,bno);
        
        if(result==1) {
            
            JDBCTemplate.commit(conn);
            
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
        }

    public static int insertCmt(CommuCmtVo cmtVo) {
        Connection conn = JDBCTemplate.getConnection();
        //게시글 인설트!
        int result = Commudao.insertCmt(conn,cmtVo);
       
        
        if(result==1) {
            JDBCTemplate.commit(conn);
            
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public int selectCmtCount(String bno) {
        Connection conn = JDBCTemplate.getConnection();
        
        int result=Commudao.selectCmtCount(conn,bno);
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public List<CommuCmtVo> selectCommuCmtVoList(String bno) {
        Connection conn = JDBCTemplate.getConnection();

        List<CommuCmtVo>list=Commudao.selectCmtList(conn,bno);
        
        JDBCTemplate.close(conn);
        
        return list;
    }


    

}
