package com.kh.dobby.request.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;
import com.kh.dobby.zzim.service.ZzimService;
import com.kh.dobby.zzim.vo.ZzimVo;

@WebServlet(urlPatterns = "/request/detail")
public class DetailController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //데이터 꺼내기
        String bno = req.getParameter("bno"); // 쿼리스트링 bno
        
        //데이터 가져오기
        
        //세선가져오기
        HttpSession session = req.getSession();
        
        //로그인 세션 데이터 가져옴
        MemberVo nowlogindata = (MemberVo) session.getAttribute("loginMember");
        
        //로그인 검사
        
/*        if(nowlogindata==null) {
            req.setAttribute("msg", "로그인 후 이용해주세요");
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        } 
*/
        
            
            //아이디 가져오기
            
            String userno = nowlogindata.getUserNo();
            
            //System.out.println(userno);
            
            
            //데이터 뭉치기
            //ZzimVo zzimvo = new ZzimVo();
            
            //zzimvo.setUserno(userno);
            
            
            //DB 다녀오기
            RequestVo vo = new RequestService().selectOne(bno);
            
            //DB다녀오기-로그인멤버
//          ZzimVo zzimdata = new ZzimService().loaddata(zzimvo);
//          session.setAttribute("zzimdata", zzimdata);
//            
            //System.out.println(userno);
            
            
            
            //유저넘버 설정
            String userid = nowlogindata.getId();
            session.setAttribute("userno", userno);
            
            req.setAttribute("nowlogindata", nowlogindata);
            System.out.println(userid);
            
            //DB의 vo?
            
            req.setAttribute("vo", vo);
            
        
       
        
        
        
        //화면 선택
        req.getRequestDispatcher("/WEB-INF/views/request/detail.jsp").forward(req, resp);
        
        
    }
    
    
}
