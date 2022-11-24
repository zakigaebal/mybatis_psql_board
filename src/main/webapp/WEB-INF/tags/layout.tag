<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="private"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="-1"/>
	
    <meta name="_csrf_header" content="<c:out value='${_csrf.headerName}'/>"/>
    <meta name="_csrf" content="<c:out value='${_csrf.token}'/>"/>
	
    <title>스프링부트 게시판</title>
	
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="/WEB-INF/views/comm/header.jsp"/>
<%--//css는 헤더에 추가--%>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<div class="wrapper">
        <div id="container">
            <div id="header">
                <jsp:include page="/WEB-INF/views/common/navbar.jsp"/>
            </div>

            <div id="sidebar-left">
                <jsp:include page="/WEB-INF/views/common/side.jsp"/>
            </div>

            <div id="content">
                <jsp:doBody/>
            </div>

            <div id="footer">
                <jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
            </div>
        </div>
	</div>
<%--	script는 바디의 마지막에 추가--%>
</body>
</html>