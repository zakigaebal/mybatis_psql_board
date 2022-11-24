package com.example.mybatis_psql_board.board.dto;

import java.util.Date;

public class CommentDto {

    private int cno;
    private int bno;

    private int replyIdx;

    private String content;
    private String writer;
    private Date reg_date;

    public int getReplyIdx() {
        return replyIdx;
    }

    public void setReplyIdx(int replyIdx) {
        this.replyIdx = replyIdx;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }



    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }



}

