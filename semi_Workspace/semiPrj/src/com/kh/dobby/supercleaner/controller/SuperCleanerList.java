package com.kh.dobby.supercleaner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.supercleaner.service.SuperCleanerService;
import com.kh.dobby.supercleaner.vo.ZipVo;

@WebServlet(urlPatterns = "/superyojeong")
public class SuperCleanerList extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        List<ZipVo> list = new SuperCleanerService().getList();
        
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/views/supercleaner/InkkiZipyojung.jsp").forward(req, resp);
    }
}
