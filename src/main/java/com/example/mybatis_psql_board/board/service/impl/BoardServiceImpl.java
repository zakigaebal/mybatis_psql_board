package com.example.mybatis_psql_board.board.service.impl;


import com.example.mybatis_psql_board.board.dao.BoardMapper;
import com.example.mybatis_psql_board.board.dto.BoardDto;
import com.example.mybatis_psql_board.board.dto.FileDto;
import com.example.mybatis_psql_board.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    //@Autowird를 사용하면 Bean이 자동으로 만들어진다.
    @Autowired
    private BoardMapper mBoardMapper;
    public List<BoardDto> boardListService(){

        return mBoardMapper.boardList();
    }

    @Override
    public BoardDto boardDetailService(int bno){

        return mBoardMapper.boardDetail(bno);
    }
    @Override
    public int boardInsertService(BoardDto board){

        return mBoardMapper.boardInsert(board);
    }
    @Override
    public int boardUpdateService(BoardDto board){

        return mBoardMapper.boardUpdate(board);
    }
    @Override
    public int boardDeleteService(int bno){

        return mBoardMapper.boardDelete(bno);
    }
    @Override
    //BoardService.java
    public int fileInsertService(FileDto file){
        return mBoardMapper.fileInsert(file);
    }
    @Override
    public FileDto fileDetailService(int bno){

        return mBoardMapper.fileDetail(bno);
    }

}

