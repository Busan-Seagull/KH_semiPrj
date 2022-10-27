package com.kh.dobby.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.dobby.banner.service.BannerService;
import com.kh.dobby.banner.vo.BannerVo;
import com.kh.dobby.common.AttachmentVo;
import com.kh.dobby.common.FileUploader;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.service.controller.ServiceFileUploader;

@WebServlet(urlPatterns = "/addBanner")
@MultipartConfig
(
  fileSizeThreshold = 1024 * 1024 ,
  maxFileSize = 1024 * 1024 * 50 ,
  maxRequestSize = 1024 * 1024 * 50 * 5
)
public class AddBannerController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
        if(loginMember==null || !"3".equals(loginMember.getRightNo())) {
            resp.sendRedirect("/dobby");
            return;
        }
        req.getRequestDispatcher("WEB-INF/views/admin/addBanner.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String link = req.getParameter("link-name");
        Part f = req.getPart("file");
        
        AttachmentVo avo = new AttachmentVo();
        BannerVo bvo = new BannerVo();
        
        String rootPath = req.getServletContext().getRealPath("/");        
        if (f.getSubmittedFileName().length() > 0) {
            avo = FileUploader.uploadFile(f, rootPath);
            bvo.setImgLink("/dobby/"+avo.getFilePath()+"/"+avo.getChangeName());
        }
        
        bvo.setLink(link);
        
        int result = new BannerService().insert(bvo);
        
        if(result==1) {
            resp.sendRedirect("/dobby");
        }else {
            resp.sendRedirect("/dobby/addBanner");
        }
        
        
    }
}
