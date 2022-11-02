package com.kh.dobby.zzim.service;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.point.vo.PointVo;
import com.kh.dobby.supercleaner.vo.ZipVo;
import com.kh.dobby.zzim.dao.ZzimDao;
import com.kh.dobby.zzim.vo.ZzimVo;
import com.kh.dobby.zzim.vo.ZzimVo2;

public class ZzimService {

    public ZzimVo loaddata(ZzimVo zzimvo) {
        
        Connection conn = JDBCTemplate.getConnection();
        
        ZzimVo zzimMember = new ZzimDao().zzimlist(conn,zzimvo);
        // TODO Auto-generated method stub
        
        
        System.out.println("zzimservice에서");
        
        System.out.println("serviceno 데이터 : "+zzimMember.getServiceno());
        System.out.println("profileimg 데이터 : "+zzimMember.getProfileimg());
        System.out.println("servicename 데이터 : "+zzimMember.getServicename());
        System.out.println();
        
        JDBCTemplate.close(conn);
        
        return zzimMember;
        
    }
    
    public List<ZzimVo2> getZzimList(String userNo){
        
        Connection conn = JDBCTemplate.getConnection();
        
        List<ZzimVo2> list = new ZzimDao().getZzimList(conn, userNo);
        
        for(ZzimVo2 vo : list) {
            if(vo.getGrade().length() > 3) {
                vo.setGrade(vo.getGrade().substring(0,3));                
            }
        }
        
        
        JDBCTemplate.close(conn);
        
        return list;
        
    }

    public int insert(String sno, String userNo) {
        Connection conn = JDBCTemplate.getConnection();
        
        int result  = new ZzimDao().insert(conn, sno, userNo);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

    public int cancle(String sno, String userNo) {
        Connection conn = JDBCTemplate.getConnection();
        
        int result  = new ZzimDao().cancle(conn, sno, userNo);
        
        if(result==1) {
            JDBCTemplate.commit(conn);
        }else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        
        return result;
    }

}
