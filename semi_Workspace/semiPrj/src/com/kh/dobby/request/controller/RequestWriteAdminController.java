package com.kh.dobby.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/request/detail/adminrepeatcomplete")
public class RequestWriteAdminController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //데이터 가져오기
        
        //데이터 모으기
        
        //디비 다녀오기
        
        //화면 선택
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
