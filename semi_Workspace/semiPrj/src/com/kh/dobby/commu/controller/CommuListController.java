package com.kh.dobby.commu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;

@WebServlet (urlPatterns = "/commu/list")
public class CommuListController extends HttpServlet {
    
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String page = req.getParameter("pno");
    int currentPage = 1;

    if(page!=null) {
        currentPage = Integer.parseInt(page);\
    }
    //new PageVo(글갯수, 현재페이지, 5고정(페이징갯수), 한페이지에 몇개의 글);
    PageVo pv = new PageVo(100, currentPage, 5, 10);

    
    //디비 다녀오기 
    List<CommuVo> voList= new CommuService().selectList(pv);
    
    req.setAttribute("voList", voList);
    req.setAttribute("pv", pv);
    
    
    req.getRequestDispatcher("/WEB-INF/views/commu/list.jsp").forward(req, resp);
}

}
