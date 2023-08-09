$(document).on('turbo:load load', function(){
  if (window.matchMedia('(max-width: 576px)').matches){
    console.log('スマホ');
  } else {
    console.log('pc');
  }
})