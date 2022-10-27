package com.kh.dobby.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.member.vo.RightVo;


@WebServlet(urlPatterns = "/member/mypage")
public class MemberMypageController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //인코딩
        req.setCharacterEncoding("UTF-8");
        HttpSession session=req.getSession();
        
        // 데이터 꺼내기
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
        
        MemberVo vo = new MemberVo();
        vo.setRightNo(userRight);
        vo.setId(memberId);
        vo.setPwd(memberPwd);
        vo.setNick(memberNick);
        vo.setName(name);
        vo.setPhone(phone);
        vo.setEmail(email);
        vo.setAddress(address);
        
//        RightVo rightvo = null;
//        
//        //집요정일 경우.
//        if(vo.getRightNo().equals("2")) {
//            rightvo = new RightVo();
//            rightvo.setBr_num(br_num);
//            rightvo.setAccount(account);
//        }
        
        //디비 다녀오기
        MemberVo updatedMember = new MemberService().edit(vo);
        
        //화면선택
        
        if(updatedMember !=null) {
            req.getSession().setAttribute("alertMsg", "내 정보 수정성공!");
            req.getSession().setAttribute("loginMember", updatedMember);
             resp.sendRedirect("/dobby/member/mypage");
        }else {
            req.setAttribute("msg", "내 정보 수정 실패ㅠㅠ!");
            req.getRequestDispatcher("/views/common/error.jsp").forward(req, resp);
        }
    }

}
