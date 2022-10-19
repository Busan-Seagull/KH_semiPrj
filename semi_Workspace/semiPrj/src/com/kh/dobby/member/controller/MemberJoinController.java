package com.kh.dobby.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.member.vo.MemberVo;

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
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String br_num = req.getParameter("br_num");
        String account = req.getParameter("account");
        
        MemberVo vo = new MemberVo();
        vo.getRightNo();
       
        
        
        
        
	}

}
