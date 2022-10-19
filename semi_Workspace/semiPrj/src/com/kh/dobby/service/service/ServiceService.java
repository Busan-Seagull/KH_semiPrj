package com.kh.dobby.service.service;

import java.sql.Connection;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.service.dao.ServiceDao;
import com.kh.dobby.service.vo.ServiceAttachmentVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ServiceService {
    
    private final ServiceDao sd = new ServiceDao();
    
    //서비스 등록
    public int regist(ServiceVo sv) {
        //커넥션 준비
        Connection conn = JDBCTemplate.getConnection();
        
        //서비스 인서트
        int result = sd.registService(conn, sv);
        
        //첨부파일 insert(나중에 서비스 사진..들...)
//        int result2 = 1;
//        if(s_attachmentVo != null) {
//            result2 = sd.insertAttachment(conn, s_attachmentVo);
//            
//        }
        
        if(result == 1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        
        return result;
    }
    
}