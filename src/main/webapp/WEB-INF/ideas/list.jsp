<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>List of Ideas</title>
    <jsp:include page="../partials/_head.jsp"/>
</head>
<body>
<jsp:include page="../partials/_header.jsp"/>


<section class="bg-dark bg-center-top bg-no-repeat position-relative pt-5 pb-4 pb-md-5"
         style="background-image: url(/dist/img/homepages/theme-presentation/hero-bg-back.jpg);">
</section>


<div class="page-title d-flex" aria-label="Page title"
     style="background-image: url(/dist/img/page-title/shop-pattern.jpg);">
    <div class="container text-left align-self-center">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="/ideas/">Ideas</a></li>
            </ol>
        </nav>
        <h1 class="page-title-heading">List of Ideas</h1>
    </div>
</div>

<jsp:include page="_list.jsp"/>

<jsp:include page="../partials/_footer.jsp"/>

</body>
</html>