
$(document).ready(function() {
  var pages = $('.pages').children();
  // if (pages.length % 2 === 1){
  //   $('.pages').prepend('<div class="page"></div>');
  // }

  pages.each(function(i) {
    var page = $(this);
    if (i % 2 === 1) {
      page.css('z-index', (pages.length - i)); 
    }
  });

  $(window).on('load', function() {
    $('.page').on('click', function() {
      var page = $(this);
      var page_num = pages.index(page);
      if (page_num % 2 === 0) {
        page.removeClass('flipped');
        page.prev().removeClass('flipped');
      } else {
        page.addClass('flipped');
        page.next().addClass('flipped');
      }
    });

    $('.book').addClass('bound');
  });
});