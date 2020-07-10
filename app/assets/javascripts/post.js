$(document).on("turbolinks:load",function(){
  $('#post_description').on('keyup', function() {
    var descriptionInputLength = $('#post_description').val().length;
    var imagelength = $('#post_avatar').val().length;
    if (descriptionInputLength >= 1 || imagelength >= 1) {
      $('.posr_create').prop('disabled',false);
    } else {
      $('.posr_create').prop('disabled',true);
    }
  });
  
  $('#post_avatar').change(function() {
    var imagelength = $('#post_avatar').val().length;
    if (imagelength >= 1) {
      $('.posr_create').prop('disabled',false);
    }
  });

  $('.posr_create').prop('disabled',true);
}); 
