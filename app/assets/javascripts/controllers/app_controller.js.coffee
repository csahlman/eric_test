angular.module('eric_test').controller 'AppCtrl', ($scope, $http) ->

  $scope.currentUser = {}
  $scope.providers = []

  $scope.loadData = ->
    $http
      url: 'connections.json'
      method: 'GET'
    .success (data) ->
      $scope.currentUser = data.me
      $scope.currentUser.connections = data.conns
      $scope.uniqueProviders(data.conns)

  $scope.loadData()


# method to find different providers given from json file
  $scope.uniqueProviders = (connections) ->
    unique = {}
    angular.forEach connections, (value) ->
      unless unique[value.provider]
        $scope.providers.push(value.provider)
        unique[value.provider] = true
    