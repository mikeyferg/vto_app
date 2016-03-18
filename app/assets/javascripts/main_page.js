

$(document).ready(function(){

  $(":file").filestyle({
    input: false
  })


$('.fade_1').delay(4000).fadeIn(1000)
  // $("imgInp").filestyle();
$('.fade_2').delay(8000).fadeIn(1000)
$('.fade_2b').delay(12000).fadeIn(1000)
$('.fade_3').delay(16000).fadeIn(1000)


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
              setTimeout(function(){
                $('video').removeClass('hidden');
              }, 5000)
              // $('video').removeClass('hidden');
          }
          reader.readAsDataURL(input.files[0]);
      }

  }
  $("#imgInp").change(function(){
      readURL(this);
  });


});
