<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Footer + CTA-->
<footer class="bg-dark pt-5">
    <div class="container pt-3 text-center">
        <h3 class="font-weight-normal text-white">Useful sharing</h3>
        <h2 class="h3 text-white pb-4">Do you still doubt that the idea is viable? Spread the word to see other users’ reaction.</h2><a
            class="btn btn-gradient btn-lg"
            href="/ideas/new"><i class="fas fa-plus"></i>&nbsp;&nbsp;ADD IDEA</a>
        <div class="py-5 mt-3">
            <hr class="hr-light">
        </div>

        <div class="d-md-flex justify-content-between align-items-center py-4 text-center text-md-left">
            <div class="order-2">


                <c:set var="req" value="${pageContext.request}"/>
                <c:set var="url">${req.requestURL}</c:set>
                <c:set var="uri" value="${req.requestURI}"/>


                <a class="social-btn sb-style-6 sb-facebook sb-light-skin"
                   href="http://www.facebook.com/sharer.php?u=${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}"
                   target="_blank"><i class="socicon-facebook"></i></a>


                <a class="social-btn sb-style-6 sb-twitter sb-light-skin"
                   href="https://twitter.com/share?url=${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}&text=Project.pro+-+Ideas+that+Spread,+Win&hashtags=flag_info"
                   target="_blank"><i
                        class="socicon-twitter"></i></a>

                <a class="social-btn sb-style-6 sb-linkedin sb-light-skin"
                   href="http://www.linkedin.com/shareArticle?mini=true&url=${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}"
                   target="_blank"><i class="socicon-linkedin"></i></a>

                <a class="social-btn sb-style-6 sb-reddit sb-light-skin"
                   href="http://reddit.com/submit?url=${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}&title=Project.pro+-+Ideas+that+Spread,+Win"
                   target="_blank"><i class="socicon-reddit"></i></a>

                <a class="social-btn sb-style-6 sb-vk sb-light-skin"
                   href="http://vk.com/share.php?url=${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}"
                   target="_blank"><i class="socicon-vkontakte"></i></a></div>


            <p class="m-0 text-sm text-white order-1"><span class='opacity-60'>© All rights reserved. Made with</span>
                <i class='d-inline-block align-middle fe-icon-heart text-danger'></i>

                <%--<a href='http://createx.studio/' class='d-inline-block nav-link text-white opacity-60 p-0'--%>
                <%--target='_blank'>by Createx--%>
                <%--Studio</a></p>--%>
        </div>
    </div>
</footer>
<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="fe-icon-chevron-up"></i></a>
<!-- Backdrop-->
<div class="site-backdrop"></div>
<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
<script src="/dist/js/vendor.min.js"></script>
<script src="/dist/js/theme.min.js"></script>

<script src="/js/app.js"></script>