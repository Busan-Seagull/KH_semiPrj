package com.kh.dobby.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;


@WebServlet(urlPatterns = "/member/findpwdresult")
public class MemberPwdFindResultController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String phone=req.getParameter("phone");
        String enrollDate=req.getParameter("enrollDate");
        
        MemberVo vo=null;
//        System.out.println(!"null".equals(id));
//        System.out.println(id==null);
        if(!(phone==null&&enrollDate==null)) {
//            System.out.println("123");
            vo= new MemberVo();
            vo.setPhone(phone);;
            vo.setEnrollDate(enrollDate);
            req.setAttribute("vo", vo);
            
        }
        
        req.getRequestDispatcher("/WEB-INF/views/member/pwdFindResult.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("비밀번호 찾기");
        
        resp.setContentType("text/plain; charset=UTF-8;");
        String id=req.getParameter("userid");
        String email=req.getParameter("useremail");
        
        MemberVo vo=new MemberVo();
        vo.setId(id);
        vo.setEmail(email);
        
        PrintWriter out = resp.getWriter();
        MemberVo pwdFind = new MemberService().pwdfind(vo);
        // 디비 다녀오기 > DB 유효성 검사 > 결과 반환받기
        if(pwdFind!=null) {
            Gson gson =new Gson();
            String result =gson.toJson(pwdFind);
            System.out.println(result);
            
            out.write(result);
        }
        else {
            out.write("false");
        }
     
    }

}
