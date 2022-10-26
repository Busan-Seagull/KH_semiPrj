package com.kh.dobby.request.service;

import java.sql.Connection;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.request.dao.RequestDao;
import com.kh.dobby.request.vo.Requestvo;

public class RequestService {

    private RequestDao dao = new RequestDao();
    
    public int write(Requestvo vo) {
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

}
