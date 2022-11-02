package com.kh.dobby.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.admin.service.StatisticsService;
import com.kh.dobby.banner.service.BannerService;
import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.commu.service.CommuService;
import com.kh.dobby.commu.vo.CommuVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.service.service.ServiceService;
import com.kh.dobby.service.vo.ServiceVo;
import com.kh.dobby.supercleaner.service.SuperCleanerService;
import com.kh.dobby.supercleaner.vo.ZipVo;
import com.kh.dobby.zzim.service.ZzimService;
import com.kh.dobby.zzim.vo.ZzimVo2;

@WebServlet(urlPatterns = "")
public class MainController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    HttpSession s = req.getSession();
	    
	    MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
	    
	    if(s.getAttribute("mode")==null) {
	        if(loginMember!=null&&"3".equals(loginMember.getRightNo())) {
	            req.getRequestDispatcher("WEB-INF/views/admin/admin.jsp").forward(req, resp);
	            return;
	        }  
	    }
	    
       List<BannerVo> list = new BannerService().selectList();
       List<CommuVo> cList = new CommuService().selectMainList();
       List<ZipVo> zList = new SuperCleanerService().getList();
       List<ServiceVo> sList = new ServiceService().listPopUser();
       
       StatisticsService as = new StatisticsService();
       
       int userCount = as.getUserCount(1);
       int dobbyCount = as.getUserCount(2);
       int serviceCount = as.getServiceCount();
       int successCount = as.getSuccessServiceCount();
       
       req.setAttribute("userCount", userCount);
       req.setAttribute("dobbyCount", dobbyCount);
       req.setAttribute("serviceCount", serviceCount);
       req.setAttribute("successCount", successCount);
       
       if(loginMember!=null) {
           List<ZzimVo2> zzList = new ZzimService().getZzimList(loginMember.getUserNo());     
           req.setAttribute("zzList", zzList);
       }

	    if(list!=null) {
            req.setAttribute("zList", zList);
            req.setAttribute("sList", sList);
            req.setAttribute("cList", cList);
            req.setAttribute("list", list);
            req.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(req, resp);
	    }else {
	        req.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(req, resp);
	    }
	    
	}
	
}
