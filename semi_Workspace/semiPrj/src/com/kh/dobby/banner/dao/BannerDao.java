package com.kh.dobby.banner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.common.JDBCTemplate;

public class BannerDao {

    public List<BannerVo> selectList(Connection conn) {

        String sql = "SELECT * FROM BANNER";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<BannerVo> list = new ArrayList<>();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BannerVo vo = new BannerVo();
                
                vo.setBannerNo(rs.getString("BANNER_NO"));
                vo.setbTypeNo(rs.getString("B_TYPE_NO"));
                vo.setImgLink(rs.getString("IMG_LINK"));
                vo.setLink(rs.getString("LINK"));
                vo.setTitle(rs.getString("TITLE"));

                
                list.add(vo);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return list;
    }

}
