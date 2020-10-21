$(document).on('turbolinks:load', function() {
  let grid = $('.grid')
  if (grid.length) {
    imagesLoaded(document.querySelector('.grid'), function( instance ) {
      var iso = new Isotope('.grid', {
        itemSelector: '.grid-item',
        layoutMode: 'masonry'
      });

      // var iso = new Isotope('.project-grid', {
      //   itemSelector: '.grid-item',
      //   layoutMode: 'masonry'
      // });

      // bind filter button click
      $('#image-orientation-filters').on( 'click', 'a', function() {
        var filterValue = $(this).attr('data-filter');
        if(!$(this).hasClass('active')) {
          iso.arrange({ filter: filterValue });
        } else {
          iso.arrange({ filter: '*' });
        }
        var checkedElem = $('#image-orientation-filters').find('.active');
        checkedElem.removeClass('active');
        if(!checkedElem.is($(this))) {
          $(this).toggleClass('active');
        }
      });

      // Fix so lightbox adapts to a isotope filter
      // iso.on('arrangeComplete', function() {
      //   all_items = $(".grid-item")
      //   visible_items = $(".grid-item:visible")
      //   for (var i = 0; i < all_items.length; i++) {
      //     all_items[i].setAttribute('data-gallery', null)
      //   }
      //   for (var i = 0; i < visible_items.length; i++) {
      //     visible_items[i].setAttribute('data-gallery', 'photomanipulation-gallery')
      //   }
      // });
    });
  }
});
