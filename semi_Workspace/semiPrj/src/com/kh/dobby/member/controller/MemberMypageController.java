package com.kh.dobby.member.controller;

import java.io.File;
import java.io.IOException;

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
     
       

        if(loginMember != null) {
            req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
        }else {
            req.setAttribute("msg","로그인 후 이용해주세요.");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
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
         
        
           
         //=============== 파일 업로드 start ================
         
           
           //파일 정보 디비에 저장하기(파일이 있을 때)
           String rootpath=req.getServletContext().getRealPath("/");
            if(f.getSubmittedFileName().length() > 0) {
                avo=FileUploader.uploadFile(f,rootpath);
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
           req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
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
