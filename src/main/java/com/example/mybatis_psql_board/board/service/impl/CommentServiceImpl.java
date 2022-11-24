package com.example.mybatis_psql_board.board.service.impl;


import com.example.mybatis_psql_board.board.dao.CommentMapper;
import com.example.mybatis_psql_board.board.dto.CommentDto;
import com.example.mybatis_psql_board.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper mCommentMapper;

    @Override
    public List<CommentDto> commentListService(int bno){

        return mCommentMapper.commentList(bno);
    }

    @Override
    public List<CommentDto> commentDeleteListService(int cno){
        return mCommentMapper.commentDeleteList(cno);
    }

    public int commentInsertService(CommentDto comment){

        return mCommentMapper.commentInsert(comment);
    }

    public int commentUpdateService(CommentDto comment){

        return mCommentMapper.commentUpdate(comment);
    }

    public int commentDeleteService(int cno){

        return mCommentMapper.commentDelete(cno);
    }
}



