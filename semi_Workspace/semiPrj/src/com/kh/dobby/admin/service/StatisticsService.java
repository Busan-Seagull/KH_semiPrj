package com.kh.dobby.admin.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.admin.dao.StatisticsDao;
import com.kh.dobby.banner.dao.BannerDao;
import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.common.JDBCTemplate;

public class StatisticsService {

    public int getUserCount(String sDate, String eDate, int right) {

        Connection conn = JDBCTemplate.getConnection();
        
        int count = new StatisticsDao().getUserCount(conn, sDate, eDate, right);
        
        JDBCTemplate.close(conn);
        
        return count;
        
    }

    public int getServiceCount(String sDate, String eDate) {

        Connection conn = JDBCTemplate.getConnection();
        
        int count = new StatisticsDao().getServiceCount(conn, sDate, eDate);
        
        JDBCTemplate.close(conn);
        
        return count;
        
    }

}
