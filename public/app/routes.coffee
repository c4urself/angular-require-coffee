define([
  'angular',
  'app',
  'underscore'
], (angular, app, _) =>

  return app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) =>
    $locationProvider.html5Mode(true)
    $stateProvider
      .state('app',
        url: '',
        abstract: true,
        views:
          'nav':
            templateUrl: 'partials/nav.html'
            controller: ($scope) =>
              $scope.navigation = [
                name: 'Dashboard',
                slug: '',
              ,
                name: 'Tools',
                slug: 'tools',
              ,
                name: 'Settings',
                slug: 'settings',
              ]
              $scope.selectItem = (selectedItem) =>
                _($scope.shoppingList).each((item) => item.selected = false)
                selectedItem.selected = true
      )
      .state('app.home',
        url: '/'
        views:
          'content@':
            templateUrl: 'partials/home.html'
            controller: 'MyCtrl1'
      )
      .state('app.tools',
        url: '/tools'
        views:
          'content@':
            templateUrl: 'partials/tools.html',
      )
      .state('app.settings',
        url: '/settings'
        views:
          'content@':
            templateUrl: 'partials/settings.html',
      )
  ])
)
