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

import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.CodeVo;
import com.kh.dobby.service.vo.ServiceAttachmentVo;
import com.kh.dobby.service.vo.ServiceVo;

@WebServlet(urlPatterns = "/service/modify")
@MultipartConfig(
        location = "c:/upload" ,
        fileSizeThreshold = 1024 * 1024 ,
        maxFileSize = 1024 * 1024 * 50 ,
        maxRequestSize = 1024 * 1024 * 50 * 5
        )
public class ServiceModifyController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 데이터 꺼내기

        String sno = req.getParameter("sno");

        if (sno != null) {
            ServiceVo sv = new ServiceService().selectOne(sno);
            CodeVo cv = new ServiceService().changeCode(sv);
            
            req.setAttribute("cv", cv);
            req.setAttribute("sv", sv);
            
            //세션 가져오기
            HttpSession s = req.getSession();
            s.setAttribute("sv", sv);
            System.out.println(sv);
            
            req.getRequestDispatcher("/WEB-INF/views/service/serviceModification.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/WEB-INF/views/service/serviceModification.jsp").forward(req, resp);
            System.out.println("정보가 없어요....!");
        }

    }
        
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        //세션 가져오기
        HttpSession s = req.getSession();
        
        //서비스넘버 가져오기
        ServiceVo svOrigin = (ServiceVo)s.getAttribute("sv");
        
        //인코딩
        req.setCharacterEncoding("UTF-8");
        
        //데이터 꺼내기
        String title = req.getParameter("service");
        String chargeUnitNo = req.getParameter("charge-unit");
        String charge = req.getParameter("charge");
        String[] pTypeNo = req.getParameterValues("pay-type-no");
        String serviceIntro = req.getParameter("service-intro");
        String openTime = req.getParameter("open-time");
        String closeTime = req.getParameter("close-time");
        String helperExp = req.getParameter("helper-exp");
        String[] areaNo = req.getParameterValues("area-no");
        String serviceDetail =req.getParameter("service-detail");
        String paymentDetail = req.getParameter("payment-detail");
        
        //데이터 뭉치기
        ServiceVo sv = new ServiceVo();
        sv.setTitle(title);
        sv.setChargeUnitNo(Integer.parseInt(chargeUnitNo));
        if (charge == null) {
            sv.setCharge(0);
        } else {
            sv.setCharge(Integer.parseInt(charge));
        }
        if (pTypeNo != null) {
            if (pTypeNo.length == 1) {
                sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
                sv.setpTypeNo_2(0);
                sv.setpTypeNo_3(0);
            } else if (pTypeNo.length == 2) {
                sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
                sv.setpTypeNo_2(Integer.parseInt(pTypeNo[1]));
                sv.setpTypeNo_3(0);
            } else if (pTypeNo.length == 3) {
                sv.setpTypeNo_1(Integer.parseInt(pTypeNo[0]));
                sv.setpTypeNo_2(Integer.parseInt(pTypeNo[1]));
                sv.setpTypeNo_3(Integer.parseInt(pTypeNo[2]));
            }
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
        sv.setServiceNo(svOrigin.getServiceNo());
        
        System.out.println(sv);
        
        //데이터 뭉치기 - 첨부파일
        Part f = req.getPart("profile-img");
        Part s1 = req.getPart("service-img-1");
        Part s2 = req.getPart("service-img-2");
        Part s3 = req.getPart("service-img-3");
        Part s4 = req.getPart("service-img-4");
        
        ServiceAttachmentVo s_attachmentVo = null;
       
        
        //첨부파일 준비
        String rootPath = req.getServletContext().getRealPath("/");
        if(f.getSubmittedFileName().length()>0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(f, rootPath);
            sv.setProfileImg(s_attachmentVo.getFilePath());
        }
        if(s1.getSubmittedFileName().length()>0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s1, rootPath);
            sv.setServicePic_1(s_attachmentVo.getFilePath());
        }
        if(s2.getSubmittedFileName().length()>0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s2, rootPath);
            sv.setServicePic_2(s_attachmentVo.getFilePath());
        }
        if(s3.getSubmittedFileName().length()>0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s3, rootPath);
            sv.setServicePic_3(s_attachmentVo.getFilePath());
        }
        if(s4.getSubmittedFileName().length()>0) {
            s_attachmentVo = ServiceFileUploader.uploadFile(s4, rootPath);
            sv.setServicePic_4(s_attachmentVo.getFilePath());
        }
        
        
        //디비
        
        int result = new ServiceService().modify(sv);
        
        //화면선택
        
        if(result == 1) {
            s.setAttribute("alertmsg", "서비스 정보 수정 완료");
            resp.sendRedirect("/dobby/mypage/service");
        }else {
            req.setAttribute("msg", "서비스 등록 실패");
            req.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(req, resp);
        }
        
        
    }

}
