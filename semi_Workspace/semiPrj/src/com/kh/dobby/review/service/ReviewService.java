package com.kh.dobby.review.service;

import static com.kh.dobby.common.JDBCTemplate.close;
import static com.kh.dobby.common.JDBCTemplate.commit;
import static com.kh.dobby.common.JDBCTemplate.getConnection;
import static com.kh.dobby.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.member.vo.MemberVo;
import com.kh.dobby.report.vo.ReportVo;
import com.kh.dobby.review.dao.ReviewDao;
import com.kh.dobby.review.vo.ReviewVo;

public class ReviewService {
    
    private final ReviewDao dao = new ReviewDao();

    public int reviewWrite(ReviewVo vo) {
        
        Connection conn = getConnection();
        
        int result = dao.insertReview(conn,vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result;

        
    
    }

    public List<ReviewVo> selectList(PageVo pv) {

        Connection conn = getConnection();
        
        List<ReviewVo> x = dao.selectList(conn, pv);
        
        close(conn);
        return x;
        
    
    }
    public List<ReviewVo> selectList2(PageVo pv) {

        Connection conn = getConnection();
        
        List<ReviewVo> x = dao.selectList2(conn, pv);
        
        close(conn);
        return x;
        
    
    }

    public ReviewVo selectOne(String postNo) {

        Connection conn = getConnection();
        ReviewVo vo = dao.selectOne(conn, postNo);
        
        close(conn);
        
        return vo;
    
    
    }

    public ReviewVo selectReviewOne(String postNo) {
       
        
        Connection conn = getConnection();
        ReviewVo vo = dao.selectReviewOne(conn,postNo);
        
        close(conn);
        return vo;
    }

    public int edit(ReviewVo vo) {
        Connection conn = getConnection();
        
        int result = dao.editOneByNo(conn, vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        
        close(conn);
        return result;
    
    }

    public int delete(String postNo) {
        
        
        Connection conn = getConnection();
        
        int result = dao.delete(conn, postNo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        return result ;
    }
    
    //?????? ???????????? ?????? ?????? ??????
    public int selectCount(MemberVo vo) {
        Connection conn = getConnection();
        
        int result=dao.selectCount(conn,vo);
        
        close(conn);
        
        return result;
    }

    public int writeReviewReply(ReviewVo vo) {

        Connection conn = getConnection();
        
        int result = dao.updateReviewReply(conn,vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        
        return result;
    }

    public int editReviewReply(ReviewVo vo) {

        Connection conn = getConnection();
        
        int result = dao.editReviewReply(conn, vo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        
        close(conn);
        return result;
    }

    public int deleteReviewReply(String postNo) {
        Connection conn = getConnection();
        
        int result = dao.deleteReviewReply(conn, postNo);
        
        if(result == 1) {
            commit(conn);
        }else {
            rollback(conn);
        }
        close(conn);
        return result ;

        
    }

    public ReviewVo selectReplyList(String postNo) {

        Connection conn = getConnection();
        ReviewVo vo = dao.selectReplyList(conn,postNo);
        
        close(conn);
        
        return vo;
    }    

}
