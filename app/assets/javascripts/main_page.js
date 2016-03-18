

$(document).ready(function(){

  $(":file").filestyle({
    input: false
  })

$('.test').delay(2000).fadeIn(1000)
  // $("imgInp").filestyle();
$('.test2').delay(5000).fadeIn(1000)

  $("#imgInp").on("click", function(){
    $("video").removeClass('hidden');
    })

  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {

              $('video').attr('src', e.target.result);
              console.log(e.target.result)
              console.log(params)
              $('video').removeClass('hidden');
          }
          reader.readAsDataURL(input.files[0]);
      }

  }
  $("#imgInp").change(function(){
      readURL(this);
  });


});
