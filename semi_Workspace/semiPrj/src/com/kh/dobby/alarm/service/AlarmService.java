package com.kh.dobby.alarm.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.alarm.dao.AlarmDao;
import com.kh.dobby.alarm.vo.AlarmVo;
import com.kh.dobby.common.JDBCTemplate;

public class AlarmService {

    public List<AlarmVo> selectList(String userNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<AlarmVo> list = new AlarmDao().selectList(conn, userNo);
        
        JDBCTemplate.close(conn);
        
        return list;
    }

    public int updateAlarm(String ano) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = new AlarmDao().updateAlarm(conn, ano);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        
        return result;
    }

}
