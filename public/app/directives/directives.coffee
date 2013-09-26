define([
  'angular',
  '../services'
], (angular, services) =>

    return angular.module('tubular.directives', ['tubular.services'])
      .directive('appVersion', ['version', (version) =>
        (scope, elm, attrs) =>
          elm.text(version)
    ])
)
