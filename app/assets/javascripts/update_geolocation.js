setInterval(function(){
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(displayLocationInfo);
  }

  function displayLocationInfo(position) {
    const lng = position.coords.longitude;
    const lat = position.coords.latitude;
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
