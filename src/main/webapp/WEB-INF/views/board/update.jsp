<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    </head>
    <body>

    <%@ include file="/WEB-INF/views/comm/header.jsp"%>
    <div class="container">
        <div class="col-xs-12" style="margin:15px auto;">
            <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>게시글 수정</label>
        </div>

        <div class="col-xs-12">
            <form action="/updateProc" method="post">
                <div class="form-group">
                    <label for="subject">제목</label>
                    <input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
                </div>


                <div class="form-group">
                    <label for="content">고정공지사항유무</label>
                        ${detail.fixed}
                    <c:choose>
                        <c:when test="${detail.fixed == 'y'}">
                            <input type="radio" name="fixed" value="y" checked>yes
                            <input type="radio" name="fixed" value="n">no
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="fixed" value="y">yes
                            <input type="radio" name="fixed" value="n" checked>no
                        </c:otherwise>
                    </c:choose>
                </div>


                <div class="form-group">
                    <label for="content">게시글 사용유무</label>
                        ${detail.used}
                    <c:choose>
                        <c:when test="${detail.used == 'y'}">
                            <input type="radio" name="used" value="y" checked>yes
                            <input type="radio" name="used" value="n">no
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="used" value="y">yes
                            <input type="radio" name="used" value="n" checked>no
                        </c:otherwise>
                    </c:choose>
                </div>

                <input type="hidden" name="bno" value="${detail.bno}"/>
                <button type="submit" class="btn btn-primary btn-sm" style="float:right;">수정</button>
            </form>
        </div>
    </div>

    </body>
    </html>

