<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${idea.name}</title>
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
                <li class="breadcrumb-item"><a href="/ideas/${idea.id}">${idea.name}</a></li>
            </ol>
        </nav>
        <h1 class="page-title-heading">${idea.name}</h1>
    </div>
</div>


<div class="container mb-3">
    <div class="row">
        <div class="col">

            <div class="float-right">
                <a class="btn btn-sm btn-primary mt-3" href="/ideas">Back</a>

                <c:if test="${idea.user.id == user.id and user!=null}">
                    <a href="/ideas/edit/<c:out value="${idea.id}"/>" class="btn btn-sm btn-warning mt-3">Edit</a>
                    <a href="/ideas/delete/<c:out value="${idea.id}"/>"
                       class="btn btn-sm btn-warning mt-3">Delete</a>
                </c:if>
            </div>

            <h1><c:out value="${idea.name}"/></h1>
            <p class="card-text">${idea.description}</p>
            <br><br>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <%--<div class="card">--%>
            <%--<div class="card-body mb-0 pb-0">--%>
            <%--<h1><c:out value="${idea.name}"/></h1>--%>
            <%--<p class="card-text">${idea.description}</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <figure class="figure">

                <c:if test="${idea.fileName == null}">
                    <img class="figure-img" src="/img/default-image.png" alt="${idea.name}">
                </c:if>
                <c:if test="${idea.fileName != null}">
                    <img class="figure-img" src="/downloadFile/${idea.fileName}" alt="${idea.name}">
                </c:if>

                    <figcaption class="figure-caption h6 pt-2 mb-2 text-md text-center"><c:out
                        value="${idea.user.firstName}"/></figcaption>
                <div class="animated-digits float-right"
                     data-number=" <c:out value="${fn:length(idea.likes)}"/>">
                    <h5 class="animated-digits-digit"><span class="num-id">0</span></h5>
                </div>

                <c:choose>
                    <c:when test="${user.username != null}">
                        <c:set var="key" value="${user.id}${idea.id}"/>
                        <a class="btn btn-sm btn-primary mt-3 like-id <c:if test="${idea.likes[key] != null}">d-none</c:if>"
                           data-like-id="<c:out value="${idea.id}"/>" href="#">Like</a>

                        <a class="btn btn-sm btn-secondary mt-3 unlike-id <c:if test="${idea.likes[key] == null}">d-none</c:if>"
                           data-like-id="<c:out value="${idea.id}"/>" href="#">Unlike</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-sm btn-primary mt-3" href="/login">Like</a>
                    </c:otherwise>
                </c:choose>


            </figure>

        </div>
        <div class="col-md-6 pb-5">
            <c:if test="${not empty idea.likes}">
                <h4 class="pt-2">Users who liked the idea:</h4>
                <table class="table">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="like" items="${idea.likes}">
                        <tr>
                            <td>${like.value.firstName} ${like.value.lastName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>


        </div>
    </div>

    <div class="row">
        <div class="col">

            <c:forEach var="review" items="${idea.reviews}">
                <div class="blockquote comment">
                    <div class="d-sm-flex mb-2">
                        <h6 class="text-lg mb-0"> ${review.title}</h6>
                            <%--<span class="d-none d-sm-inline mx-3 text-muted opacity-50">|</span>--%>
                            <%--<div class="rating-stars">--%>
                            <%--<i class="fe-icon-star active"></i>--%>
                            <%--<i class="fe-icon-star active"></i>--%>
                            <%--<i class="fe-icon-star active"></i>--%>
                            <%--<i class="fe-icon-star active"></i>--%>
                            <%--<i class="fe-icon-star"></i>--%>
                            <%--</div>--%>
                    </div>
                    <p>${review.description}</p>
                    <footer class="testimonial-footer">
                        <div class="testimonial-avatar">
                                <%--<img src="https://demo.createx.studio/createx/img/testimonials/01.jpg"--%>
                            <img src="/img/default.png"
                                 alt="Review Author ${review.user.firstName} ${review.user.lastName}"/>
                        </div>
                        <div class="d-table-cell align-middle pl-2">
                            <div class="blockquote-footer">
                                    ${review.user.firstName} ${review.user.lastName}
                                <cite><fmt:formatDate value="${review.createdAt}"
                                                      pattern="MMMM, dd, yyyy 'at' HH:mm a"/></cite>
                            </div>
                        </div>
                    </footer>
                </div>

            </c:forEach>

        </div>
    </div>
    <div class="row">
        <div class="col pt-5">

            <h1>Add Comment</h1>
            <form:form method="POST" action="/ideas/${idea.id}/add_review" modelAttribute="review">
                <div class="form-group">
                    <form:label path="title">Title:</form:label>
                    <form:input path="title" type="text" cssClass="form-control"/>
                    <form:errors path="title" cssClass="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="description">Description:</form:label>
                    <form:textarea path="description" cssClass="form-control"/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>

                <button type="submit" class="btn btn-primary mb-2">Add comment</button>
            </form:form>

        </div>
    </div>
</div>

<jsp:include page="../partials/_footer.jsp"/>
</body>
</html>