package com.kh.dobby.request.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request/detail")
public class DetailController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //데이터 꺼내기
        String bno = req.getParameter("bno");
        //데이터 뭉치기
        //DB 다녀오기
        RequestVo vo = new RequestService().selectOne(bno);
        //화면 선택
        req.getRequestDispatcher("/WEB-INF/views/request/detail.jsp").forward(req, resp);
        
        
    }
    
    
}
