<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #111; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:70%; }
    .item3 { width:10%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Notice</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">공지사항 목록</h2>
        <p class="msg">${msg }</p>
        <div class="container">
            <div class="box_wrap">
                <div class="form-wrap">
                    <form action="${path }/KwdNoticeList.do" method="post">
                        <fieldset class="input-group">
                            <select name="searchType" id="searchType" class="form-select" style="max-width:200px;">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="all">제목+내용</option>
                            </select>
                            <span style="display: inline-block; width:8px;"></span>
                            <input type="text" name="kwd" id="kwd" class="form-control" placeholder="검색어 입력" required>
                            <input type="submit" value="검색" class="btn btn-primary">
                        </fieldset>
                    </form>
                </div>
                <table class="table table-secondary" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">연번</th>
                        <th class="item2">제목</th>
                        <th class="item3">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="noti" items="${notiList }" varStatus="status">
                    <tr>
                        <td class="item1">${noti.no }</td>
                        <td class="item2">
                            <a href="${path }/Notice.do?no=${noti.no }">${noti.title }</a>
                        </td>
                        <td class="item3">
                            <fmt:parseDate value="${noti.regdate }}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example" id="page-nation1">
                    <c:if test="${empty kwd }">
                    <ul class="pagination">
                        <c:if test="${ curPageNum > 5 }">
                            <li lass="page-item"><a href="${path }/NoticeList.do?page=${ blockStartNum - 1 }" class="page-link">◀</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                            <c:choose>
                                <c:when test="${ i == curPageNum }">
                                    <li class="page-item" style="width:35px;height:38px;line-height:38px;text-align:center;"><strong>${ i }</strong></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a href="${path }/NoticeList.do?page=${ i }" class="page-link">${ i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${ blockLastNum < totalPageCount }">
                            <li class="page-item"><a href="${path }/NoticeList.do?page=${ blockLastNum + 1 }" class="page-link">▶</a></li>
                        </c:if>
                    </ul>
                    </c:if>
                    <c:if test="${!empty kwd }">
                        <ul class="pagination">
                            <c:if test="${ curPageNum > 5 }">
                                <li lass="page-item"><a href="${path }/KwdNoticeList.do?page=${ blockStartNum - 1 }&{kwd }&searchType=${searchType}" class="page-link">◀</a></li>
                            </c:if>
                            <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                                <c:choose>
                                    <c:when test="${ i == curPageNum }">
                                        <li class="page-item" style="width:35px;height:38px;line-height:38px;text-align:center;"><strong>${ i }</strong></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a href="${path }/KwdNoticeList.do?page=${ i }&kwd=${kwd }&searchType=${searchType}" class="page-link">${ i }</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${ blockLastNum < totalPageCount }">
                                <li class="page-item"><a href="${path }/KwdNoticeList.do?page=${ blockLastNum + 1 }&kwd=${kwd }&searchType=${searchType}" class="page-link">▶</a></li>
                            </c:if>
                        </ul>
                    </c:if>
                </nav>
                <hr>
                <c:if test="${sid.equals('admin')}">
                <div class="container">
                    <a href="${path }/AddNotice.do" class="btn btn-primary">공지사항 등록</a>
                </div>
                </c:if>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
