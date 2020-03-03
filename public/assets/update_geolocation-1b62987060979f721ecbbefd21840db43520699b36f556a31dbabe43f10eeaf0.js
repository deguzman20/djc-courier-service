setInterval(function(){
    $.ajax({
        url: "/update_geolocation",
        type: "GET",
        dataType: "JSON",
        success:function(data){
            console.log(data)
        },
        error:function(err){
            console.log(err)
        }
      })
}, 60000)
;
