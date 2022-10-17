package com.kh.dobby.common;

public class PageVo {

    public int getListCount() {
        return listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(int pageLimit) {
        this.pageLimit = pageLimit;
    }

    public int getBoardLimit() {
        return boardLimit;
    }

    public void setBoardLimit(int boardLimit) {
        this.boardLimit = boardLimit;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    @Override
    public String toString() {
        return "PageVo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
                + ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
                + endPage + "]";
    }

    public PageVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public PageVo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
            int endPage) {
        super();
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;
        this.maxPage = maxPage;
        this.startPage = startPage;
        this.endPage = endPage;
    }

    public PageVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        super();
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;
        this.maxPage = (int) Math.ceil((double) listCount / boardLimit);
        this.startPage = currentPage - (pageLimit-1)/2;
        this.endPage = currentPage + (pageLimit-1)/2;
        
        if(this.endPage > this.maxPage) {
            this.endPage = this.maxPage;
        }
       
    }

    private int listCount; // 총 게시글 갯수
    private int currentPage; // 현재 페이지
    private int pageLimit; // 페이징 바 최대갯수
    private int boardLimit; // 게시글 최대갯수

    // 위의 4개 값을 이용해서 아래 3개 값을 구함

    private int maxPage; // 가장 마지막 페이지
    private int startPage; // 페이징바 시작 페이지
    private int endPage; // 페이징바 종료 페이지

}
