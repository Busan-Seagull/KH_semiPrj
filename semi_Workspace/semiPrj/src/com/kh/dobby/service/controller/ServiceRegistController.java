package com.kh.dobby.service.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceAttachmentVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/service/regist")
@MultipartConfig(location = "c:/upload", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024
        * 50, maxRequestSize = 1024 * 1024 * 50 * 5)
public class ServiceRegistController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
//        
//        if(loginMember==null) {
//            req.setAttribute("msg", "로그인 후 이용해주세요.");
//            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
//           
//        }else if(loginMember.getRightNo().equals(2)) {
        req.getRequestDispatcher("/WEB-INF/views/service/serviceRegistration.jsp").forward(req, resp);
//            return;
//        }else {
//            req.setAttribute("msg", "권한이 없습니다.");
//            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
//        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 세션 가져오기
        HttpSession s = req.getSession();

        // 로그인멤버 가져오기
        MemberVo loginMember = (MemberVo) s.getAttribute("loginMember");

        // 인코딩
        req.setCharacterEncoding("UTF-8");

        // 데이터 꺼내기
        String title = req.getParameter("service");
        String typeNo = req.getParameter("type-no");
        String chargeUnitNo = req.getParameter("charge-unit");
        String charge = req.getParameter("charge");
        String[] pTypeNo = req.getParameterValues("pay-type-no");
        String serviceIntro = req.getParameter("service-intro");
        String openTime = req.getParameter("open-time");
        String closeTime = req.getParameter("close-time");
        String helperExp = req.getParameter("helper-exp");
        String[] areaNo = req.getParameterValues("area-no");
        String serviceDetail = req.getParameter("service-detail");
        String paymentDetail = req.getParameter("payment-detail");

        System.out.println(pTypeNo.length);
        for (int i = 0; i < pTypeNo.length; i++) {
            System.out.println(pTypeNo[i]);
        }
        // 데이터 뭉치기
        ServiceVo sv = new ServiceVo();
        sv.setTitle(title);
        sv.setTypeNo(Integer.parseInt(typeNo));
        sv.setHelperNo(Integer.parseInt(loginMember.getUserNo()));
        sv.setChargeUnitNo(Integer.parseInt(chargeUnitNo));
        sv.setCharge(Integer.parseInt(charge));
        if (pTypeNo.length == 1) {
            sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
            sv.setpTypeNo_2(0);
            sv.setpTypeNo_3(0);
        } else if (pTypeNo.length == 2) {
            sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
            sv.setpTypeNo_2(Integer.parseInt(pTypeNo[1]));
            sv.setpTypeNo_3(0);
        } else {
            sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
            sv.setpTypeNo_2(Integer.parseInt(pTypeNo[1]));
            sv.setpTypeNo_3(Integer.parseInt(pTypeNo[2]));
        }
        sv.setServiceIntro(serviceIntro);
        sv.setOpenTime(openTime);
        sv.setCloseTime(closeTime);
        sv.setHelperExp(Integer.parseInt(helperExp));
        sv.setAreaNo_1(Integer.parseInt(areaNo[0]));
        sv.setAreaNo_2(Integer.parseInt(areaNo[1]));
        sv.setAreaNo_3(Integer.parseInt(areaNo[2]));
        sv.setAreaNo_4(Integer.parseInt(areaNo[3]));
        sv.setAreaNo_5(Integer.parseInt(areaNo[4]));
        sv.setServiceDetail(serviceDetail);
        sv.setPaymentDetail(paymentDetail);

        // 데이터 뭉치기 - 첨부파일
        Part f = req.getPart("profile-img");
        Part s1 = req.getPart("service-img-1");
        Part s2 = req.getPart("service-img-2");
        Part s3 = req.getPart("service-img-3");
        Part s4 = req.getPart("service-img-4");

        ServiceAttachmentVo s_attachmentVo = null;

        // 첨부파일 준비
        String rootPath = req.getServletContext().getRealPath("/");
        if (f.getSubmittedFileName().length() > 0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(f, rootPath);
            sv.setProfileImg(s_attachmentVo.getFilePath());
        }
        if (s1.getSubmittedFileName().length() > 0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s1, rootPath);
            sv.setServicePic_1(s_attachmentVo.getFilePath());
        }
        if (s2.getSubmittedFileName().length() > 0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s2, rootPath);
            sv.setServicePic_2(s_attachmentVo.getFilePath());
        }
        if (s3.getSubmittedFileName().length() > 0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s3, rootPath);
            sv.setServicePic_3(s_attachmentVo.getFilePath());
        }
        if (s4.getSubmittedFileName().length() > 0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s4, rootPath);
            sv.setServicePic_4(s_attachmentVo.getFilePath());
        }

        // 데이터 뭉치기 - 확인

        System.out.println(sv);

        // 디비

        int result = new ServiceService().regist(sv);

        // 화면선택

        if (result == 1) {
            s.setAttribute("alertmsg", "서비스 등록 완료");
            resp.sendRedirect("/dobby/mypage/service");
        } else {
            req.setAttribute("msg", "서비스 등록 실패");
            req.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(req, resp);
        }

    }

}
