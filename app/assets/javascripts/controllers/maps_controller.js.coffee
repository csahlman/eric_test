angular.module('eric_test').controller 'MapsCtrl', ($scope, $http, $routeParams,
  $location) ->

  $scope.filter = $routeParams.filter
  $scope.connections = []

  
  $scope.filterBy = (providerFilter) ->
    $scope.filter = providerFilter
    $location.search('filter', providerFilter)

