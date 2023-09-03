<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 목록</title>
    <%@ include file="../common.jsp"%>
    <style>
        .dropdown-toggle::after { transition: transform 0.15s linear;}
        .show.dropdown .dropdown-toggle::after {transform: translateY(3px);}
        .dropdown-menu {margin-top: 0;}
        .page-header .breadcrumb li {position:relative;}
        .product-item {height:200px;margin-bottom:100px;}
        .drop-container {
            &:hover .drop {
                display: block;
            }
            .drop {
                display: none;
                position: absolute;
                top: 14px;
                left: 4px;
                padding:5px;
                background-color:#f5f5f5;
                .dropSub {
                    display: block;
                    width:56px;
                    padding: 8px 16px;
                    box-sizing:border-box;
                    &:hover {
                        text-decoration:underline;
                    }
                }
            }
        }
    </style>
</head>

<body id="body">
    <%@ include file="../header.jsp"%>
    <div class="container-fluid">
        <div class="contents" style="min-height:100vh">
            <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
                <div class="container">
                    <ol class="breadcrumb justify-content-end">
                        <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                        <li class="breadcrumb-item"><a href="${path }/ProList.do">Product</a></li>
                        <li class="breadcrumb-item active" aria-current="page">List</li>
                    </ol>
                </div>
            </nav>
            <h2 class="title">상품 목록</h2>
            <div class="container">
                <div class="box_wrap">
                    <ul class="list row">
                        <c:forEach var="book" items="${bookList }" varStatus="status">
                            <li class="col-3">
                                <div class="card" style="width: 18rem;">
                                    <div class="img-wrap" style="height:286px;overflow:hidden;">
                                        <img class="img-responsive" src="${book.img }" alt="${book.title }" />
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${book.title }</h3>
                                        <p class="card-text">가격 : ${book.price } 원</p>
                                        <a href="${rootPath }/BookGet.do?proNo=${book.proNo }" class="btn btn-primary">상세보기</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <c:if test="${empty bookList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
    <%@ include file="../commonsub.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($(".card").length===0){
            $(".d-flex.align-content-start.flex-wrap").append("<div class='text-center align-center' style='margin-top: 50px; height: 30vh;'>해당 목록이 존재하지 않습니다.</div>");
        }
    })
</script>

