let form = document.getElementById("logoutForm");

let el = document.getElementById("logout-button");
if (el) {
    el.addEventListener("click", function () {
        form.submit();
    });
}


// Handle like
$(document).on('click', '.like-id', function () {
    let likeId = $(this).data("like-id");
    let that = this;
    $.ajax({
        method: 'GET',
        url: "/ideas/" + likeId + "/like",
        data: "id=" + likeId,
        dataType: 'json',
        contentType: "application/json"
    }).done(function (res) {
        let number = parseInt($(that).siblings("div").find(".num-id").text());
        $(that).siblings("div").find(".num-id").text(number + 1);
        $(that).addClass("d-none");
        $(that).siblings("a.unlike-id").removeClass("d-none");
    });
});


// Handle unlike
$(document).on('click', '.unlike-id', function () {
    let likeId = $(this).data("like-id");
    let that = this;
    $.ajax({
        method: 'GET',
        url: "/ideas/" + likeId + "/unlike",
        data: "id=" + likeId,
        dataType: 'json',
        contentType: "application/json"
    }).done(function (res) {
        let number = parseInt($(that).siblings("div").find(".num-id").text());
        $(that).siblings("div").find(".num-id").text(number - 1);
        $(that).addClass("d-none");
        $(that).siblings(".like-id").removeClass("d-none");
    });
});