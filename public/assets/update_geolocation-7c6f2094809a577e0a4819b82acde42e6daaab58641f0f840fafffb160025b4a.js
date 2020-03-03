setInterval(function(){
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(displayLocationInfo);
  }

  function displayLocationInfo(position) {
    var lng = position.coords.longitude;
    var lat = position.coords.latitude;
    $.ajax({
        url: "/update_geolocation",
        type: "GET",
        data:{
          latitude: lat,
          longitude: lng
        },
        dataType: "JSON",
        success:function(data){
            console.log(data)
        },
        error:function(err){
            console.log(err)
        }
    });
  }
  
}, 5000)
;
