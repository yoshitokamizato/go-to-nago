$('#user-tag-icon').mouseover(function() {
 
  console.log('マウスオーバーしました！');

});

$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img-preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user-img-file").on('change', function(){
      readURL(this);
  });
});
