package com.kh.dobby.banner.vo;

public class BannerVo {

    public BannerVo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public BannerVo(String bannerNo, String bTypeNo, String title, String imgLink, String link) {
        super();
        this.bannerNo = bannerNo;
        this.bTypeNo = bTypeNo;
        this.title = title;
        this.imgLink = imgLink;
        this.link = link;
    }

    private String bannerNo;
    private String bTypeNo;
    private String title;
    private String imgLink;
    private String link;

    public String getBannerNo() {
        return bannerNo;
    }

    public void setBannerNo(String bannerNo) {
        this.bannerNo = bannerNo;
    }

    public String getbTypeNo() {
        return bTypeNo;
    }

    public void setbTypeNo(String bTypeNo) {
        this.bTypeNo = bTypeNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "BannerVo [bannerNo=" + bannerNo + ", bTypeNo=" + bTypeNo + ", title=" + title + ", imgLink=" + imgLink
                + ", link=" + link + "]";
    }

}
