package com.kh.dobby.request.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.request.service.RequestService;
import com.kh.dobby.request.vo.RequestVo;

@WebServlet(urlPatterns = "/request/admindetail")
public class RequestAdminWriteController extends HttpServlet{
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
        
        
        //데이터 뭉치기
        
        
        //DB 다녀오기
        RequestVo vo = new RequestService().selectOne(bno);
        
        //유저넘버 설정
        String userid = nowlogindata.getId();
        session.setAttribute("userno", userno);
        
        req.setAttribute("nowlogindata", nowlogindata);
        System.out.println(userid);
    
        
        //화면 선택
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/WEB-INF/views/request/admindetail.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //세션 가져옴
        HttpSession session = req.getSession();
        
        //로그앤멤버 가져옴
        MemberVo loginvoList = (MemberVo) session.getAttribute("nowlogindata");
        
        //인코딩
        
        //데이터 꺼내기
        String repeatcontent = req.getParameter("repeatcontent");
        String bno = req.getParameter("bno"); // 쿼리스트링 bno
        System.out.println(repeatcontent);
        //데이터 뭉치기
        RequestVo vo = new RequestVo();
        vo.setRepeatContent(repeatcontent);
        System.out.println(vo.getRepeatContent());
        //디비 다녀오기
        int result = new RequestService().requestAdminEdit(bno, vo);
        
        
        //화면 선택
        //화면 선택 - 자바스크립트연동
        if(result==1) {
            //session.setAttribute("alertMsg", "작성 성공");
            resp.sendRedirect("/dobby");
        } else {
            //게시글 작성실패
            //session.setAttribute("alertMsg", "작성 실패");
            resp.sendRedirect("/WEB-INF/views/common/error.jsp");
        }
        
    }
    
    
}
