package com.example.mybatis_psql_board.board.dao;


import com.example.mybatis_psql_board.board.dto.BoardDto;
import com.example.mybatis_psql_board.board.dto.FileDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {
    //게시글 개수
    public int boardCount() throws Exception;

    //게시글 목록
    public List<BoardDto> boardList();

    //게시글 상세
    public BoardDto boardDetail(int bno);

    //게시글 작성
    public int boardInsert(BoardDto board);

    //게시글 수정
    public int boardUpdate(BoardDto board);

    //게시글 삭제
    public int boardDelete(int bno);

    // BoardMapper.java
    public int fileInsert(FileDto file);

    //파일 상세
    public FileDto fileDetail(int bno);

    public int boardHit(int bno);


}
