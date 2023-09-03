<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각 종 자원 로딩 -->
<style>
* { margin: 0;  padding: 0; }
body, html { width: 100%; }
</style>
<script src="${path1}/js/jquery-1.10.0.js"></script>
<link rel="stylesheet" href="${path1}/css/bootstrap.css">
<script rel = "stylesheet" src=${path1}/css/bootstrap.min.css"></script>
<script src="${path1}/js/nav.js"></script>
<link rel="stylesheet" href="css/nav.css">
<style>
.title { text-align: center; padding-top: 3rem; }
#hd { border-bottom:2px solid #333; }
#ft { border-top:2px solid #333; margin-top: 20px; }
.list { list-style: none; }
.list li { margin-top: 24px; }
.msg { text-align: center; }
.subnav { padding-left: 4rem; }
.container-fluid {    margin: 0; }
</style>
