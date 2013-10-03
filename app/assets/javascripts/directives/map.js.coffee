angular.module('eric_test').directive 'map', ->
  restrict: 'A'
  link: (scope, element, attrs) ->

    customIcon = L.icon(
      iconUrl: '/assets/flagman.png'
      iconSize: [20, 70]
      iconAnchor: [10, 70]
    )


    scope.$watch 'currentUser', (user) -> # wait for currentUser to fully load data
      map = new L.Map(element[0]).setView([user.loc.lat, user.loc.lng], 5)
      scope.connections = []

      L.tileLayer('http://{s}.tile.cloudmade.com/664c0e7eb24b4912b034fe4e2e0c2bb3/997/256/{z}/{x}/{y}.png', {
          attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
          maxZoom: 18
      }).addTo(map);

      L.marker([user.loc.lat, user.loc.lng], { icon: customIcon }).addTo(map)

      scope.drawMap = (filter) ->
        scope.clearMap(scope.connections) # clear current map
        angular.forEach user.connections, (connection) ->
          unless filter? && connection.provider != filter
            connection.marker = L.marker([connection.loc.lat, connection.loc.lng])
            connection.marker.bindPopup("<b>#{connection.provider}</b><br><i>#{connection.loc.lat} #{connection.loc.lng}</i>").openPopup()
            scope.connections.push connection.marker
            connection.marker.addTo(map)

        

      scope.$watch 'filter', (newFilter) ->
        scope.drawMap(newFilter)
      
      scope.clearMap = (connections) ->
        angular.forEach connections, (marker) ->
          map.removeLayer marker
        scope.connections = []
