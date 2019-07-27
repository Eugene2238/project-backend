<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <title>Ideas that Spread, Win</title>
    <jsp:include page="partials/_head.jsp"/>
</head>
<body>
<jsp:include page="partials/_header.jsp"/>


<section class="bg-dark bg-center-top bg-no-repeat position-relative pt-5 pb-4 pb-md-5"
         style="background-image: url(dist/img/homepages/theme-presentation/hero-bg-back.jpg);">
    <div class="img-cover bg-auto d-none d-md-block"
         style="background-image: url(dist/img/homepages/theme-presentation/hero-bg-front.jpg);"></div>
    <div class="container bg-content py-5 my-md-5 text-center text-md-left">
        <div class="pb-md-5 mt-5 mb-md-5">
            <div class="d-inline-block h6 text-lg bg-white px-3 py-2 mt-md-4">project.pro</div>
            <h1 class="display-3 text-white"><span class="d-block break-word">Ideas</span><span
                    class="d-block break-word"> that Spread, </span><span class="d-block break-word">Win</span></h1>
        </div>
    </div>
</section>
<div class="bg-dark" style="height: 250px;"></div>

<!-- Theme Details-->
<section class="container" style="margin-top: -250px;">
    <div class="bg-white box-shadow py-5 px-4 px-sm-5">
        <div class="row">
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-info text-white px-3 py-1'>1</span> Determining direction </h5>
                <p class="text-muted pb-3">Sometimes professional programmers have plenty of passion but direction is hard to find. A good idea can show you the right way.  </p>
                <hr>
            </div>
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-warning text-white px-3 py-1'>2</span> Art of innovating </h5>
                <p class="text-muted pb-3">Introducing something new is the simplest way to attract attention and make the idea more powerful.  Find a new way to solve or highlight some problem to achieve it.</p>
                <hr>
            </div>
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-accent text-white px-3 py-1'>3</span> Unique market opportunities
                </h5>
                <p class="text-muted pb-3">Many entrepreneurs rack their brains pondering over out-of-the-box approach to business. A good idea can make your startup or software product stand out. </p>
                <hr>
            </div>
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-success text-white px-3 py-1'>4</span> Huge Potential</h5>
                <p class="text-muted pb-3">A good idea is able to generate profits. A brilliant idea can bring millions of dollars. The venture investors are always on the lookout for brilliant ideas. </p>
                <hr>
            </div>
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-primary text-white px-3 py-1'>5</span> Chance of success
                </h5>
                <p class="text-muted pb-3">Don’t waste your life chasing bad opportunities. Here is the chance for you to discover something new you will like. One can become successful chasing viable concepts. </p>
                <hr>
            </div>
            <div class="col-md-6 pb-4 mb-3">
                <h5><span class='d-inline-block bg-danger text-white px-3 py-1'>6</span> More accomplished life</h5>
                <p class="text-muted pb-3">You can apply your knowledge and talents in a more productive way. An original idea can open up new horizons you haven’t even guessed about. People need to express their passion to achieve bigger goals. </p>
                <hr>
            </div>
        </div>
        <p class="text-lg text-center mb-0">...and much more</p>
    </div>
</section>


<jsp:include page="ideas/_list.jsp"/>


<jsp:include page="partials/_footer.jsp"/>
</body>
</html>