angular.module('eric_test').controller 'AppCtrl', ($scope, $http) ->

  $scope.connections = []

  $http
    url: 'connections.json'
    method: 'GET'
  .success (data) ->
    $scope.currentUserLat = data.me.loc.lat
    $scope.currentUserLng = data.me.loc.lng
    $scope.connections = data.conns
