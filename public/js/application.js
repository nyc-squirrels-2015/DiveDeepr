$(document).ready(function() {

  $('.show_btn').on('click',function(event){
    event.preventDefault();
    var $target = $(event.target);
    var url = $target.attr('href');
    $.ajax({
      type: 'get',
      url: url,
      // dataType: "json", --- don't need this for get
      success: function(response){
        console.log("success" , response);
        $('#show_photos').html(response);
        $('#show_photos').toggle();
      },
      error: function(response){
        console.log("error" , response);
      }
    })
  });

  $('.add_btn').on('click',function(event){
    event.preventDefault();
    var $target = $(event.target);
    var url = $target.attr('href');
    $.ajax({
      type: 'get',
      url: url,
      // dataType: "json", --- don't need this for get
      success: function(response){
        console.log("success" , response);
        $('#add_photos').html(response);
        $('#add_photos').toggle();
      },
      error: function(response){
        console.log("error" , response);
      }
    })
  });

  $('#add_photos').on('submit', '.new_photo_form', function(event){
    event.preventDefault();
    var $form = $(event.target);
    console.log($form);
    var dataToSend = $form.serialize();
    console.log(dataToSend);
    var type = $form.attr('method');
    console.log(type);
    var url = $form.attr('action');
    console.log(url);
    $.ajax({
      type: type,
      url: url,
      data: dataToSend,
      // dataType: "json",
      success: function(response){
        console.log("success ", response);
        successMod.show("You have successfully added a photo!");
      },
      error: function(response){
        console.log("error ", response);
      }
    })
  });

});
