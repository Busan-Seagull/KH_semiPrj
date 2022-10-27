package com.kh.dobby.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.dobby.member.service.MemberService;
import com.kh.dobby.member.vo.MemberVo;


@WebServlet(urlPatterns = "/member/findidresult")
public class MemberIdFindResultController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
        String id=req.getParameter("id");
        String enrollDate=req.getParameter("enrollDate");
        
        MemberVo vo=null;
//        System.out.println(!"null".equals(id));
//        System.out.println(id==null);
        if(!(id==null&&enrollDate==null)) {
//            System.out.println("123");
            vo= new MemberVo();
            vo.setId(id);
            vo.setEnrollDate(enrollDate);
            req.setAttribute("vo", vo);
            
        }
        
        
        req.getRequestDispatcher("/WEB-INF/views/member/idFindResult.jsp").forward(req, resp);
        
       
    }  
    
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       System.out.println("아이디 찾기");
       
       resp.setContentType("text/plain; charset=UTF-8;");
       String name=req.getParameter("username");
       String phone=req.getParameter("userphone");
       
       MemberVo vo=new MemberVo();
       vo.setName(name);
       vo.setPhone(phone);
       PrintWriter out = resp.getWriter();
       MemberVo idFind = new MemberService().idfind(vo);
       // 디비 다녀오기 > DB 유효성 검사 > 결과 반환받기
       if(idFind!=null) {
           Gson gson =new Gson();
           String result =gson.toJson(idFind);
           System.out.println(result);
           
           out.write(result);
       }
       else {
           out.write("false");
       }
    }
       
}
