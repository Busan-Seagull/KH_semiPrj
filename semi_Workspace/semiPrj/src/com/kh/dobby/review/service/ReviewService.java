package com.kh.dobby.review.service;

import static com.kh.dobby.common.JDBCTemplate.close;
import static com.kh.dobby.common.JDBCTemplate.commit;
import static com.kh.dobby.common.JDBCTemplate.getConnection;
import static com.kh.dobby.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.dobby.report.dao.ReportDao;
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

}
