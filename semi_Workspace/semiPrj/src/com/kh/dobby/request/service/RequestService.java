package com.kh.dobby.request.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.request.dao.RequestDao;
import com.kh.dobby.request.vo.RequestVo;

public class RequestService {

    private RequestDao dao = new RequestDao();
    
    //작성
    public int write(RequestVo vo) {
        //커넥션 준비, sql, 
        //트랜잭션, 자원반납
        Connection conn = JDBCTemplate.getConnection();
        
        //게시글 insert
        int result = dao.insertBoard(conn, vo);
        
        //청무파일 insert안함
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        return result;
    }
    
  //지우기
    public int remove(int bno, RequestVo vo) {
        //커넥션 준비, sql, 
        //트랜잭션, 자원반납
        Connection conn = JDBCTemplate.getConnection();
        
        //게시글 insert
        int result = dao.removeall(conn, bno, vo);
        
        //청무파일 insert안함
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        return result;
    }
    
    
    
    //페이지리스트
    public List<RequestVo> pageList(PageVo pv) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<RequestVo> x = dao.selectList(conn, pv);
        
        JDBCTemplate.close(conn);
        
        return x;
        
    }

    
    
    //페이지세기
    public int selectCount() {
        //커넥션준비
        //sql
        //트랜잭션,자원반납
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.selectCount(conn); // connection 전달하면서 연결 후 int result에 실행결과 전달->자원반납->실행결과반납
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    //게시글 들어가기
    public RequestVo selectOne(String bno) {
        
        
        //커넥션 준비
        //SQL
        //트랜잭션 자원반납
        
        Connection conn = JDBCTemplate.getConnection();
        
        RequestVo result= dao.selectOne(conn, bno);
        System.out.println(result);
        JDBCTemplate.close(conn);
        
        return result;
        
    }

    public int requestEdit(String bno, RequestVo vo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.detailEdit(conn, bno, vo);
        System.out.println(result);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }
   

    

}
