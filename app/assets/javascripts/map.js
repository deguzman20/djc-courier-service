function initMap(){
    var locations = [];   

    $.ajax({
      url: "/my_coordinate",
      type:"GET",
      dataType: "JSON",
      success:function(data){
        var location = { lat: data["latitude"] , lng: data["longitude"] };

        $.ajax({
        url: "/map_coordinates",
        type: "GET",
        dataType:"JSON",
        success:function(data){
          $.each(data, function(k,v){
            locations.push([ v["first_name"]+" "+v["last_name"], v["latitude"], v["longitude"], v["image"], v["id"]]);
            console.log(locations)
            var mapOptions = {
                    zoom: 13,
                    center: location,
                    scrollwheel: false,
                    styles: [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#f5f5f5"
                          }
                        ]
                      },
                      {
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#fbff00"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.icon",
                        "stylers": [
                          {
                            "visibility": "off"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#616161"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#f5f5f5"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.land_parcel",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#bdbdbd"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#eeeeee"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#757575"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#e5e5e5"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9e9e9e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#ffffff"
                          }
                        ]
                      },
                      {
                        "featureType": "road.arterial",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#757575"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#dadada"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#616161"
                          }
                        ]
                      },
                      {
                        "featureType": "road.local",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9e9e9e"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.line",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#e5e5e5"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#eeeeee"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#c9c9c9"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9e9e9e"
                          }
                        ]
                      }
                    ]
            }

            var map = new google.maps.Map(document.getElementById('map'), mapOptions);
            var infowindow = new google.maps.InfoWindow();
            var marker, i;

            for (i = 0; i < locations.length; i++) {
              marker = new google.maps.Marker({
                  position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                  map: map,
                  animation: google.maps.Animation.DROP
              });
              marker.addListener('click', toggleBounce);
              var contentString  = '<div id="container-fluid">';
                  contentString +=   '<main>';
                  contentString +=     '<div id="profile-banner-image">';
                  contentString +=       '<img src="https://imagizer.imageshack.com/img921/9628/VIaL8H.jpg" alt="Banner image">';
                  contentString +=     '</div>';
                  contentString +=      '<div id="profile-d">';
                  contentString +=        '<div id="profile-pic" style="position:relative;top:-55px">';
                  contentString +=          '<img src="'+locations[i][3]["url"]+'"/>';
                  contentString +=        '</div>';
                  contentString +=        '<div id="u-name">';
                  contentString +=          locations[i][0]+' '+'<button class="btn elegant-color"><a href="/profile/'+locations[i][4]+'" class="white-text">View Profile</a></button>';
                  contentString +=        '</div>';
                  contentString +=      '</div>';
                  contentString +=   '</main>';
                  contentString += '</div>';
              google.maps.event.addListener(marker, 'click', (function(marker, i) {
                  return function() {
                    // locations[i][0]
                    infowindow.setContent(contentString);
                    infowindow.open(map, marker);
                  }
                  })(marker, i));
              }

              function toggleBounce() {
                if (marker.getAnimation() !== null) {
                  marker.setAnimation(null);
                } else {
                  marker.setAnimation(google.maps.Animation.BOUNCE);
                }
              }
          });
        },
        error:function(err){
          console.log(err)
        }
        });
      },
      error:function(err){
        console.log(err);
      }
    });
}