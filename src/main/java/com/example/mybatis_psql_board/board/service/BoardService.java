package com.example.mybatis_psql_board.board.service;


import com.example.mybatis_psql_board.board.dto.BoardDto;
import com.example.mybatis_psql_board.board.dto.FileDto;

import java.util.List;

public interface BoardService {


    public List<BoardDto> boardListService();

    public BoardDto boardDetailService(int bno);

    public int boardInsertService(BoardDto board);

    public int boardUpdateService(BoardDto board);

    public int boardDeleteService(int bno);

    //BoardService.java
    public int fileInsertService(FileDto file);

    public FileDto fileDetailService(int bno);

}
