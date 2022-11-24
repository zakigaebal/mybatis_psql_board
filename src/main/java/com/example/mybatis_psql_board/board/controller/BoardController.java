package com.example.mybatis_psql_board.board.controller;


import com.example.mybatis_psql_board.board.dao.BoardMapper;
import com.example.mybatis_psql_board.board.dto.BoardDto;
import com.example.mybatis_psql_board.board.dto.FileDto;
import com.example.mybatis_psql_board.board.service.impl.BoardServiceImpl;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@Controller
public class BoardController {
    @Autowired
    BoardServiceImpl mBoardService;
    @Autowired
    BoardMapper boardDao;

    @RequestMapping("/") //게시판 리스트 화면 호출
    private String boardHome(Model model){
        model.addAttribute("list", mBoardService.boardListService());
        return "board/list"; //생성할 jsp
    }

    @RequestMapping("/admin") //게시판 리스트 화면 호출
    private String boardAdmin(Model model){
        model.addAttribute("list", mBoardService.boardListService());
        return "admin/adminBoard"; //생성할 jsp
    }


    @RequestMapping("/list") //게시판 리스트 화면 호출
    private String boardList(Model model){

        model.addAttribute("list", mBoardService.boardListService());


        return "board/list"; //생성할 jsp
    }

    @RequestMapping("/detail/{bno}")
    private String boardDetail(@PathVariable int bno, Model model){

        model.addAttribute("detail", mBoardService.boardDetailService(bno));
        model.addAttribute("files", mBoardService.fileDetailService(bno)); //추가
        boardDao.boardHit(bno);
        return "board/detail";
    }





    @RequestMapping("/insert") //게시글 작성폼 호출
    private String boardInsertForm(HttpServletRequest req){

        return "board/insert";
    }

    @Value("${file.upload.directory}")
    String uploadFileDir;

    @RequestMapping("/insertProc")
    private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws IOException {

        BoardDto board = new BoardDto();
        FileDto file  = new FileDto();

        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));

        board.setFixed(request.getParameter("fixed"));
        board.setUsed(request.getParameter("used"));


        if(files.isEmpty()){
            mBoardService.boardInsertService(board); //게시글 insert
        }else{
            String fileName = files.getOriginalFilename();
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
            File destinationFile;
            String destinationFileName;
            //String fileUrl = "/Users/Documents/Workspace/MyProject/tistory/demo/src/main/webapp/WEB-INF/uploadFiles/"; 삭제

            do {
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
                destinationFile = new File(uploadFileDir+ destinationFileName);
            } while (destinationFile.exists());

            destinationFile.getParentFile().mkdirs();
            files.transferTo(destinationFile);

            mBoardService.boardInsertService(board); //게시글 insert

            file.setBno(board.getBno());
            file.setFileName(destinationFileName);
            file.setFileOriName(fileName);
            file.setFileUrl(uploadFileDir);

            mBoardService.fileInsertService(file); //file insert
        }


        return "redirect:/list";
    }



    @RequestMapping("/update/{bno}") //게시글 수정폼 호출
    private String boardUpdateForm(@PathVariable int bno, Model model){

        model.addAttribute("detail", mBoardService.boardDetailService(bno));

        return "board/update";
    }

    @RequestMapping("/updateProc")
    private String boardUpdateProc(HttpServletRequest request){

        BoardDto board = new BoardDto();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setFixed(request.getParameter("fixed"));
        board.setUsed(request.getParameter("used"));
        board.setBno(Integer.parseInt(request.getParameter("bno")));

        mBoardService.boardUpdateService(board);

        return "redirect:/detail/"+request.getParameter("bno");
    }


    @RequestMapping("/delete/{bno}")
    private String boardDelete(@PathVariable int bno){

        mBoardService.boardDeleteService(bno);

        return "redirect:/list";
    }

    @RequestMapping("/fileDown/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        FileDto fileVO = mBoardService.fileDetailService(bno);

        //파일 업로드된 경로
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();

            //실제 내보낼 파일명
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";

            //파일을 읽어 스트림에 담기
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }

            client = request.getHeader("User-Agent");

            //파일 다운로드 헤더 지정
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");

            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }

    }
}
