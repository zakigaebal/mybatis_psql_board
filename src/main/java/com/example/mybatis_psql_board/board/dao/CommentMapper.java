package com.example.mybatis_psql_board.board.dao;


import com.example.mybatis_psql_board.board.dto.CommentDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    // 댓글 개수
    public int commentCount() throws Exception;

    // 댓글 목록
    public List<CommentDto> commentList(int bno);

    public List<CommentDto> commentDeleteList(int cno);

    // 댓글 작성
    public int commentInsert(CommentDto comment);

    // 댓글 수정
    public int commentUpdate(CommentDto comment);

    // 댓글 삭제
    public int commentDelete(int cno);

}


