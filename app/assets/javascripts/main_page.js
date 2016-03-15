

$(document).ready(function(){

  $(":file").filestyle({
    input: false
  })
  $("imgInp").filestyle();

  // $("#imgInp").on("click", function(){
  //   $("video").removeClass('hidden');
  //   })

  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {

              $('video').attr('src', e.target.result);
              console.log(e.target.result)
              $('video').removeClass('hidden');
          }
          reader.readAsDataURL(input.files[0]);
      }

  }
  $("#imgInp").change(function(){
      readURL(this);
  });
});
