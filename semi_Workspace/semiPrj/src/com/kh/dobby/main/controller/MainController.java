package com.kh.dobby.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.banner.service.BannerService;
import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.member.vo.MemberVo;

@WebServlet(urlPatterns = "")
public class MainController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    List<BannerVo> list = new BannerService().selectList();
	    HttpSession s = req.getSession();
	    
	    MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
	    
	    if(s.getAttribute("mode")==null) {
	        if(loginMember!=null&&"3".equals(loginMember.getRightNo())) {
	            req.getRequestDispatcher("WEB-INF/views/admin/admin.jsp").forward(req, resp);
	            return;
	        }  
	    }
	    
	    if(list!=null) {
	        req.setAttribute("list", list);
	        req.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(req, resp);
	    }else {
	        req.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(req, resp);
	    }
	    
	}
	
}
