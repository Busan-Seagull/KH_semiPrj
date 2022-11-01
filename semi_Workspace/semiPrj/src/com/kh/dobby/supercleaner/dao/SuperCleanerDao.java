package com.kh.dobby.supercleaner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.supercleaner.vo.ZipVo;

public class SuperCleanerDao {

    public List<ZipVo> getList(Connection conn) {
        
        String sql = "SELECT AVG(GRADE) AS GRADE, AVG(POST) AS REVIEW, USER_NO, IMG_LINK, NICK\r\n"
                + "FROM\r\n"
                + "    (\r\n"
                + "    SELECT AVG(GRADE) AS GRADE, SERVICE_NO, COUNT(POST_NO) AS POST, U.USER_NO, IMG_LINK, NICK\r\n"
                + "    FROM REVIEW\r\n"
                + "    JOIN SERVICE_INFO S USING(SERVICE_NO)\r\n"
                + "    JOIN \"USER\" U ON U.USER_NO = S.USER_NO\r\n"
                + "    LEFT JOIN DOBBY D ON U.USER_NO = D.USER_NO\r\n"
                + "    GROUP BY SERVICE_NO, U.USER_NO, IMG_LINK, NICK\r\n"
                + "    )\r\n"
                + "GROUP BY USER_NO, IMG_LINK, NICK\r\n"
                + "ORDER BY GRADE DESC";
        
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        
        List<ZipVo> list = new ArrayList<ZipVo>();
        
        try {
            
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            
            int i = 0;
            while(rs.next()&&i<10) {
                ZipVo vo = new ZipVo();
                vo.setGrade(rs.getString("GRADE"));
                vo.setImgLink(rs.getString("IMG_LINK"));
                vo.setNick(rs.getString("NICK"));
                vo.setReview(rs.getString("REVIEW"));
                vo.setUserNo(rs.getString("USER_NO"));
                
                list.add(vo);
                i++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }

}
