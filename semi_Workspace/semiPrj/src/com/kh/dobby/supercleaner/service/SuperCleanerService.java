package com.kh.dobby.supercleaner.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.point.vo.PointVo;
import com.kh.dobby.supercleaner.dao.SuperCleanerDao;
import com.kh.dobby.supercleaner.vo.ZipVo;

public class SuperCleanerService {

    public List<ZipVo> getList() {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<ZipVo> list = new SuperCleanerDao().getList(conn);
        
        
        JDBCTemplate.close(conn);
        
        return list;
    }

}
