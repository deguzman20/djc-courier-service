
// // var map = new google.maps.Map(document.getElementById('map'), {
// //     center: {lat: -34.397, lng: 150.644},
// //     zoom: 6
// // });
// // var infoWindow = new google.maps.InfoWindow({map: map});

// // Try HTML5 geolocation.
// if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//         var pos = {
//             lat: position.coords.latitude,
//             lng: position.coords.longitude
//         };
//         console.log(pos)

//         // infoWindow.setPosition(pos);
//         // infoWindow.setContent('Location found.');
//         // map.setCenter(pos);
//     }, function() {
//         handleLocationError(true);
//     });
// } else {
//     // Browser doesn't support Geolocation
//     handleLocationError(false);
// }

// function handleLocationError(browserHasGeolocation) {
//     // infoWindow.setContent(browserHasGeolocation ?
//     //                       'Error: The Geolocation service failed.' :
//     //                       'Error: Your browser doesn\'t support geolocation.');
// }