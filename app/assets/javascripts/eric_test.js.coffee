angular.module('eric_test', [])

angular.module('eric_test').config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data


angular.module('eric_test').config ($routeProvider) ->
  $routeProvider.when('/',
    controller: 'MapsCtrl'
    templateUrl: '/assets/maps/index.html'
  ).otherwise(
    redirectTo: '/'
  )