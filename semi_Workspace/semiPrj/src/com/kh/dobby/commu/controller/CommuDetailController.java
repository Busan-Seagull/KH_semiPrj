package com.kh.dobby.commu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;

@WebServlet(urlPatterns = "/commu/detail")
public class CommuDetailController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bno = req.getParameter("bno");
       

        CommuVo vo=new CommuService().selectOne(bno);
        req.setAttribute("vo", vo);
//        req.setAttribute("attachmentVo", attachmentVo);
        
        req.getRequestDispatcher("/WEB-INF/views/commu/detail.jsp").forward(req, resp);
       
    }

}
