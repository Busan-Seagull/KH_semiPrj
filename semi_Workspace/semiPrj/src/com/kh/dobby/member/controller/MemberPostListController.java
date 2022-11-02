package com.kh.dobby.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/mypostList")
public class MemberPostListController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("게시판 변경 시작");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain; charset=UTF-8;");
        
        HttpSession session=req.getSession();
        MemberVo loginMember=(MemberVo) session.getAttribute("loginMember");
        String no = loginMember.getUserNo();

        PrintWriter out = resp.getWriter();


        List<CommuVo> voList= new CommuService().selectMyList(no);
        

        
        Map<Object, Object> map = new HashMap<>();
        map.put("list", voList);
        
        Gson gson = new Gson();
        String json = gson.toJson(map);
        
        
        out.write(json);
       
     
    }

}
