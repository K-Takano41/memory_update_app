$(window).on('turbo:load load', function(){
  var pages = $('.pages').children();
  pages.removeClass('flipped');
  if (pages.length % 2 === 1){
    $('.pages').append('<div class="page"></div>');
  }

  pages.each(function(i) {
    var page = $(this);
    if (i % 2 === 1) {
      page.css('z-index', (pages.length - i)); 
    }
  });

  $('.page:not(:first, :last)').on('click', function() {
    var page = $(this)
    var page_num = pages.index(page);
    if (page_num % 2 === 0) {
      page.removeClass('flipped');
      page.prev().removeClass('flipped');
    } else {
      page.addClass('flipped');
      page.next().addClass('flipped');
    }
  });

})
