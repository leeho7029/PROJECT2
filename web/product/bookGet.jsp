<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 페이지</title>
    <%@ include file="../common.jsp"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .content {
            margin-top: 24px;
            padding: 24px;
        }

        .nav-tabs {
            margin-top: 80px;
        }

        .product_detail_top {
            display: inline-block;
            vertical-align: middle;
        }

        .product_detail_top .img_area {
            width: 450px;
            text-align: center;
        }

        .product_detail_top .img_area img {
            width: 300px;
            height: auto;
        }

        .product_detail_top .detail_area {
            width: calc(100% - 550px);
            margin-left: 80px;
        }

        /* 추가적인 스타일은 여기에 추가합니다. */
    </style>
</head>

<body id="body">
<%@ include file="../header.jsp"%>
<nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
    <div class="container">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${path }">Home</a></li>
            <li class="breadcrumb-item"><a href="${path }/ProList.do">Product</a></li>
            <li class="breadcrumb-item active" aria-current="page">List</li>
        </ol>
    </div>
</nav>

<div class="container contents text-left">
    <div class="row">
        <div class="col-4 product_detail_top img_area">
            <img class="card-img-top" src="${product.img }" alt="${product.title }" width="100"/>
        </div>
        <div class="col-8 product_detail_top detail_area">
            <form action="" method="post">
                <table class="table">
                    <thead>
                    <tr>
                        <td colspan="2"><h2>${product.title }</h2></td>
                    </tr>
                    </thead>
                    <tbody >
                    <tr>
                        <th scope="row">카테고리</th>
                        <td>${category.categoryName} </td>
                    </tr>
                    <tr>
                        <th scope="row">저자</th>
                        <td>${product.author} </td>
                    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td>${product.price}</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="amount">수량</label>
                        </td>
                        <td>
                            <input id="amount" name="amount" type="number" class="form-control" value="1">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <c:choose>
                                <c:when test="${!empty sid}">
                                    <input class="btn btn-main btn-medium" type="submit" value="장바구니 추가" onclick="addCart()">
                                    <input type="hidden" name="proNo" value="${product.proNo}">
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-main btn-medium" type="button" onclick="location.href='${rootPath}/member/login.jsp'">장바구니</button>
                                </c:otherwise>
                            </c:choose>
                            <input class="btn btn-main btn-medium" type="submit" value="결제하기" onclick="payProduct()">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#content_area">상세설명</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#review_area">리뷰</a>
        </li>
    </ul>
    <div class="content" style="">
        ${product.content}
    </div>
    <hr>
    <div id="review_area" class="content">
        <c:if test="${!empty reviewList}">
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>리뷰내용</th>
                    <th>별점</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${reviewList }" var="review" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td>${review.content }</td>
                        <td>
                            <c:choose>
                                <c:when test="${review.star eq 5}">★★★★★</c:when>
                                <c:when test="${review.star eq 4}">★★★★</c:when>
                                <c:when test="${review.star eq 3}">★★★</c:when>
                                <c:when test="${review.star eq 2}">★★</c:when>
                                <c:when test="${review.star eq 1}">★</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${sid eq 'admin' || sid eq review.memId}">
                                <a href="${rootPath }/ReviewDeletePro.do?rno=${review.rno }">리뷰삭제</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty reviewList}">
            <p class="text-center">등록된 리뷰가 없습니다.</p>
        </c:if>
    </div>
    <hr>
    <div class="text-right" style="margin:20px 0;">
        <a class="btn btn-main btn-medium" href="${rootPath }/BookList.do?category=*" role="button">글 목록</a>
        <a class="btn btn-main btn-medium" href="${rootPath }/ReviewAdd.do?proNo=${product.proNo }" role="button">리뷰등록</a>
        <c:if test="${reviewPass eq true}">
            <a class="btn btn-main btn-medium" href="${rootPath }/ReviewAdd.do?proNo=${product.proNo }" role="button">리뷰등록</a>
        </c:if>
    </div>
</div>

<%@ include file="../footer.jsp" %>
<%@ include file="../commonsub.jsp" %>
</body>
</html>

<script>
    function addCart(){
        $("form").attr("action", "${rootPath}/CartAdd.do?pno=${product.proNo }&imgsrc1=${product.img}&price=${product.price}");
    }
    function payProduct(){
        $("form").attr("action", "${rootPath}/PayProduct.do");
    }
</script>