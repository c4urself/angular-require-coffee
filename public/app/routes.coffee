define([
  'angular',
  'app'
], (angular, app, controllers) =>

    return app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) =>
      $routeProvider.when('/view1',
        templateUrl: 'partials/partial1.html',
        controller: 'MyCtrl1'
      )
      $routeProvider.when('/view2',
        templateUrl: 'partials/partial2.html',
        controller: 'MyCtrl2'
      )
      $routeProvider.otherwise(
        redirectTo: '/view1'
      )

      $locationProvider.html5Mode(true)
    ])
)
