package com.kh.dobby.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.dobby.common.AttachmentVo;
import com.kh.dobby.common.FileUploader;
import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.pay.service.PayService;
import com.kh.dobby.payVo.PayVo;
import com.kh.dobby.point.service.PointService;
import com.kh.dobby.point.vo.PointVo;
import com.kh.dobby.report.service.ReportService;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;
import com.kh.dobby.zzim.service.ZzimService;
import com.kh.dobby.zzim.vo.ZzimVo2;


@WebServlet(urlPatterns = "/member/mypage")
@MultipartConfig(
      fileSizeThreshold = 1024*1024,
      maxFileSize = 1024*1024*50,
      maxRequestSize = 1024*1024*50*5
      )

public class MemberMypageController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //화면
        HttpSession s = req.getSession();
        MemberVo loginMember=(MemberVo) s.getAttribute("loginMember");
        
        int userNo = 0;
        if (loginMember == null) {
            req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
            return;
        } else {
            userNo = Integer.parseInt(loginMember.getUserNo());
//            System.out.println(userNo);
        }
     
        String pno = req.getParameter("pno");
        req.setAttribute("pno", pno);
        
//        하나님 신고내역 불러오기
        String writer =loginMember.getNick();
        List<ReportVo> voList = new ArrayList<ReportVo>();
        
        voList = new ReportService().selectReportList(writer);
        req.setAttribute("voList",voList);
        
//        임정한 포인트 내역
        List<PointVo> pList = new PointService().getList(loginMember.getUserNo());
        int point = new PointService().getSumPoint(loginMember.getUserNo());
        
        if(pList!=null) {
            req.setAttribute("pList", pList);
            req.setAttribute("point", point);
        }
        
//        임정한 찜목록
        List<ZzimVo2> zList = new ZzimService().getZzimList(loginMember.getUserNo());
        req.setAttribute("zList", zList);
        
//       량우님 결제
        // 유저 넘버로 결제 내역 받아오기
        List<PayVo> myPay = new PayService().listHistory(userNo);
        
//        System.out.println(myPay);

        req.setAttribute("myPay", myPay);
        
//        량우님 서비스
        // 유저 넘버로 서비스 리스트 받아오기
        List<ServiceVo> myService = new ServiceService().listService(userNo);
        
//        System.out.println(myService);

        req.setAttribute("myService", myService);

//        성공시
        if(loginMember != null) {
            req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
        }

      
    }
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session=req.getSession();
        
        // 데이터 가져오기
           String userRight = req.getParameter("userRight");
           String memberId = req.getParameter("memberId");
           String memberPwd = req.getParameter("memberPwd1");
           String memberNick = req.getParameter("memberNick");
           String name = req.getParameter("memberName");
           String phone = req.getParameter("phone1")+req.getParameter("phone2")+req.getParameter("phone3");
           String email = req.getParameter("Email1")+"@"+req.getParameter("Email2");
           String address = req.getParameter("addr")+","+req.getParameter("addr-detail");
           String br_num = req.getParameter("br_num1")+req.getParameter("br_num2")+req.getParameter("br_num3");
           String account = req.getParameter("account1")+","+req.getParameter("account2");
        
           MemberVo loginMember=(MemberVo) session.getAttribute("loginMember");
           String no = loginMember.getUserNo();
         
           Part f = req.getPart("f");
           //파일 없으면 널값
           AttachmentVo avo = null;
           String rootpath=null;
        
           
         //=============== 파일 업로드 start ================
         
           if(f!=null) {
             //파일 정보 디비에 저장하기(파일이 있을 때)
              rootpath=req.getServletContext().getRealPath("/");
                if(f.getSubmittedFileName().length() > 0) {
                    avo=FileUploader.uploadFile(f,rootpath);
                }
               
           }
           
           
           //=============== 파일 업로드 end ==================
           
           MemberVo vo = new MemberVo();
           vo.setUserNo(no);
           vo.setRightNo(userRight);
           vo.setId(memberId.replaceAll(" ", ""));
           vo.setPwd(memberPwd.replaceAll(" ", ""));
           vo.setNick(memberNick.replaceAll(" ", ""));
           vo.setName(name.replaceAll(" ", ""));
           vo.setPhone(phone.replaceAll(" ", ""));
           vo.setEmail(email.replaceAll(" ", ""));
           vo.setAddress(address.replaceAll(" ", ""));
           vo.setBr_num(br_num.replaceAll(" ", ""));
           vo.setAccount(account.replaceAll(" ", ""));
           
         
          System.out.println(vo);
        
           
       
           
        
        //디비 다녀오기
        MemberVo updatedMember = new MemberService().edit(vo,avo);
        
        //화면선택
        
        if(updatedMember !=null) {
//            req.getSession().setAttribute("msg", "내 정보 수정성공!");
            req.getSession().setAttribute("loginMember", updatedMember);
//           req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
            resp.sendRedirect("/dobby/member/mypage?pno=1");
        }else {
            if(avo!=null) { 
                String savePath =rootpath+avo.getFilePath()+"/"+avo.getChangeName();
                new File(savePath).delete();
            }
            
             req.setAttribute("msg","게시물 작성 실패ㅠ" );
             req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);

        }
    }

}
