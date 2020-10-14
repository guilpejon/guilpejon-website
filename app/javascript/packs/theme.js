$(window).on("scroll", function() {
    $(window).scrollTop() >= 50 ? $(".sticky").addClass("stickyadd") : $(".sticky").removeClass("stickyadd")
}),
$(document).on("click", ".navbar-collapse.show", function(e) {
    $(e.target).is("a") && $(this).collapse("hide")
}),
$(".navbar-nav a, .scroll_down a").on("click", function(e) {
    var a = $(this);
    $("html, body").stop().animate({
        scrollTop: $(a.attr("href")).offset().top - 0
    }, 1500, "easeInOutExpo"),
    e.preventDefault()
}),
$("#navbarCollapse").scrollspy({
    offset: 20
});
