$(window).on('turbo:load', function(){
  var pages = $('.pages').children();
  pages.removeClass('flipped');
  
  if (window.matchMedia('(max-width: 576px)').matches){
    $('.page-inner:not(:first)').append('<button class="prev-btn"><i class="fa-solid fa-arrow-left"></i></button>');
    $('.page-inner:not(:last)').append('<button class="next-btn float-end"><i class="fa-solid fa-arrow-right"></i></button>');

    pages.each(function(i) {
      var page = $(this);
      page.css('z-index', (pages.length - i)); 
      console.log(i);
    });

    $('.next-btn').on('click', function() {
      var nextBtn = $(this);
      var page = nextBtn.parents('.page');
      page.addClass('flipped');
    });

    $('.prev-btn').on('click', function(){
      var prevBtn = $(this);
      var page = prevBtn.parents('.page');
      page.prev().removeClass('flipped');
    });
  } else {
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
  }
})
