angular.module('eric_test').directive 'map', ->
  restrict: 'A'
  # templateUrl: '/assets/directives/map.html'
  scope: 
    lat: '=lat'
    lng: '=lng'
    connections: '=connections'
  link: (scope, element, attrs) ->
    if scope.lat && scope.lng && scope.connections
      map = new L.Map(element[0]).setView([0, 0], 1)

      L.tileLayer('http://{s}.tile.cloudmade.com/664c0e7eb24b4912b034fe4e2e0c2bb3/997/256/{z}/{x}/{y}.png', {
          attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
          maxZoom: 18
      }).addTo(map);

      currentUser = L.marker([scope.lat, scope.lng]).addTo(map)

      angular.forEach(scope.connections, (connection) ->
        L.marker([connection.loc.lat, connection.loc.lng]).addTo(map)
      )
      