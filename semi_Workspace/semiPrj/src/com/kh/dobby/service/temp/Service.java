package com.kh.dobby.service.temp;

import static com.kh.dobby.common.JDBCTemplate.close;
import static com.kh.dobby.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.review.vo.ReviewVo;

public class Service {
    Dao dao = new Dao();
    
    public List<ReviewVo> selectList(PageVo pv, String sno) {

        Connection conn = getConnection();
        
        List<ReviewVo> x = dao.selectList(conn, pv, sno);
        
        close(conn);
        return x;
        
    
    }

}
