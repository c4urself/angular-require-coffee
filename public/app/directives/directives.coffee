define([
  'angular',
  '../services'
], (angular, services) =>

    return angular.module('myApp.directives', ['myApp.services'])
      .directive('appVersion', ['version', (version) =>
        (scope, elm, attrs) =>
          elm.text(version)
    ])
)
