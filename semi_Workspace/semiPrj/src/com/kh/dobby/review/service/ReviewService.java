package com.kh.dobby.review.service;

import static com.kh.dobby.common.JDBCTemplate.close;
import static com.kh.dobby.common.JDBCTemplate.commit;
import static com.kh.dobby.common.JDBCTemplate.getConnection;
import static com.kh.dobby.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.dobby.common.PageVo;
import com.kh.dobby.report.dao.ReportDao;
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

    public ReviewVo selectOne(String postNo) {

        Connection conn = getConnection();
        ReviewVo vo = dao.selectOne(conn, postNo);
        
        close(conn);
        
        return vo;
    
    
    }

}
