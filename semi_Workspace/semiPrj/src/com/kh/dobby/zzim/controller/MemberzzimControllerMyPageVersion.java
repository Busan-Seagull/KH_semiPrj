package com.kh.dobby.zzim.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.common.JDBCTemplate;
import com.kh.dobby.member.controller.MemberLoginController;
import com.kh.dobby.member.dao.MemberDao;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.zzim.service.ZzimService;
import com.kh.dobby.zzim.vo.ZzimVo;

@WebServlet(urlPatterns = "/member/mypage/zzim")
public class MemberzzimControllerMyPageVersion extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        
        //데이터 가져오기
        
            //세선가져오기
            HttpSession session = req.getSession();
            
            //로그인 세션 데이터 가져옴
            MemberVo nowlogindata = (MemberVo) session.getAttribute("loginMember");
            
            //로그인 검사
            
            if(nowlogindata==null) {
                req.setAttribute("msg", "로그인 후 이용해주세요");
                req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
            } 
            //아이디 가져오기
            
            String userno = nowlogindata.getUserNo();
            
            //System.out.println(userno);
           
        
        
        //데이터 뭉치기
            
            //찜테이블은 원래 유저넘버랑 서비스넘버밖에 없음
            //유저넘버는 이미 가져옴, 유저넘버는 SQL문의 유저넘버 란에 집어넣을거임
            
            //String servicename; // 타 테이블 칼럼에 해당하는 SERVICE_TITLE 가져와야..
                                // SERVICE_NO를 타 테이블(SERVICE_NO FROM SERVICE_INFO)랑 일치시키고 
                                // ZZIM.SERVICE_NO == SERVICE_INFO.SERVICE_NO
                                
            
            //String profileimg; // 타 테이블의 칼럼(IMAGE_LINK FROM SERVICE_INFO)을 가져와야..
                               // IMAGE_LINK는 SERVICE_INFO테이블의 SERVICE_NO가 ZZIM테이블의 SERVICE_NO와 같아야함
                               // IMAGE_LINK FROM SERVICE_INFO WHERE ZZIM.SERVICE_NO = SERVICE_INFO.SERVICE_NO
            
            //우선, 저 3개만 가져오는 걸로 결론.. 서비스 화면이 안나옴.... 페이징 작업도 어떻게 하는지도 모르겠음..
            
            ZzimVo zzimvo = new ZzimVo();
            
            zzimvo.setUserno(userno);
            
            
        //디비 다녀오기    
        ZzimVo zzimdata = new ZzimService().loaddata(zzimvo);

        session.setAttribute("zzimdata", zzimdata);
        session.setAttribute("userno", userno);
        System.out.println("컨트롤러 넘버 : " + session.getAttribute("userno"));
            
        //화면 선택
        req.getRequestDispatcher("/mypagetest/mypage06.jsp").forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
