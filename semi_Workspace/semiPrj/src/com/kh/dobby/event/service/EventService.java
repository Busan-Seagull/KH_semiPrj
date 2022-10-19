package com.kh.dobby.event.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.event.dao.EventDao;
import com.kh.dobby.event.vo.EventVo;

public class EventService {
    
    EventDao dao = new EventDao();

    public int insertEvent(EventVo vo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.insert(conn, vo);
        
        if(result == 1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public List<EventVo> getList(String userNo, PageVo pv) {

        Connection conn = JDBCTemplate.getConnection();
        
        List<EventVo> list = dao.getList(conn, userNo, pv);
        
        for(int i = 0; i < list.size(); i++) {
            EventVo vo = list.get(i);
            
            vo.setDifficulty(changeDifficulty(vo.getDifficulty()));
            
            vo.setDate(vo.getDate().substring(0,10));
        }
               
        JDBCTemplate.close(conn);
        
        return list;
    }
    
    public List<EventVo> getRanckList(PageVo pv) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<EventVo> list = dao.getList(conn, pv);
        
        for(int i = 0; i < list.size(); i++) {
            EventVo vo = list.get(i);
            
            vo.setDifficulty(changeDifficulty(vo.getDifficulty()));
            
            vo.setDate(vo.getDate().substring(0,10));
        }
               
        JDBCTemplate.close(conn);
        
        return list;
    }
    
    public int selectCount() {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.selectCount(conn);
        
        JDBCTemplate.close(conn);
        
        return result;
    }
    
    public int selectCount(String userNo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        int result = dao.selectCount(conn, userNo);
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public EventVo getMyRanck(String userNo) {

        Connection conn = JDBCTemplate.getConnection();
        
        EventVo vo = dao.selectOne(conn, userNo);
        
        if(vo!=null) {
            vo.setDifficulty(changeDifficulty(vo.getDifficulty()));
        }
        
        JDBCTemplate.close(conn);
        
        return vo;
        
    }
    
    private String changeDifficulty(String difficulty) {
        
        switch(difficulty) {
            case "1" : return "EASY";
            case "2" : return "NORMAL";
            case "3" : return "HARD";
            default : return difficulty;
        }
    }
    
    
}
