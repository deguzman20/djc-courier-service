$(function(){
  $(".different_user").attr("disabled", "disabled");

  $("#profile_form").submit(function(e){
    e.preventDefault();
    var data = $(this).serialize();

    //  Ajax Request for updating user info

    $.ajax({
      url: "/update_profile_info",
      type: "GET",
      data: data,
      dataType: "JSON",
      success:function(data){
        console.log(data);
      },
      error:function(err){
        console.log(err)
      }
    });
  })
});
