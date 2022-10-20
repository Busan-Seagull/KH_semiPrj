package com.kh.dobby.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceAttachmentVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ServiceDao {

    // 서비스 등록
    public int registService(Connection conn, ServiceVo sv) {

        String sql = "INSERT INTO SERVICE() VALUES ()";

        // TODO sql작성..

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, sv.getTitle());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }

    // 첨부파일 등록
    public int insertAttachment(Connection conn, ServiceAttachmentVo s_attatchmentVo) {

        return 0;
    }

    public List<ServiceVo> listService(Connection conn, PageVo pv) {

        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK,\r\n"
                + "S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2\r\n"
                + ", S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3\r\n"
                + ", S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5\r\n"
                + "FROM SERVICE_INFO S JOIN USER_ U\r\n"
                + "                    ON S.USER_NO = U.USER_NO\r\n"
                + "                    JOIN SERVICE_ SE\r\n"
                + "                    ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO\r\n"
                + "                    JOIN CHARGE_UNIT C\r\n"
                + "                    ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO;\r\n";
//                + "WHERE S.USER_NO = ?;";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ServiceVo> svList = new ArrayList<ServiceVo>();

        try {
            pstmt = conn.prepareStatement(sql);
            
//            int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
//            int end = start + pv.getBoardLimit() - 1;

//            pstmt.setInt(1, start);
//            pstmt.setInt(2, end);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int serviceNo = rs.getInt("SERVICE_NO");
                String title = rs.getString("SERVICE_TITLE");
                int typeNo = rs.getInt("SERVICE_TYPE_NO");
                String serviceType = rs.getString("NAME");
                int helperNo = rs.getInt("USER_NO");
                String helper = rs.getString("NICK");
                String serviceIntro = rs.getString("SERVICE_INTRO");
                String profileImg = rs.getString("IMAGE_LINK");
                int charge = rs.getInt("CHARGE");
                String chargeUnit = rs.getString("CHARGE_UNIT");
                int helperExp = rs.getInt("EXP");
                String openTime = rs.getString("OPEN_TIME");
                String closeTime = rs.getString("CLOSE_TIME");
                String serviceDetail = rs.getString("DETAIL");
                String paymentDetail = rs.getString("PAYMENT_DETAIL");
                String servicePic_1 = rs.getString("SERVICE_PIC_1");
                String servicePic_2 = rs.getString("SERVICE_PIC_2");
                String servicePic_3 = rs.getString("SERVICE_PIC_3");
                String servicePic_4 = rs.getString("SERVICE_PIC_4");
                int pTypeNo_1 = rs.getInt("PAYMENT_ABLE_1");
                int pTypeNo_2 = rs.getInt("PAYMENT_ABLE_2");
                int pTypeNo_3 = rs.getInt("PAYMENT_ABLE_3");
                int areaNo_1 = rs.getInt("AREA_1");
                int areaNo_2 = rs.getInt("AREA_2");
                int areaNo_3 = rs.getInt("AREA_3");
                int areaNo_4 = rs.getInt("AREA_4");
                int areaNo_5 = rs.getInt("AREA_5");

                ServiceVo sv = new ServiceVo();
                sv.setServiceNo(serviceNo);
                sv.setTitle(title);
                sv.setTypeNo(typeNo);
                sv.setServiceType(serviceType);
                sv.setHelperNo(helperNo);
                sv.setHelper(helper);
                sv.setServiceIntro(serviceIntro);
                sv.setProfileImg(profileImg);
                sv.setCharge(charge);
                sv.setChargeUnit(chargeUnit);
                sv.setHelperExp(helperExp);
                sv.setOpenTime(openTime);
                sv.setCloseTime(closeTime);
                sv.setServiceDetail(serviceDetail);
                sv.setPaymentDetail(paymentDetail);
                sv.setServicePic_1(servicePic_1);
                sv.setServicePic_2(servicePic_2);
                sv.setServicePic_3(servicePic_3);
                sv.setServicePic_4(servicePic_4);
                sv.setpTypeNo_1(pTypeNo_1);
                sv.setpTypeNo_2(pTypeNo_2);
                sv.setpTypeNo_3(pTypeNo_3);
                sv.setAreaNo_1(areaNo_1);
                sv.setAreaNo_2(areaNo_2);
                sv.setAreaNo_3(areaNo_3);
                sv.setAreaNo_4(areaNo_4);
                sv.setAreaNo_5(areaNo_5);
               

                svList.add(sv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }

        return svList;
    }

}
