package com.kh.dobby.member.controller;

import java.io.IOException;

import javax.crypto.spec.IvParameterSpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.member.vo.RightVo;

@WebServlet (urlPatterns = "/member/join")
public class MemberJoinController extends HttpServlet  {    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
    }
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	    
	    req.setCharacterEncoding("UTF-8");
	    
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
        
        RightVo rightvo = null;
        //집요정일 경우.
        if(vo.getRightNo().equals("2")) {
            rightvo = new RightVo();
            rightvo.setBr_num(br_num);
            rightvo.setAccount(account);
        }
      
        
     // 디비 다녀오기
        int result = new MemberService().join(vo,rightvo);
        
        // 화면 선택
        if(result == 1) {
            //회원가입 성공
            req.getSession().setAttribute("alertMsg", "회원가입 성공!");
            resp.sendRedirect("/dobby");
        }else {
            //회원가입 실패
            req.getSession().setAttribute("msg", "회원가입 실패!");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }

       
       
        
        
        
        
	}

}
