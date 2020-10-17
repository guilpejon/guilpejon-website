$(document).on('turbolinks:load', function() {
  if($('main').attr('class') != "static_pages-home") {
    var navbar = document.getElementsByClassName('navbar-expand-lg')[0]
    navbar.classList.add('stickyadd');
    navbar.classList.remove('fixed-top');
  } else {
    $(window).on("scroll", function() {
      $(window).scrollTop() >= 50 ? $(".sticky").addClass("stickyadd") : $(".sticky").removeClass("stickyadd")
    }),
    $(document).on("click", ".navbar-collapse.show", function(e) {
      $(e.target).is("a") && $(this).collapse("hide")
    }),
    $("#navbarCollapse").scrollspy({
      offset: 20
    });
  }
});
