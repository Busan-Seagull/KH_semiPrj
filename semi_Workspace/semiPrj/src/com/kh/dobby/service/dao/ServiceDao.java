package com.kh.dobby.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.payVo.PayVo;
import com.kh.dobby.service.vo.ServiceVo;

public class ServiceDao {

    // 서비스 등록
    public int registService(Connection conn, ServiceVo sv) {

        String sql = "INSERT INTO \"SERVICE_INFO\" VALUES (SEQ_SERVICE_INFO_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, sv.getTypeNo());
            pstmt.setString(2, sv.getTitle());
            pstmt.setString(3, sv.getServiceIntro());
            pstmt.setInt(4, sv.getHelperNo());
            pstmt.setString(5, sv.getProfileImg());
            pstmt.setInt(6, sv.getCharge());
            pstmt.setInt(7, sv.getChargeUnitNo());
            pstmt.setInt(8, sv.getHelperExp());
            pstmt.setString(9, sv.getOpenTime());
            pstmt.setString(10, sv.getCloseTime());
            pstmt.setString(11, sv.getServiceDetail());
            pstmt.setString(12, sv.getServicePic_1());
            pstmt.setString(13, sv.getServicePic_2());
            pstmt.setString(14, sv.getServicePic_3());
            pstmt.setString(15, sv.getServicePic_4());
            pstmt.setString(16, sv.getPaymentDetail());
            pstmt.setInt(17, sv.getpTypeNo_1());
            pstmt.setInt(18, sv.getpTypeNo_2());
            pstmt.setInt(19, sv.getpTypeNo_3());
            pstmt.setInt(20, sv.getAreaNo_1());
            pstmt.setInt(21, sv.getAreaNo_2());
            pstmt.setInt(22, sv.getAreaNo_3());
            pstmt.setInt(23, sv.getAreaNo_4());
            pstmt.setInt(24, sv.getAreaNo_5());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }

    // 서비스 정보 수정
    public int modifyService(Connection conn, ServiceVo sv) {
        String sql = "UPDATE SERVICE_INFO SET SERVICE_TITLE = ?, IMAGE_LINK = ?, CHARGE_UNIT_NO = ?, CHARGE = ?, PAYMENT_ABLE_1 = ?, PAYMENT_ABLE_2 = ?, PAYMENT_ABLE_3 = ?, SERVICE_INTRO = ?, OPEN_TIME = ?, CLOSE_TIME = ?, EXP = ?, AREA_1 = ?, AREA_2 = ?, AREA_3 = ?, AREA_4 = ?, AREA_5 = ?, SERVICE_PIC_1 = ?, SERVICE_PIC_2 = ?, SERVICE_PIC_3 = ?, SERVICE_PIC_4 = ?, DETAIL = ?, PAYMENT_DETAIL = ? WHERE SERVICE_NO = ?";

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sv.getTitle());
            pstmt.setString(2, sv.getProfileImg());
            pstmt.setInt(3, sv.getChargeUnitNo());
            pstmt.setInt(4, sv.getCharge());
            pstmt.setInt(5, sv.getpTypeNo_1());
            pstmt.setInt(6, sv.getpTypeNo_2());
            pstmt.setInt(7, sv.getpTypeNo_3());
            pstmt.setString(8, sv.getServiceIntro());
            pstmt.setString(9, sv.getOpenTime());
            pstmt.setString(10, sv.getCloseTime());
            pstmt.setInt(11, sv.getHelperExp());
            pstmt.setInt(12, sv.getAreaNo_1());
            pstmt.setInt(13, sv.getAreaNo_2());
            pstmt.setInt(14, sv.getAreaNo_3());
            pstmt.setInt(15, sv.getAreaNo_4());
            pstmt.setInt(16, sv.getAreaNo_5());
            pstmt.setString(17, sv.getServicePic_1());
            pstmt.setString(18, sv.getServicePic_2());
            pstmt.setString(19, sv.getServicePic_3());
            pstmt.setString(20, sv.getServicePic_4());
            pstmt.setString(21, sv.getServiceDetail());
            pstmt.setString(22, sv.getPaymentDetail());
            pstmt.setInt(23, sv.getServiceNo());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }

    // 서비스넘버 받아 서비스 삭제하기
    public int deleteService(Connection conn, int serviceNo) {
        String sql = "DELETE FROM SERVICE_INFO WHERE SERVICE_NO=?";

        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, serviceNo);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }

        return result;
    }

    // 카테고리 별로 리스트 받아오기
    public List<ServiceVo> listService(Connection conn, PageVo pv, String stn, String region) {
        String sql = null;
        if (stn == null && region == null) {
            //카테고리 없고, 지역 없을 때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO";
        }else if(stn == null & region != null) {
            //카테고리 없고, 지역 있을 때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE AREA_1 = "+region+"OR AREA_2 = "+region+" OR AREA_3 = "+region+" OR AREA_4 = "+region+" OR AREA_5 = "+region;
        }else if(stn != null && region == null){
            //카테고리 있고, 지역 없을때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE S.SERVICE_TYPE_NO ="
                    + stn;
        } else {
            //카테고리 있고, 지역 있을때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE (AREA_1 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_2 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_3 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_4 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_5 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+")";
        }

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

    public ServiceVo selectOne(Connection conn, String sno) {

        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE S.SERVICE_NO = ?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ServiceVo sv = new ServiceVo();
        int serviceNumber = Integer.parseInt(sno);

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, serviceNumber);

            rs = pstmt.executeQuery();

            if (rs.next()) {
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
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }

        return sv;
    }

    // 유저 넘버로 리스트 받아오기
    public List<ServiceVo> listService(Connection conn, int userNo) {

        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE S.USER_NO ="
                + userNo;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ServiceVo> svList = new ArrayList<ServiceVo>();

        try {
            pstmt = conn.prepareStatement(sql);

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

    // 검색어로 리스트
    public List<ServiceVo> listBySearch(Connection conn, PageVo pv, String search) {

        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, "
                + "S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, "
                + "S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, "
                + "S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1,S.SERVICE_PIC_2 , "
                + "S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL,S.PAYMENT_ABLE_1, "
                + "S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1,S.AREA_2, S.AREA_3, S.AREA_4,"
                + " S.AREA_5 FROM SERVICE_INFO S "
                + "JOIN \"USER\" U "
                + "ON S.USER_NO = U.USER_NO "
                + "JOIN \"SERVICE\" SE "
                + "ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO "
                + "JOIN CHARGE_UNIT C "
                + "ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO "
                + "WHERE SERVICE_TITLE LIKE '%" + search + "%' OR SERVICE_INTRO LIKE '%" + search + "%'";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ServiceVo> svList = new ArrayList<ServiceVo>();

        try {
            pstmt = conn.prepareStatement(sql);

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
    
    //인기유저 리스트
    public List<ServiceVo> listPopUser(Connection conn) {
        //TODO
        String sql = "SELECT * FROM(\r\n"
                + "SELECT ROWNUM NUM, S.SERVICE_NO, S.USER_NO, Z.CNT\r\n"
                + "FROM SERVICE_INFO S\r\n"
                + "INNER JOIN (SELECT SERVICE_NO\r\n"
                + "            , COUNT(*) CNT\r\n"
                + "            FROM ZZIM\r\n"
                + "            GROUP BY SERVICE_NO) Z\r\n"
                + "            ON S.SERVICE_NO = Z.SERVICE_NO\r\n"
                + "            WHERE ROWNUM<=10)\r\n"
                + "            ORDER BY CNT DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ServiceVo> svList = new ArrayList<ServiceVo>();

        try {
            pstmt = conn.prepareStatement(sql);

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
