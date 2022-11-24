<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>--%>
<%--<layoutTag:layout>--%>


    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>스프링부트 게시판</title>
    </head>
    <body>


    <%@ include file="/WEB-INF/views/comm/header.jsp"%>


    <div class="container">

        <div class="col-xs-12" style="margin:15px auto;">

            <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 목록</label>



            <c:set var="loginID" value='<%=strLoginId%>' />
            <c:choose>
                <c:when test="${loginID == 'guest'}">
                </c:when>
                <c:otherwise>
                        <button class="btn btn-outline-success" style="float:right;" onclick="location.href='/insert'">글쓰기</button>
                </c:otherwise>
            </c:choose>




        </div>



        <div class="col-xs-12">
            <table class="table table-hover">
                <tr class="table-dark">
                    <th>순번</th>
                    <th>제목</th>
                    <th>작성아이디</th>
                    <th>조회수</th>
<%--                    <th>고정</th>--%>
<%--                    <th>사용</th>--%>
                    <th>작성날짜</th>
                </tr>

<%--고정글 먼저 보이게 하기--%>
                <c:forEach var="l" items="${list}">
                    <c:choose>
                        <c:when test="${l.fixed == 'y' && l.used == 'y'}">
                            <tr class="table-light" onclick="location.href='/detail/${l.bno}'">
                                <td>공지 ${l.bno}</td>
                                <td>${l.subject}</td>
                                <td>${l.writer}</td>
                                <td>${l.hit}</td>
<%--                                <td>${l.fixed}</td>--%>
<%--                                <td>${l.used}</td>--%>
                                <td>
                                    <fmt:formatDate value="${l.regDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <script>
                                console.log("게시글안보임")
                            </script>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

<%--고정글 제외하고 보이게 하기--%>
                <c:forEach var="l" items="${list}">
                    <c:choose>
                        <c:when test="${l.used == 'y' && l.fixed == 'n'}">
                            <tr class="table-light" onclick="location.href='/detail/${l.bno}'">
                                <td>${l.bno}</td>
                                <td>${l.subject}</td>
                                <td>${l.writer}</td>
                                <td>${l.hit}</td>
<%--                                <td>${l.fixed}</td>--%>
<%--                                <td>${l.used}</td>--%>
                                <td>
                                    <fmt:formatDate value="${l.regDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                           <script>
                               console.log("게시글안보임")
                           </script>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </table>
        </div>
    </div>
    <script>
        $(window).bind("pageshow", function (event){
            if(event.originalEvent.persisted){
                console.log('asd')
            }
            else{
                console.log('ffasasdd')
            }
        })



        window.onpageshow = function(event){
            if(event.persisted){
                console.log('ffa')
                document.location.reload();
                console.log('asdfd')
            }
        }
    </script>
    </body>
    </html>

<%--</layoutTag:layout>--%>
