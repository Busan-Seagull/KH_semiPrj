package com.kh.dobby.service.temp;

import java.sql.Connection;

import com.kh.dobby.common.JDBCTemplate;

public class ZzimServiceTemp {
    
    public ZzimVoTemp checkZzim(String sno, String uno) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        ZzimVoTemp zzim = new ZzimDaoTemp().checkZzim(conn, sno, uno);
        
        JDBCTemplate.close(conn);
        
        return zzim;
    }

}
