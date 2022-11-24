<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .no-underline{
            text-decoration: none;
            font-size: 12px;
            text-align: center;
        }


    </style>
</head>
<body>
<h1>
    <a href="#" class="no-underline">멤버 리스트</a><br><br><br>
    <a href="#" class="no-underline">게시글 리스트</a><br><br><br>
    <a href="#" class="no-underline">상품 리스트</a><br><br><br>
</h1>
</body>
</html>
