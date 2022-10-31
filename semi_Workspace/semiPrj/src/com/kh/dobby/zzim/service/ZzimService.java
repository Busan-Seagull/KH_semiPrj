package com.kh.dobby.zzim.service;

import java.sql.Connection;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.zzim.dao.ZzimDao;
import com.kh.dobby.zzim.vo.ZzimVo;

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

}
