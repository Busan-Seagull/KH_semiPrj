package com.kh.dobby.banner.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.banner.dao.BannerDao;
import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.common.JDBCTemplate;

public class BannerService {

    public List<BannerVo> selectList() {

        Connection conn = JDBCTemplate.getConnection();
        
        List<BannerVo> list = new BannerDao().selectList(conn);
        
        JDBCTemplate.close(conn);
        
        return list;
    }

    public int insert(BannerVo bvo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new BannerDao().insert(conn, bvo);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

}
