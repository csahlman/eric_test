angular.module('eric_test').controller 'MapsCtrl', ($scope, $http, $routeParams) ->

  $scope.filter = $routeParams.filter

  $scope.filterBy = (providerFilter) ->
    $scope.filter = providerFilter

