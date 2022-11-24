package com.example.mybatis_psql_board.board.service;


import com.example.mybatis_psql_board.board.dto.CommentDto;

import java.util.List;

public interface CommentService {
    public List<CommentDto> commentListService(int bno);

    public List<CommentDto> commentDeleteListService(int cno);

    public int commentInsertService(CommentDto comment);

    public int commentUpdateService(CommentDto comment);

    public int commentDeleteService(int cno);
}
