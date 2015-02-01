function init() {     
    var myLatlng = new google.maps.LatLng(47.293966, 39.145043);
    var myOptions = {
        zoom: 9,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map"), myOptions); 
    
 var marker = new google.maps.Marker({
      position: new google.maps.LatLng(47.213367, 38.919293),
      map: map,
      title: 'Таганрог'
  });
  
   var marker = new google.maps.Marker({
      position: new google.maps.LatLng(47.238653, 39.748629),
      map: map,
      title: 'Ростов'
  });

}
google.maps.event.addDomListener(window, 'load', init);