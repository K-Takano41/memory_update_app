$(document).on('turbo:load', function(){
  function checkImageStatus(){
    var memoryId = $('#generate-message').data('memory-id');
    if ( memoryId ){
      $.ajax({
        url: `/memories/${memoryId}/check_image_status`,
        type: 'GET',
        success: function(data){
          if ( data.status === "complete" ){

            if (window.matchMedia('(max-width: 576px)').matches) {
              $('#bad-img').html(`<img src="${data.image_url}" height="300" width="300">`);
            } else {
              $('#bad-img').html(`<img src="${data.image_url}" height="400" width="400">`);
            }
            
          } else {
            setTimeout(checkImageStatus, 1000);
          }
        }
      })
    }
  }
  checkImageStatus();
})