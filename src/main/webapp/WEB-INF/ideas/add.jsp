<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Create a New Idea</title>
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
                <li class="breadcrumb-item"><a href="/ideas">Ideas</a></li>
                <li class="breadcrumb-item"><a href="/ideas/new">New</a></li>
            </ol>
        </nav>
        <h1 class="page-title-heading">Add a New Idea</h1>
    </div>
</div>


<div class="container mb-3">
    <div class="row">
        <div class="col-md-6 pb-5">


            <form:form method="POST" action="/ideas/new" modelAttribute="idea" enctype="multipart/form-data">
                <div class="form-group">
                    <form:label path="name">Title:</form:label>
                    <form:input path="name" type="text" cssClass="form-control"/>
                    <form:errors path="name" cssClass="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="description">Description:</form:label>
                    <form:textarea path="description" cssClass="form-control"/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="files">Image:</form:label>
                    <form:input path="files" type="file" cssClass="form-control-file"/>
                    <form:errors path="files" cssClass="text-danger"/>
                </div>

                <button type="submit" class="btn btn-primary mb-2">Create</button>
            </form:form>

        </div>
    </div>
</div>

<jsp:include page="../partials/_footer.jsp"/>
</body>
</html>