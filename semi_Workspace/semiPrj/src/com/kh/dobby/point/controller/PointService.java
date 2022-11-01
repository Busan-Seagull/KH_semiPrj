package com.kh.dobby.point.controller;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.point.dao.PointDao;
import com.kh.dobby.point.vo.PointVo;

public class PointService {

    public List<PointVo> getList(String userNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<PointVo> list = new PointDao().getList(conn, userNo);
        
        for(PointVo vo : list) {
            vo.setDate(vo.getDate().substring(0, 10));
        }
        
        JDBCTemplate.close(conn);
        
        return list;
    }
    
    public int getSumPoint(String userNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new PointDao().getSumPoinst(conn, userNo);
        
        JDBCTemplate.close(conn);
        
        return result;
    }

}
