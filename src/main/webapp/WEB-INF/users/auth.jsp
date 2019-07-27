<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Authentication</title>
    <jsp:include page="../partials/_head.jsp"/>
</head>
<body>
<jsp:include page="../partials/_header.jsp"/>


<section class="bg-dark bg-center-top bg-no-repeat position-relative pt-5 pb-4 pb-md-5"
         style="background-image: url(/dist/img/homepages/theme-presentation/hero-bg-back.jpg);">
</section>


<div class="page-title d-flex" aria-label="Page title" style="background-image: url(/dist/img/page-title/shop-pattern.jpg);">
    <div class="container text-left align-self-center">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a>
                </li>
                <li class="breadcrumb-item"><a href="/login">Account</a>
                </li>
            </ol>
        </nav>
        <h1 class="page-title-heading">Login / Register Account</h1>
    </div>
</div>


<div class="container mb-3">
    <div class="row">
        <div class="col-md-6 pb-5">

            <c:if test="${logoutMessage != null}">
            <div class="alert alert-success alert-dismissible fade show text-center">
                <span class="alert-close" data-dismiss="alert"></span>
                <i class="fe-icon-check-square"></i>
                &nbsp;&nbsp;<strong>Success alert:</strong>
                <c:out value="${logoutMessage}"></c:out>
            </div>
            </c:if>

            <c:if test="${errorMessage != null}">
                <div class="alert alert-warning alert-dismissible fade show text-center">
                    <span class="alert-close" data-dismiss="alert"></span>
                    <i class="fe-icon-alert-triangle"></i>
                    &nbsp;&nbsp;<strong>Warning alert:</strong>
                    <c:out value="${errorMessage}"></c:out>
                </div>
            </c:if>


            <form class="needs-validation wizard" novalidate action="/login" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="wizard-body pt-2">
                    <%--<div class="d-sm-flex justify-content-between pb-2"><a--%>
                    <%--class="btn btn-secondary btn-sm btn-block my-2 mr-3" href="#"><i--%>
                    <%--class="socicon-facebook"></i>&nbsp;Login</a><a--%>
                    <%--class="btn btn-secondary btn-sm btn-block my-2 mr-3" href="#"><i--%>
                    <%--class="socicon-twitter"></i>&nbsp;Login</a><a--%>
                    <%--class="btn btn-secondary btn-sm btn-block my-2 mr-3" href="#"><i--%>
                    <%--class="socicon-linkedin"></i>&nbsp;Login</a></div>--%>
                    <%--<hr>--%>
                    <h3 class="h5 pt-4 pb-2">Or using form below</h3>
                    <div class="input-group form-group">
                        <div class="input-group-prepend"><span class="input-group-text"><i
                                class="fe-icon-mail"></i></span></div>
                        <input name="username" class="form-control" type="email" placeholder="Email" required>
                        <%--<div class="invalid-feedback">Please enter your email!</div>--%>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend"><span class="input-group-text"><i
                                class="fe-icon-lock"></i></span></div>
                        <input name="password" class="form-control" type="password" placeholder="Password" required>
                        <%--<div class="invalid-feedback">Please enter valid password!</div>--%>
                    </div>
                    <div class="d-flex flex-wrap justify-content-between">
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" checked id="remember-me">
                            <label class="custom-control-label" for="remember-me">Remember me</label>
                        </div>
                        <%--<a class="navi-link" href="account-password-recovery.html">Forgot password?</a>--%>
                    </div>
                </div>
                <div class="wizard-footer text-right">
                    <button class="btn btn-primary" type="submit">Login</button>
                </div>
            </form>


        </div>
        <div class="col-md-6 pb-5">
            <h3 class="h4 pb-1">No Account? Register</h3>
            <p>Registration takes less than a minute but gives you full control over your orders.</p>
            <form:form method="POST" action="/registration" modelAttribute="user" cssClass="needs-validation">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="firstName">First Name</form:label>
                            <form:input path="firstName" type="text" cssClass="form-control"/>
                            <form:errors path="firstName" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="lastName">Last Name</form:label>
                            <form:input path="lastName" type="text" cssClass="form-control"/>
                            <form:errors path="lastName" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="username">E-mail Address</form:label>
                            <form:input path="username" type="text" cssClass="form-control"/>
                            <form:errors path="username" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="phone">Phone Number</form:label>
                            <form:input path="phone" cssClass="form-control"/>
                            <form:errors path="phone" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="password">Password</form:label>
                            <form:password path="password" cssClass="form-control"/>
                            <form:errors path="password" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <form:label path="passwordConfirmation">Confirm Password</form:label>
                            <form:password path="passwordConfirmation" cssClass="form-control"/>
                            <form:errors path="passwordConfirmation" cssClass="text-danger"/>
                        </div>
                    </div>
                </div>
                <div class="text-right">
                    <button class="btn btn-primary" type="submit">Register</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../partials/_footer.jsp"/>
</body>
</html>
