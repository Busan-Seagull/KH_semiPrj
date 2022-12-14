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
        String sql = "UPDATE SERVICE_INFO SET SERVICE_TITLE = ?, IMAGE_LINK = ?, CHARGE_UNIT_NO = ?"
                + ", CHARGE = ?, PAYMENT_ABLE_1 = ?, PAYMENT_ABLE_2 = ?, PAYMENT_ABLE_3 = ?"
                + ", SERVICE_INTRO = ?, OPEN_TIME = ?, CLOSE_TIME = ?, EXP = ?"
                + ", AREA_1 = ?, AREA_2 = ?, AREA_3 = ?, AREA_4 = ?, AREA_5 = ?"
                + ", SERVICE_PIC_1 = ?, SERVICE_PIC_2 = ?, SERVICE_PIC_3 = ?, SERVICE_PIC_4 = ?"
                + ", DETAIL = ?, PAYMENT_DETAIL = ? WHERE SERVICE_NO = ?";

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
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK\r\n"
                    + ", S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL\r\n"
                    + ", S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL\r\n"
                    + ", S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5\r\n"
                    + ", R.COUNT, R.AVG, RR.TITLE, RR.CONTENT, RR.WRITE_TIME\r\n"
                    + "FROM SERVICE_INFO S \r\n"
                    + "JOIN \"USER\" U ON S.USER_NO = U.USER_NO \r\n"
                    + "JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO \r\n"
                    + "JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW  GROUP BY SERVICE_NO) R ON S.SERVICE_NO = R.SERVICE_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, TITLE, CONTENT, WRITE_TIME FROM REVIEW WHERE WRITE_TIME IN (SELECT MAX(WRITE_TIME) AS WRITE_TIME FROM REVIEW GROUP BY SERVICE_NO)) RR\r\n"
                    + "ON RR.SERVICE_NO = S.SERVICE_NO ORDER BY S.SERVICE_NO DESC";
        }else if(stn == null & region != null) {
            //카테고리 없고, 지역 있을 때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK\r\n"
                    + ", S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL\r\n"
                    + ", S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL\r\n"
                    + ", S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5\r\n"
                    + ", R.COUNT, R.AVG, RR.TITLE, RR.CONTENT, RR.WRITE_TIME\r\n"
                    + "FROM SERVICE_INFO S \r\n"
                    + "JOIN \"USER\" U ON S.USER_NO = U.USER_NO \r\n"
                    + "JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO \r\n"
                    + "JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW  GROUP BY SERVICE_NO) R ON S.SERVICE_NO = R.SERVICE_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, TITLE, CONTENT, WRITE_TIME FROM REVIEW WHERE WRITE_TIME IN (SELECT MAX(WRITE_TIME) AS WRITE_TIME FROM REVIEW GROUP BY SERVICE_NO)) RR\r\n"
                    + "ON RR.SERVICE_NO = S.SERVICE_NO\r\n"
                    + "WHERE AREA_1 = "+region+" OR AREA_2 = "+region+" OR AREA_3 = "+region+" OR AREA_4 = "+region+" OR AREA_5 = "+region+" ORDER BY S.SERVICE_NO DESC";
        }else if(stn != null && region == null){
            //카테고리 있고, 지역 없을때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK\r\n"
                    + ", S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL\r\n"
                    + ", S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL\r\n"
                    + ", S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 \r\n"
                    + ", R.COUNT, R.AVG, RR.TITLE, RR.CONTENT, RR.WRITE_TIME\r\n"
                    + "FROM SERVICE_INFO S \r\n"
                    + "JOIN \"USER\" U ON S.USER_NO = U.USER_NO \r\n"
                    + "JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO \r\n"
                    + "JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW  GROUP BY SERVICE_NO) R ON S.SERVICE_NO = R.SERVICE_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, TITLE, CONTENT, WRITE_TIME FROM REVIEW WHERE WRITE_TIME IN (SELECT MAX(WRITE_TIME) AS WRITE_TIME FROM REVIEW GROUP BY SERVICE_NO)) RR\r\n"
                    + "ON RR.SERVICE_NO = S.SERVICE_NO\r\n"
                    + "WHERE S.SERVICE_TYPE_NO =" + stn+" ORDER BY S.SERVICE_NO DESC";
                    
        } else {
            //카테고리 있고, 지역 있을때
            sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK\r\n"
                    + ", S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL\r\n"
                    + ", S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL\r\n"
                    + ", S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 \r\n"
                    + ", R.COUNT, R.AVG, RR.TITLE, RR.CONTENT, RR.WRITE_TIME\r\n"
                    + "FROM SERVICE_INFO S \r\n"
                    + "JOIN \"USER\" U ON S.USER_NO = U.USER_NO \r\n"
                    + "JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO \r\n"
                    + "JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO \r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW  GROUP BY SERVICE_NO) R ON S.SERVICE_NO = R.SERVICE_NO\r\n"
                    + "LEFT JOIN (SELECT SERVICE_NO, TITLE, CONTENT, WRITE_TIME FROM REVIEW WHERE WRITE_TIME IN (SELECT MAX(WRITE_TIME) AS WRITE_TIME FROM REVIEW GROUP BY SERVICE_NO)) RR\r\n"
                    + "ON RR.SERVICE_NO = S.SERVICE_NO\r\n"
                    + "WHERE (AREA_1 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_2 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_3 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_4 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") OR (AREA_5 = "+region+" AND S.SERVICE_TYPE_NO = "+stn+") ORDER BY S.SERVICE_NO DESC";
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
                sv.setReviewAvg(rs.getInt("AVG"));
                sv.setReviewCnt(rs.getInt("COUNT"));
                sv.setReviewTitle(rs.getString("TITLE"));
                sv.setReviewContent(rs.getString("CONTENT"));
                sv.setReviewTime(rs.getString("WRITE_TIME"));

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

        //서비스 디테일
        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK, S.IMAGE_LINK, S.CHARGE,S.CHARGE_UNIT_NO, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1, S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2, S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 FROM SERVICE_INFO S JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO WHERE S.SERVICE_NO = ?";
        //리뷰 평점
        String reviewSql = "SELECT * FROM(SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW GROUP BY SERVICE_NO) WHERE SERVICE_NO = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs2 = null;
        ServiceVo sv = new ServiceVo();
        int serviceNumber = Integer.parseInt(sno);

        try {
            //서비스 디테일
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
                String chargeUnitNo = rs.getString("CHARGE_UNIT_NO");
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
                sv.setChargeUnitNo(Integer.parseInt(chargeUnitNo));
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
                
                //서비스 리뷰
                pstmt2 = conn.prepareStatement(reviewSql);
                pstmt2.setInt(1, serviceNumber);

                rs2 = pstmt2.executeQuery();
                
                if(rs2.next()) {
                sv.setReviewCnt(rs2.getInt("COUNT"));
                sv.setReviewAvg(rs2.getInt("AVG"));
                }
                
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(rs2);
            JDBCTemplate.close(pstmt);
            JDBCTemplate.close(pstmt2);
        }

        return sv;
    }

    // 유저 넘버로 리스트 받아오기
    public List<ServiceVo> listService(Connection conn, int userNo) {

        String sql = "SELECT S.SERVICE_NO, S.SERVICE_TYPE_NO, SE.NAME, S.SERVICE_TITLE, S.SERVICE_INTRO , S.USER_NO, U.NICK\r\n"
                + ", S.IMAGE_LINK, S.CHARGE, C.CHARGE_UNIT, S.EXP, S.OPEN_TIME, S.CLOSE_TIME, S.DETAIL, S.SERVICE_PIC_1\r\n"
                + ", S.SERVICE_PIC_2 , S.SERVICE_PIC_3, S.SERVICE_PIC_4, S.PAYMENT_DETAIL, S.PAYMENT_ABLE_1, S.PAYMENT_ABLE_2\r\n"
                + ", S.PAYMENT_ABLE_3 , S.AREA_1, S.AREA_2, S.AREA_3, S.AREA_4, S.AREA_5 \r\n"
                + ", R.COUNT, R.AVG, RR.TITLE, RR.CONTENT, RR.WRITE_TIME\r\n"
                + "FROM SERVICE_INFO S \r\n"
                + "JOIN \"USER\" U ON S.USER_NO = U.USER_NO \r\n"
                + "JOIN \"SERVICE\" SE ON S.SERVICE_TYPE_NO = SE.SERVICE_TYPE_NO \r\n"
                + "JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO \r\n"
                + "LEFT JOIN (SELECT SERVICE_NO, COUNT(*) COUNT, AVG(GRADE) AVG FROM REVIEW  GROUP BY SERVICE_NO) R ON S.SERVICE_NO = R.SERVICE_NO\r\n"
                + "LEFT JOIN (SELECT SERVICE_NO, TITLE, CONTENT, WRITE_TIME FROM REVIEW WHERE WRITE_TIME IN (SELECT MAX(WRITE_TIME) AS WRITE_TIME FROM REVIEW GROUP BY SERVICE_NO)) RR\r\n"
                + "ON RR.SERVICE_NO = S.SERVICE_NO\r\n"
                + "WHERE S.USER_NO ="
                + userNo +" ORDER BY S.SERVICE_NO DESC";

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
                sv.setReviewAvg(rs.getInt("AVG"));
                sv.setReviewCnt(rs.getInt("COUNT"));
                sv.setReviewTitle(rs.getString("TITLE"));
                sv.setReviewContent(rs.getString("CONTENT"));
                sv.setReviewTime(rs.getString("WRITE_TIME"));

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
    
    //인기서비스 리스트
    public List<ServiceVo> listPopUser(Connection conn) {
        //TODO
        String sql = "SELECT * FROM ( SELECT ROWNUM NUM, S.SERVICE_NO, S.USER_NO, Z.CNT, S.SERVICE_TITLE, S.SERVICE_INTRO, S.IMAGE_LINK, S.CHARGE, S.CHARGE_UNIT_NO, C.CHARGE_UNIT, U.NICK,GRADE,review FROM SERVICE_INFO S left JOIN ( SELECT SERVICE_NO, COUNT(*) CNT FROM ZZIM GROUP BY SERVICE_NO ) Z ON S.SERVICE_NO = Z.SERVICE_NO JOIN \"USER\" U ON S.USER_NO = U.USER_NO JOIN CHARGE_UNIT C ON S.CHARGE_UNIT_NO = C.CHARGE_UNIT_NO left JOIN ( SELECT AVG(GRADE) AS GRADE, SERVICE_NO, COUNT(GRADE) AS REVIEW FROM REVIEW GROUP BY SERVICE_NO ) R ON s.SERVICE_NO = R.SERVICE_NO WHERE ROWNUM<=10 ) ORDER BY CNT DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ServiceVo> svList = new ArrayList<ServiceVo>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ServiceVo sv = new ServiceVo();
                sv.setServiceNo(Integer.parseInt(rs.getString("SERVICE_NO")));
                sv.setProfileImg(rs.getString("IMAGE_LINK"));
                sv.setHelper(rs.getString("NICK"));
                sv.setTitle(rs.getString("SERVICE_TITLE"));
                sv.setServiceIntro(rs.getString("SERVICE_INTRO"));
                sv.setCharge(Integer.parseInt(rs.getString("CHARGE")));
                sv.setChargeUnit(rs.getString("CHARGE_UNIT_NO"));
                sv.setChargeUnit(rs.getString("CHARGE_UNIT"));
                sv.setReviewAvg(rs.getInt("GRADE"));
                sv.setReviewCnt(rs.getInt("REVIEW"));

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
