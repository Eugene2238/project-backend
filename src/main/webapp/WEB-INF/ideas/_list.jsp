<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section class="container-fluid py-5">
    <h2 class="h3 block-title text-center pt-4">Find some inspiration <span class='font-weight-normal'>and pick up an idea.</span>
        <small>If you have an idea-sparking mind, welcome to the site to share your ideas and evaluate their viability with members of the community. Do not keep your ideas to yourself - ideas that spread win!<br>
            If you are in the lookout for exceptional ideas and want to pick up the one for your own project, join the community and vote for the best ideas. This is the best opportunity to test drive your idea. </small>
    </h2>
    <div class="row pt-4">

        <c:forEach var="idea" items="${ideas}">
            <div class="col-xl-3 col-lg-4 col-sm-6 mb-2">
                <div class="card">
                    <div class="card-body mb-0 pb-0">
                        <h4 class="card-title"><a href="/ideas/<c:out value="${idea.id}"/>"><c:out
                                value="${idea.name}"/></a></h4>
                        <p class="card-text">${fn:substring(idea.description, 0, 200)}</p>
                    </div>
                </div>
                <figure class="figure">
                    <a class="d-block text-decoration-none" href="/ideas/<c:out value="${idea.id}"/>">
                        <c:if test="${idea.fileName == null}">
                            <img class="figure-img" src="/img/default-image.png" alt="${idea.name}">
                        </c:if>
                        <c:if test="${idea.fileName != null}">
                            <img class="figure-img" src="/downloadFile/${idea.fileName}" alt="${idea.name}">
                        </c:if>

                    </a>
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

                    <c:if test="${idea.user.id == user.id and user!=null}">
                        <a href="/ideas/edit/<c:out value="${idea.id}"/>" class="btn btn-sm btn-warning mt-3">Edit</a>
                        <a href="/ideas/delete/<c:out value="${idea.id}"/>"
                           class="btn btn-sm btn-warning mt-3">Delete</a>
                    </c:if>


                </figure>
            </div>
        </c:forEach>
    </div>


    <div class="d-flex flex-row">
        <div>
            <c:if test="${not empty ideasMenu}">
                <!-- Pagination -->
                <nav class="pagination">
                    <c:if test="${pageNumber != 1}">
                        <a class="prev-btn" href="/ideas/pages/${pageNumber - 1}"><i
                                class="fe-icon-chevron-left"></i>Prev</a>
                    </c:if>
                    <ul class="pages">
                            <%--<li class="d-block d-sm-none w-100">2 / 18</li>--%>
                        <c:forEach begin="1" end="${totalPages}" var="index">
                            <li class="d-none d-sm-inline-block <c:if test="${pageNumber == index}">active</c:if>">
                                <a href="/ideas/pages/${index}">${index}</a></li>
                            <%--<li class="d-none d-sm-inline-block active"><a href="#">2</a></li>--%>
                        </c:forEach>
                            <%--<li class="d-none d-sm-inline-block">...</li>--%>
                            <%--<li class="d-none d-sm-inline-block"><a href="#">18</a></li>--%>
                    </ul>
                    <c:if test="${pageNumber != totalPages}">
                        <a class="next-btn" href="/ideas/pages/${pageNumber + 1}">Next<i
                                class="fe-icon-chevron-right"></i></a>
                    </c:if>
                </nav>
            </c:if>
        </div>
    </div>


    <div class="row">
        <div class="col">
            <c:if test="${not empty homeMenu}">
                <p class="pt-3 mb-0 text-lg text-muted font-weight-medium text-center"><a class="text-decoration-none"
                                                                                          href="/ideas">... More
                    pages</a>
                </p>
            </c:if>
        </div>
    </div>
</section>
