<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Off-Canvas Menu-->
<div class="offcanvas-container is-triggered offcanvas-container-reverse" id="mobile-menu"><span
        class="offcanvas-close"><i class="fe-icon-x"></i></span>
    <div class="px-4 pb-4">
        <h6>Menu</h6>
        <div class="d-flex justify-content-between pt-2">
            <a class="btn btn-primary btn-sm btn-block" href="/login"><i class="fe-icon-user"></i>&nbsp;Login</a>
        </div>
    </div>
    <div class="offcanvas-scrollable-area border-top" style="height:calc(100% - 235px); top: 144px;">
        <!-- Mobile Menu-->
        <div class="accordion mobile-menu" id="accordion-menu">
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link ${homeMenu}" href="/">Home</a></div>
            </div>
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link ${ideasMenu}" href="/ideas">Ideas</a></div>
            </div>
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link ${myIdeasMenu}" href="/my_ideas">My ideas</a></div>
            </div>
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link ${addIdea}" href="/items/add">Add idea</a></div>
            </div>

            <div class="card">
                <div class="card-header"><a class="mobile-menu-link" href="/">Account</a></div>
            </div>
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link" href="/">Pages</a></div>
            </div>
            <div class="card">
                <div class="card-header"><a class="mobile-menu-link" href="/">Contacts</a></div>
            </div>
        </div>
    </div>
    <div class="offcanvas-footer px-4 pt-3 pb-2 text-center"><a class="social-btn sb-style-3 sb-twitter" href="#"><i
            class="socicon-twitter"></i></a><a class="social-btn sb-style-3 sb-facebook" href="#"><i
            class="socicon-facebook"></i></a><a class="social-btn sb-style-3 sb-pinterest" href="#"><i
            class="socicon-pinterest"></i></a><a class="social-btn sb-style-3 sb-instagram" href="#"><i
            class="socicon-instagram"></i></a></div>
</div>
<!-- Navbar: Simple Ghost-->
<header class="navbar-wrapper navbar-boxed navbar-simple-ghost">
    <div class="container-fluid">
        <div class="d-table-cell align-middle pr-md-3"><a class="navbar-brand mr-1" href="/"><img
                src="/dist/img/logo/logo-light.png" alt="CreateX"/></a></div>
        <div class="d-table-cell w-100 align-middle pl-md-3">
            <div class="navbar justify-content-end justify-content-lg-between">
                <!-- Main Menu-->
                <ul class="navbar-nav d-none d-lg-block">
                    <li class="nav-item ${homeMenu}"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item ${ideasMenu}"><a class="nav-link" href="/ideas">Ideas</a></li>
                    <li class="nav-item ${myIdeasMenu}"><a class="nav-link" href="/my_ideas">My Ideas</a></li>
                    <li class="nav-item ${addIdea}"><a class="nav-link" href="/ideas/new">Add Idea</a></li>
                    <%--<li class="nav-item"><a class="nav-link" href="/">Account</a></li>--%>
                    <%--<li class="nav-item"><a class="nav-link" href="/">Pages</a></li>--%>
                    <%--<li class="nav-item"><a class="nav-link" href="/">Components</a></li>--%>
                </ul>
                <form id="logoutForm" method="POST" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div>

                        <ul class="navbar-buttons d-inline-block align-middle">
                            <li class="d-block d-lg-none"><a href="#mobile-menu" data-toggle="offcanvas"><i
                                    class="fe-icon-menu"></i></a></li>
                            <li>
                                <c:choose>
                                    <c:when test="${user.username != null}">
                                        <a href="#" id="logout-button"><i class="fas fa-sign-out-alt"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/login"><i class="fas fa-sign-in-alt"></i></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>

                        <a class="btn btn-gradient ml-3 d-none d-xl-inline-block" href="/ideas/new"><i class="fas fa-plus"></i>&nbsp;&nbsp;Add Idea</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>