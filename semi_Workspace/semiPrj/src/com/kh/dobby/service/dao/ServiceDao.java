package com.kh.dobby.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.service.vo.ServiceAttachmentVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ServiceDao {

    // 서비스 등록
    public int registService(Connection conn, ServiceVo sv) {

        String sql = "INSERT INTO SERVICE() VALUES ()";
        
        //TODO sql작성..

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, sv.getTitle());
            
            
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;

    }
    
    // 첨부파일 등록
    public int insertAttachment(Connection conn, ServiceAttachmentVo s_attatchmentVo) {
        
        
        return 0;
    }

}
