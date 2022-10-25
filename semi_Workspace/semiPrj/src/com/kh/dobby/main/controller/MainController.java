package com.kh.dobby.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dobby.banner.service.BannerService;
import com.kh.dobby.banner.vo.BannerVo;

@WebServlet(urlPatterns = "")
public class MainController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    List<BannerVo> list = new BannerService().selectList();
	    
	    if(list!=null) {
	        req.setAttribute("list", list);
	        req.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(req, resp);
	    }
	    
	}
	
}
