$(document).on('click', '[data-toggle="lightbox"]', function(event) {
  event.preventDefault();
  ekkolightbox = require('ekko-lightbox');
  $(this).ekkoLightbox({
    alwaysShowClose: false,
  });
});
