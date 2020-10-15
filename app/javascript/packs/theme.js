$(window).on("scroll", function() {
    $(window).scrollTop() >= 50 ? $(".sticky").addClass("stickyadd") : $(".sticky").removeClass("stickyadd")
}),
$(document).on("click", ".navbar-collapse.show", function(e) {
    $(e.target).is("a") && $(this).collapse("hide")
}),
$("#navbarCollapse").scrollspy({
    offset: 20
});
